import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:quiver/cache.dart';
import 'package:supabase/supabase.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mgp_client/blones/app_blone.dart';
import 'package:mgp_client/blones/blone.dart';
import 'collection_blone.dart';

/// Fiches par contact
class FicheCollectionBlone extends SupabaseCollection<Fiche>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'fiche';

  @override
  Fiche elementFromJson(JsonMap json) => Fiche.fromJson(json);

  @override
  JsonMap elementToJson(Fiche value) => value.toJson();

  Fiche create({
    required String atelierId,
    required String contactId,
    required String demarcheId,
    required String fluxId,
  }) =>
      Fiche(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
        fluxId: fluxId,
        atelierId: atelierId,
        contactId: contactId,
      );

  Future<Iterable<FicheSnippet>> getSnippetsForContactAndAtelier({
    required String atelierId,
    required String contactId,
    required String demarcheId,
    String? latestFicheModifiedAt,
  }) async {
    final fiches = await getFichesForContactAndAtelier(
      atelierId: atelierId,
      contactId: contactId,
      demarcheId: demarcheId,
      latestFicheModifiedAt: latestFicheModifiedAt,
    );
    final snippets = [
      for (final fiche in fiches) await getSnippet(ficheId: fiche.id)
    ];
    return snippets;
  }

  Future<Iterable<FicheSnippet>> getSnippetsForAtelier({
    required String atelierId,
  }) async {
    final data = await client.rpc('atelier_fiche_snippets', params: {
      'atelier_id': atelierId,
    });

    final snippets = [for (final json in data) FicheSnippet.fromJson(json)];
    return snippets;
  }

  final contactFicheCache = MapCache<String, Iterable<Fiche>>();

  Future<Iterable<Fiche>> getFichesForContactAndAtelier({
    required String atelierId,
    required String contactId,
    required String demarcheId,
    required String? latestFicheModifiedAt,
  }) async {
    final filter = demarcheId + atelierId + contactId;
    final key = '$filter/$latestFicheModifiedAt';
    final fiches = await contactFicheCache.get(key, ifAbsent: (key) async {
      final data =
          await fromTable.select().eq('realtime_contact_filter', filter);
      final fiches = data
          .map((e) => elementFromJson(e))
          .whereNot((fiche) => fiche.isEmpty)
          .toList();
      return fiches;
    });
    return fiches!;
  }

  String? filter;
  SupabaseStreamBuilder? fichesStreamController;

  final snippetCache = MapCache<String, FicheSnippet>();

  Future<FicheSnippet> getSnippet({
    required String ficheId,
  }) async {
    final snippet = await snippetCache.get(
      ficheId,
      ifAbsent: (id) async {
        final data = await client.rpc(
          'fiche_snippet',
          params: {'fiche_id': ficheId},
        ).single();
        return FicheSnippet.fromJson(data);
      },
    );
    return snippet!;
  }

  /// Create a fiche and subscribe to its snippet.
  Future<FicheSnippet> createSnippet({
    required String demarcheId,
    required String atelierId,
    required String contactId,
    required String etablissementId,
  }) async {
    final flux = parent.flux.create(
      demarcheId: demarcheId,
      atelierId: atelierId,
      contactId: contactId,
      etablissementId: etablissementId,
    );
    await parent.flux.save(flux);

    final fiche = create(
      demarcheId: demarcheId,
      atelierId: atelierId,
      contactId: contactId,
      fluxId: flux.id,
    );
    await save(fiche);
    return getSnippet(ficheId: fiche.id);
  }

  Future<void> saveLiens(
    Fiche fiche,
    Flux flux,
    Iterable<LienFiche> liens,
    Iterable<ContactSnippet> participants,
  ) async {
    for (final lien in liens) {
      // B contact wasn't set.
      if (lien.contactBId == null) continue;
      // if Fiche B is null, we insert.
      if (lien.ficheBId == null) {
        final contactB = participants
            .firstWhere((snippet) => snippet.contact.id == lien.contactBId);

        final mirrorFlux = flux.copyWith(
          id: SupabaseCollection.uuid.v4(),
          contactId: contactB.contact.id,
          etablissementId: contactB.contact.etablissementId,
          quantite: lien.quantiteB ?? 0,
          direction: lien.directionB ?? FluxDirection.entrant,
          unite: lien.uniteB,
        );
        await parent.flux.save(mirrorFlux);

        final mirrorFiche = fiche.copyWith(
          id: SupabaseCollection.uuid.v4(),
          contactId: mirrorFlux.contactId,
          fluxId: mirrorFlux.id,
          commentaire:
              'Lien de ${contactB.entreprise.entreprise.denomination}: '
              '${lien.nature ?? ''}',
        );
        await save(mirrorFiche);

        var participantMeta = await parent.participantMeta.fetchOrCreate(
          demarcheId: fiche.demarcheId,
          atelierId: fiche.atelierId,
          contactId: contactB.contact.id,
        );
        participantMeta = participantMeta.copyWith(thematiqueIds: [
          ...participantMeta.thematiqueIds,
          ...fiche.thematiqueIds,
        ]);
        await parent.participantMeta.save(participantMeta);

        final value = lien.copyWith(
          quantiteA: flux.quantite,
          directionA: flux.direction,
          ficheBId: mirrorFiche.id,
          uniteA: flux.unite,
        );
        await parent.liensFiches.save(value);

        await invalidate(
          demarcheId: fiche.demarcheId,
          atelierId: fiche.atelierId,
          contactId: contactB.contact.id,
          notify: false,
        );
      }

      // Else we update the quantité
      else if (lien.ficheAId == fiche.id) {
        // update fiche A quantité
        await parent.liensFiches.fromTable
            .update({'quantite_a': flux.quantite, 'flux_unite_a': flux.unite})
            .eq('fiche_a_id', fiche.id)
            .eq('demarche_id', fiche.demarcheId);
        await invalidate(
          demarcheId: fiche.demarcheId,
          atelierId: fiche.atelierId,
          contactId: lien.contactAId,
          ficheId: lien.ficheAId,
          notify: false,
        );
      } else if (lien.ficheBId == fiche.id) {
        // update fiche B quantité
        await parent.liensFiches.fromTable
            .update({'quantite_b': flux.quantite, 'flux_unite_b': flux.unite})
            .eq('fiche_b_id', fiche.id)
            .eq('demarche_id', fiche.demarcheId);
        if (lien.contactBId != null) {
          await invalidate(
            demarcheId: fiche.demarcheId,
            atelierId: fiche.atelierId,
            contactId: lien.contactBId!,
            ficheId: lien.ficheBId,
            notify: false,
          );
        }
      }
    }
  }

  Stream<FicheSnippet> subscribeToSnippet(String ficheId) async* {
    await for (final _ in subscribe(ficheId)) {
      yield await getSnippet(ficheId: ficheId);
    }
  }

  Stream<Fiche> subscribe(String ficheId) async* {
    final stream =
        client.from(tableName).stream(primaryKey: ['id']).eq('id', ficheId);
    await for (final list in stream) {
      if (list.isNotEmpty) {
        yield elementFromJson(list.first);
      } else {
        logError('$tableName listen: no element for fiche $ficheId');
      }
    }
  }

  Future<Iterable<Fiche>> getByAtelier({
    required String atelierId,
  }) async {
    final data = await fromTable.select().eq('atelier_id', atelierId);
    return data.map(elementFromJson);
  }

  Future<void> saveEditables({
    required AtelierSnippet atelier,
    required EditableFiche fiche,
    required EditableFlux flux,
    required ContactSnippet contact,
    required Iterable<LienFiche> liens,
    EditableParticipantMeta? meta,
  }) async {
    meta?.updateThematiqueIds([
      ...fiche.value.thematiqueIds,
      ...meta.value.thematiqueIds,
    ]);

    flux.updateThematiqueIds(fiche.value.thematiqueIds);
    flux.commentaire.update(fiche.commentaire.value);

    await Future.wait([
      save(fiche.value),
      parent.flux.save(flux.value),
      saveLiens(
        fiche.value,
        flux.value,
        liens,
        atelier.participants,
      ),
    ]);
    await invalidate(
      demarcheId: fiche.value.demarcheId,
      atelierId: fiche.value.atelierId,
      contactId: fiche.value.contactId,
      ficheId: fiche.value.id,
    );
  }

  Future<void> invalidate({
    required String demarcheId,
    required String atelierId,
    required String contactId,
    String? ficheId,
    bool notify = true,
  }) async {
    if (ficheId != null) {
      await cache.invalidate(ficheId);
      await snippetCache.invalidate(ficheId);
    }
    await contactFicheCache.invalidate(demarcheId + atelierId + contactId);
    if (notify) notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:supabase/supabase.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../app_blone.dart';
import '../blone.dart';
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

  /// Get fiches for a contact in a atelier
  Stream<Iterable<FicheSnippet>> watchSnippetsForContactAndAtelier({
    required String atelierId,
    required String contactId,
    required String demarcheId,
  }) async* {
    final changes = watchForContactAndAtelier(
        atelierId: atelierId, contactId: contactId, demarcheId: demarcheId);
    await for (var data in changes) {
      final snippets = [
        for (final fiche in data) await getSnippet(ficheId: fiche.id)
      ];
      yield snippets.toList(growable: false);
    }
  }

  Stream<Iterable<Fiche>> watchForContactAndAtelier({
    required String atelierId,
    required String contactId,
    required String demarcheId,
  }) async* {
    final filter = demarcheId + atelierId + contactId;
    try {
      final data =
          await fromTable.select().eq('realtime_contact_filter', filter);
      final fiches = data.map((e) => elementFromJson(e));
      yield fiches.toList(growable: false);
    } on PostgrestException catch (_) {}

    final changes = fromTable
        .stream(primaryKey: ['id']).eq('realtime_contact_filter', filter);
    await for (var data in changes) {
      final fiches = data.map((e) => elementFromJson(e));
      yield fiches.toList(growable: false);
    }
  }

  Future<FicheSnippet> getSnippet({
    required String ficheId,
  }) async {
    final data = await client.rpc('fiche_snippet', params: {
      'fiche_id': ficheId,
    }).single();
    return FicheSnippet.fromJson(data);
  }

  /// Create a fiche and subscribe to its snippet.
  Stream<FicheSnippet> createSnippet({
    required String demarcheId,
    required String atelierId,
    required String contactId,
    required String etablissementId,
  }) async* {
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
    yield* subscribeToSnippet(fiche.id);
  }

  /// Create mirror fiches from a fiche and a list of participants
  Future<void> createMirrors(
    Fiche fiche,
    Flux flux,
    ContactSnippet contact,
    List<ContactSnippet> participants,
  ) async {
    logMessage('creating mirrors for ${participants.length} participants');
    save(
      fiche.copyWith(
        commentaire: fiche.commentaire +
            "\nExpression d’un intérêt partagé par «" +
            [
              for (final participant in participants)
                participant.entreprise.entreprise.denomination
            ].join(', ') +
            '».',
      ),
    );

    for (final participant in participants) {
      final mirrorFlux = flux.copyWith(
        id: SupabaseCollection.uuid.v4(),
        contactId: participant.contact.id,
        etablissementId: participant.contact.etablissementId,
        direction: flux.direction == FluxDirection.entrant
            ? FluxDirection.sortant
            : FluxDirection.entrant,
      );
      await parent.flux.save(mirrorFlux);

      final mirrorFiche = fiche.copyWith(
        id: SupabaseCollection.uuid.v4(),
        contactId: mirrorFlux.contactId,
        fluxId: mirrorFlux.id,
        commentaire:
            '«Miroir de ${contact.entreprise.entreprise.denomination}: ${fiche.commentaire}»',
      );
      await save(mirrorFiche);

      var participantMeta = await parent.participantMeta.fetchOrCreate(
        demarcheId: fiche.demarcheId,
        atelierId: fiche.atelierId,
        contactId: participant.contact.id,
      );
      participantMeta = participantMeta.copyWith(thematiqueIds: [
        ...participantMeta.thematiqueIds,
        ...fiche.thematiqueIds,
      ]);
      await parent.participantMeta.save(participantMeta);
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

  Stream<Iterable<Fiche>> subscribeByAtelier({
    required String atelierId,
  }) {
    return client
        .from('$tableName:atelier_id=eq.$atelierId')
        .stream(primaryKey: ['id']).map((list) => list.map(elementFromJson));
  }

  Future<void> saveEditables({
    required EditableFiche fiche,
    required EditableFlux flux,
    required ContactSnippet contact,
    required List<ContactSnippet> mirrorParticipants,
    EditableParticipantMeta? meta,
  }) async {
    meta?.updateThematiqueIds([
      ...fiche.value.thematiqueIds,
      ...meta.value.thematiqueIds,
    ]);

    flux.updateThematiqueIds(fiche.value.thematiqueIds);
    flux.commentaire.update(fiche.commentaire.value);

    await Future.wait([
      if (mirrorParticipants.isEmpty) save(fiche.value),
      parent.flux.save(flux.value),
      if (mirrorParticipants.isNotEmpty)
        createMirrors(
          fiche.value,
          flux.value,
          contact,
          mirrorParticipants,
        )
    ]);
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:quiver/cache.dart';
import 'package:supabase/supabase.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../../models/ui_message.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

class AtelierCollectionBlone extends SupabaseCollection<Atelier>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'atelier';

  @override
  Atelier elementFromJson(JsonMap json) => Atelier.fromJson(json);

  @override
  JsonMap elementToJson(Atelier value) => value.toJson();

  Atelier create({
    required String demarcheId,
    String? animateurId,
  }) =>
      Atelier(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
        animateurIds: animateurId == null ? [] : [animateurId],
        dateMs: DateTime.now().millisecondsSinceEpoch,
      );

  final snippetCache = MapCache<String, AtelierSnippet>.lru(maximumSize: 10);
  Future<AtelierSnippet> getSnippet({
    required String atelierId,
  }) async {
    final snippet =
        await snippetCache.get(atelierId, ifAbsent: (atelierId) async {
      final data = await client.rpc('atelier_snippet', params: {
        'atelier_id': atelierId,
      }).single();
      return AtelierSnippet.fromJson(data);
    });

    return snippet!;
  }

  Stream<AtelierSnippet> createSnippet({
    required String demarcheId,
    String? animateurId,
  }) async* {
    final atelier = create(demarcheId: demarcheId, animateurId: animateurId);
    await save(atelier);
    yield* subscribeToSnippet(atelier.id);
  }

  Stream<AtelierSnippet> subscribeToSnippet(String atelierId) async* {
    await for (final _ in subscribe(atelierId)) {
      logMessage('Atelier have changed');
      snippetCache.invalidate(atelierId);
      yield await getSnippet(atelierId: atelierId);
    }
  }

  Stream<Atelier> subscribe(String atelierId) async* {
    final stream =
        client.from(tableName).stream(primaryKey: ['id']).eq('id', atelierId);

    try {
      final existing = await getById(atelierId);
      yield existing;
    } on PostgrestException catch (_) {}

    await for (final list in stream) {
      if (list.isNotEmpty) {
        yield elementFromJson(list.first);
      } else {
        logError('$tableName listen: no element for atelier $atelierId');
      }
    }
  }

  Future<List<Atelier>> getAll({required String demarcheId}) async {
    final data =
        await fromTable.select().eq('demarche_id', demarcheId).order('date_ms');
    final ateliers = data.map((e) => elementFromJson(e));
    return ateliers.toList(growable: false);
  }

  @override
  Future<bool> delete(String id) async {
    final success = await super.delete(id);
    if (success) {
      parent.showMessage(const UIMessage.save("L'atelier à bien été supprimé"));
    } else {
      parent.showMessage(const UIMessage.error(
          "L'atelier n'a pas été supprimé car il contient déjà des données"));
    }

    notifyListeners();
    return success;
  }

  @override
  Future<bool> save(Atelier value) async {
    final success = await super.save(value);
    if (success) {
      parent
          .showMessage(const UIMessage.save("L'atelier à bien été enregistré"));
    } else {
      parent.showMessage(
          const UIMessage.error("L'atelier n'a pas été enregistré."));
    }

    snippetCache.invalidate(value.id);
    return success;
  }

  /// Save atelier and update participants in a single atomic operation
  /// This uses the new RPC function update_atelier_with_participants
  Future<bool> saveAtelierWithParticipants({
    required Atelier atelier,
    required List<String> participantIds,
  }) async {
    // Validate participant list to prevent accidental data loss
    if (participantIds.isEmpty) {
      try {
        final snippet = await getSnippet(atelierId: atelier.id);
        if (snippet.participants.isNotEmpty) {
          parent.showMessage(const UIMessage.plain(
            "La liste des participants semble vide alors que l'atelier en contient. Aucune modification n'a été effectuée."
          ));
          return false;
        }
      } catch (e) {
        logError("Error fetching atelier snippet: $e");
      }
    }

    try {
      await client.rpc(
        'update_atelier_with_participants',
        params: {
          'atelier_data': elementToJson(atelier),
          'new_participants': participantIds,
        },
      );

      parent.showMessage(const UIMessage.save("L'atelier et ses participants ont bien été enregistrés"));
      snippetCache.invalidate(atelier.id);
      return true;
    } on PostgrestException catch (e) {
      parent.showMessage(UIMessage.error("Erreur lors de la mise à jour de l'atelier : ${e.message}"));
      return false;
    }
  }
}

/// Metadata par atelier pour chaque participant
class ParticipantMetaCollectionBlone extends SupabaseCollection<ParticipantMeta>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'participant_meta';

  @override
  ParticipantMeta elementFromJson(JsonMap json) =>
      ParticipantMeta.fromJson(json);

  @override
  JsonMap elementToJson(ParticipantMeta value) => value.toJson();

  ParticipantMeta create({
    required String demarcheId,
    required String atelierId,
    required String contactId,
  }) =>
      ParticipantMeta(
        demarcheId: demarcheId,
        atelierId: atelierId,
        contactId: contactId,
      );

  Future<ParticipantMeta> fetchOrCreate({
    required String demarcheId,
    required String atelierId,
    required String contactId,
  }) async {
    try {
      final data = await fromTable
          .select()
          .eq('demarche_id', demarcheId)
          .eq('atelier_id', atelierId)
          .eq('contact_id', contactId)
          .single();

      final participantMeta = elementFromJson(data);
      return participantMeta;
    } on PostgrestException catch (_) {
      final participantMeta = create(
        demarcheId: demarcheId,
        atelierId: atelierId,
        contactId: contactId,
      );
      await save(participantMeta);
      return participantMeta;
    }
  }

  Future<bool> setParticipants({
    required String demarcheId,
    required String atelierId,
    required List<String> participantIds,
  }) async {
    // Client-side protection against empty participant lists
    if (participantIds.isEmpty) {
      // Fetch current participants to verify if this is a potential data loss
      final currentParticipants = await getByAtelier(atelierId: atelierId);
      if (currentParticipants.isNotEmpty) {
        parent.showMessage(const UIMessage.saveError(
          "La liste des participants semble vide. Aucune modification n'a été effectuée pour éviter la perte de données."
        ));
        return false;
      }
    }

    try {
      await client.rpc(
        'set_atelier_participants',
        params: {
          'demarche_id': demarcheId,
          'atelier_id': atelierId,
          'new_participants': participantIds,
        },
      ).select();
      return true;
    } on PostgrestException catch (e) {
      parent.showMessage(UIMessage.error("Erreur lors de la mise à jour des participants : ${e.message}"));
      return false;
    }
  }

  Future<ParticipantMeta> getByAtelierAndContact({
    required String atelierId,
    required String contactId,
  }) async {
    final data = await fromTable.select().match({
      'atelier_id': atelierId,
      'contact_id': contactId,
    });
    assert(data.isNotEmpty);
    return elementFromJson(data.first);
  }

  Future<Iterable<ParticipantMeta>> getByAtelier({
    required String atelierId,
  }) async {
    final data = await fromTable.select().match({
      'atelier_id': atelierId,
    });
    assert(data.isNotEmpty);
    return data.map((e) => elementFromJson(e));
  }
}

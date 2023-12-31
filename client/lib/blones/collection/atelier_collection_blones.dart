import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
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

  Future<AtelierSnippet> getSnippet({
    required String atelierId,
  }) async {
    final data = await client.rpc('atelier_snippet', params: {
      'atelier_id': atelierId,
    }).single();
    return AtelierSnippet.fromJson(data);
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

    return success;
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

  Stream<Iterable<ParticipantMeta>> subscribeByAtelier({
    required String atelierId,
  }) async* {
    try {
      final existingParticipants =
          await fromTable.select().eq('atelier_id', atelierId);
      yield [for (var e in existingParticipants) elementFromJson(e)];
    } on PostgrestException catch (_) {}

    final changes = fromTable.stream(
        primaryKey: ['atelier_id', 'contact_id']).eq('atelier_id', atelierId);

    await for (var participants in changes) {
      yield [for (var e in participants) elementFromJson(e)];
    }
  }

  Future<void> setParticipants({
    required String demarcheId,
    required String atelierId,
    required List<String> participantIds,
  }) async {
    final metas =
        participantIds.map((contactId) => parent.participantMeta.create(
              demarcheId: demarcheId,
              atelierId: atelierId,
              contactId: contactId,
            ));
    final results = await Future.wait(metas.map((meta) => insert([meta])));

    print(
        '${results.whereNot((success) => success)} on ${results.length} where not inserted');
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

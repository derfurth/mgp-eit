import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

// --------------------------------------------
// Synergies
// --------------------------------------------

class SynergieCollectionBlone extends SupabaseCollection<Synergie>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'synergie';

  @override
  Synergie elementFromJson(JsonMap json) => Synergie.fromJson(json);

  @override
  JsonMap elementToJson(Synergie value) => value.toJson();

  Synergie create({required String demarcheId}) => Synergie(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
      );

  Future<List<Synergie>> getAll({required String demarcheId}) async {
    final data =
        await fromTable.select().eq('demarche_id', demarcheId).select();
    final synergies = data.map((e) => elementFromJson(e)).toList();
    return synergies;
  }

  Future<Iterable<Synergie>> search({
    required String demarcheId,
    required String needle,
  }) async {
    final synergies = await getAll(demarcheId: demarcheId);
    needle = needle.trim().toLowerCase();

    if (needle.isEmpty) return synergies;

    return synergies
        .where((synergie) => synergie.nom.toLowerCase().contains(needle));
  }

  Future<SynergieSnippet> getSnippet({required String fluxId}) async {
    final synergie = await getById(fluxId);
    final flux = await Future.wait(synergie.fluxIds.map(parent.flux.getById));
    return SynergieSnippet(
      synergie: synergie,
      flux: flux,
    );
  }

  Stream<Synergie> subscribe(String synergieId) async* {
    final stream =
        client.from(tableName).stream(primaryKey: ['id']).eq('id', synergieId);
    await for (final list in stream) {
      if (list.isNotEmpty) {
        yield elementFromJson(list.first);
      } else {
        logError('$tableName listen: no element for fiche $synergieId');
      }
    }
  }

  Stream<SynergieSnippet> subscribeToSnippet(String synergieId) async* {
    await for (final _ in subscribe(synergieId)) {
      yield await getSnippet(fluxId: synergieId);
    }
  }

  Stream<SynergieSnippet> createSnippet({
    required String demarcheId,
  }) async* {
    final synergie = create(demarcheId: demarcheId);
    await save(synergie);
    yield* subscribeToSnippet(synergie.id);
  }
}

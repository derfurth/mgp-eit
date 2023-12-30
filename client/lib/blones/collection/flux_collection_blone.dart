import 'package:flutter/foundation.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

class FluxCollectionBlone extends SupabaseCollection<Flux>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'flux';

  @override
  Flux elementFromJson(JsonMap json) => Flux.fromJson(json);

  @override
  JsonMap elementToJson(Flux value) => value.toJson();

  Flux create({
    required String demarcheId,
    required String contactId,
    required String atelierId,
    required String etablissementId,
  }) =>
      Flux(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
        contactId: contactId,
        atelierId: atelierId,
        etablissementId: etablissementId,
      );

  Future<List<Flux>> getAll({required String demarcheId}) async {
    final data =
        await fromTable.select().eq('demarche_id', demarcheId).select();
    final fluxes = data.map((e) => elementFromJson(e)).toList();
    return fluxes;
  }

  /// Returns a list of snippets matching [needle]
  Future<Iterable<Flux>> search({
    required demarcheId,
    required String needle,
  }) async {
    final fluxes = await getAll(demarcheId: demarcheId);
    needle = needle.trim().toLowerCase();

    if (needle.isEmpty) return fluxes;

    return fluxes.where(
      (flux) =>
          flux.resourceNom.toLowerCase().contains(needle) ||
          flux.thematiqueIds.any((t) => t.contains(needle)),
    );
  }

  Future<FluxSnippet> getSnippet({required String fluxId}) async {
    final data = await client.rpc('flux_snippet', params: {
      'flux_id': fluxId,
    }).single();
    return FluxSnippet.fromJson(data);
  }

  Future<FluxSnippet> createSnippet({
    required String demarcheId,
    required String contactId,
    required String atelierId,
    required String etablissementId,
  }) async {
    final flux = create(
      demarcheId: demarcheId,
      contactId: contactId,
      atelierId: atelierId,
      etablissementId: etablissementId,
    );
    await save(flux);
    return getSnippet(fluxId: flux.id);
  }
}

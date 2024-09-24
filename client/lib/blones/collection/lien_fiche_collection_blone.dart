import 'package:flutter/foundation.dart';

import '../../models/donnees.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

class LienFicheCollectionBlone extends SupabaseCollection<LienFiche>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'lien_fiche';

  @override
  LienFiche elementFromJson(JsonMap json) => LienFiche.fromJson(json);

  @override
  JsonMap elementToJson(LienFiche value) => value.toJson();

  Future<List<LienFiche>> getAll({required String demarcheId}) async {
    final data = await fromTable.select().eq('demarche_id', demarcheId);
    final lienFiches = data.map((e) => elementFromJson(e)).toList();
    return lienFiches;
  }

  Future<List<LienFiche>> getForFiche({
    required String demarcheId,
    required String ficheId,
  }) async {
    final data = await fromTable
        .select()
        .eq('demarche_id', demarcheId)
        .or('fiche_a_id.eq.$ficheId,fiche_b_id.eq.$ficheId');
    final lienFiches = data.map((e) => elementFromJson(e)).toList();
    return lienFiches;
  }

  Future<void> deleteForFiches(String ficheAId, String ficheBId) async {
    await fromTable
        .delete()
        .eq('fiche_a_id', ficheAId)
        .eq('fiche_b_id', ficheBId);
  }

  Future<Iterable<LienFiche>> getForAtelier({
    required String demarcheId,
    required String atelierId,
  }) async {
    final data = await fromTable
        .select()
        .eq('demarche_id', demarcheId)
        .eq('atelier_id', atelierId);
    final lienFiches = data.map((e) => elementFromJson(e)).toList();
    return lienFiches;
  }
}

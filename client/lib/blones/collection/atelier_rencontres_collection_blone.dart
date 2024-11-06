import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

import '../../models/donnees.dart';
import '../../models/ui_message.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

class AtelierRencontresCollectionBlone
    extends SupabaseCollection<AtelierRencontres>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'atelier_rencontres';

  @override
  AtelierRencontres elementFromJson(JsonMap json) =>
      AtelierRencontres.fromJson(json);

  @override
  JsonMap elementToJson(AtelierRencontres value) => value.toJson();

  Future<AtelierRencontres> getForAtelier({
    required String demarcheId,
    required String atelierId,
  }) async {
    final data = await fromTable.select().match({
      'demarche_id': demarcheId,
      'atelier_id': atelierId,
    }).maybeSingle();

    if (data == null) {
      return AtelierRencontres(
        demarcheId: demarcheId,
        atelierId: atelierId,
      );
    }

    return AtelierRencontres.fromJson(data);
  }

  @override
  Future<bool> save(AtelierRencontres value) async {
    final serialized = elementToJson(value);
    try {
      await fromTable.upsert(serialized, onConflict: 'atelier_id,demarche_id');
      parent.showMessage(const UIMessage.save('Paramètres enregistrés'));
    } on PostgrestException catch (e) {
      parent.showMessage(UIMessage.error("Erreur : ${e.message}"));
      return false;
    }
    return true;
  }
}

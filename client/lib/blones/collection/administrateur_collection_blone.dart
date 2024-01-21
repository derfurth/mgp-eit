import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

import '../../models/donnees.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

/// Administrateurs
class AdministrateurCollectionBlone extends SupabaseCollection<Administrateur>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'administrateur';

  @override
  Administrateur elementFromJson(JsonMap json) => Administrateur.fromJson(json);

  @override
  JsonMap elementToJson(Administrateur value) => value.toJson();

  Administrateur create() => Administrateur(id: SupabaseCollection.uuid.v4());

  Future<bool> claim({required String administrateurId}) async {
    try {
      await client.rpc('claim_administrateur', params: {
        'administrateur_id': administrateurId,
      });
    } on PostgrestException catch (_) {
      return false;
    }
    return true;
  }

  Future<Iterable<Administrateur>> getAll() async {
    final data = await fromTable.select().select();
    final administrateurs = data.map((e) => elementFromJson(e)).toList();
    return administrateurs;
  }
}

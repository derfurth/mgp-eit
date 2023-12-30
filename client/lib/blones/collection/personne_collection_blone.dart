import 'package:flutter/foundation.dart';

import '../../models/donnees.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

/// La seule donnée comprenant des DCPs
class PersonneCollectionBlone extends SupabaseCollection<Personne>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'personne';

  @override
  Personne elementFromJson(JsonMap json) => Personne.fromJson(json);

  @override
  JsonMap elementToJson(Personne value) => value.toJson();

  Personne create({required String demarcheId}) =>
      Personne(id: SupabaseCollection.uuid.v4(), demarcheId: demarcheId);
}

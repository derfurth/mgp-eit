import 'package:flutter/foundation.dart';

import '../../models/donnees.dart';
import '../../models/invitation.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

class DemarcheCollectionBlone extends SupabaseCollection<Demarche>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'demarche';

  @override
  Demarche elementFromJson(JsonMap json) => Demarche.fromJson(json);

  @override
  JsonMap elementToJson(Demarche value) => value.toJson();

  Demarche create() => Demarche(id: SupabaseCollection.uuid.v4());

  Future<Iterable<Demarche>> getMine() async {
    final data = await client.rpc('my_demarches').select();
    return data.map((e) => elementFromJson(e));
  }

  Future<bool> acceptInvitation(DemarcheInvitation invitation) {
    return switch (invitation) {
      AnimateurInvitation() =>
        parent.animateurs.claim(animateurId: invitation.animateurId),
      CoAnimateurInvitation() =>
        parent.coAnimateurs.claim(coAnimateurId: invitation.coAnimateurId),
    };
  }
}

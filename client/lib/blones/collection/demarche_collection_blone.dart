import 'package:flutter/foundation.dart';
import 'package:mgp_client/models/authentication.dart';

import '../../models/donnees.dart';
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

  Future<bool> acceptInvitation(Invitation invitation) {
    return invitation.when(
      animateur: (animateurId, _) =>
          parent.animateurs.claim(animateurId: animateurId),
      coAnimateur: (coAnimateurId, _) =>
          parent.coAnimateurs.claim(coAnimateurId: coAnimateurId),
    );
  }
}

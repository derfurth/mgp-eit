import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_client/models/faked.dart';

void main() {
  test('faked DB', () {
    final db = FakedDB();
    db.fill(
      demarcheCount: 2,
      animateurCount: 3,
      coAnimateurCount: 5,
      entrepriseCount: 6,
      atelierCount: 8,
      synergieCount: 10,
    );

    expect(db.demarches.length, 2);
    expect(db.animateurs.length, 3 * 2);
    expect(db.coAnimateurs.length, 5 * 2);
    expect(db.entreprises.length, 6 * 2);
    expect(db.ateliers.length, 8 * 2);
    expect(db.synergies.length, 10 * 2);
  });
}

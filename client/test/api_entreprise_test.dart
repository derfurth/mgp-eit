import 'package:mgp_client/blones/api/recherche_entreprise.dart';
import 'package:test/test.dart';

void main() {
  group('RechercheEntrepriseApi', () {
    final RechercheEntrepriseApi api = RechercheEntrepriseApi();

    test('search for the term "rest"', () async {
      final Iterable<MatchingEntreprise> results = await api.search('rest');

      expect(results, isNotEmpty,
          reason: 'The search results should not be empty for the term "rest".');
      for (var entreprise in results) {
        print('SIREN: ${entreprise.siren}, Name: ${entreprise.nom}');
      }
    });

    test('search for the term "rest" in departement 12', () async {
      final Iterable<MatchingEntreprise> results = await api.search('rest', departement: '12');

      expect(results, isNotEmpty,
          reason: 'The search results should not be empty for the term "rest".');
      for (var entreprise in results) {
        print('SIREN: ${entreprise.siren}, Name: ${entreprise.nom}');
      }
    });
  });
}

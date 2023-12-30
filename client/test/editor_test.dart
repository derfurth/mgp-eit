import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_client/blones/collection/animation_collection_blones.dart';
import 'package:mgp_client/blones/collection/atelier_collection_blones.dart';
import 'package:mgp_client/blones/collection/demarche_collection_blone.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/blones/collection/fiche_collection_blone.dart';
import 'package:mgp_client/blones/collection/flux_collection_blone.dart';
import 'package:mgp_client/blones/collection/personne_collection_blone.dart';
import 'package:mgp_client/blones/collection/synergie_collection_blone.dart';
import 'package:mgp_client/data_widgets/editors/contact_editor.dart';
import 'package:mgp_client/data_widgets/editors/personne_editor.dart';
import 'package:mgp_client/models/editor_mode.dart';
import 'package:mgp_client/models/faked.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'editor_test.mocks.dart';
import 'test_scaffold.dart';

@GenerateNiceMocks([
  // DCPs
  MockSpec<PersonneCollectionBlone>(),

  // Animation
  MockSpec<DemarcheCollectionBlone>(),
  MockSpec<AnimateurCollectionBlone>(),
  MockSpec<CoAnimateurCollectionBlone>(),
  MockSpec<AtelierCollectionBlone>(),
  MockSpec<FicheCollectionBlone>(),

  // Entreprises
  MockSpec<EntrepriseCollectionBlone>(),
  MockSpec<EtablissementCollectionBlone>(),
  MockSpec<ContactCollectionBlone>(),

  // Synergies
  MockSpec<FluxCollectionBlone>(),
  MockSpec<SynergieCollectionBlone>(),
])
void main() {
  group('Editors', () {
    testWidgets('Personne', (WidgetTester tester) async {
      // data
      final personne = FakedPersonne().personne;

      // widget
      await tester.pumpWidget(
        TestScaffold(
          providers: [
            Provider.value(value: personne),
            Provider.value(value: EditorParams(mode: EditorMode.create)),
          ],
          child: const SingleChildScrollView(child: PersonneEditor()),
        ),
      );

      expect(find.text('Nouvelle personne'), findsOneWidget);
      expect(find.text(personne.prenom), findsOneWidget);
      expect(find.text(personne.nom), findsOneWidget);
    });

    testWidgets('Contact', (WidgetTester tester) async {
      // data
      final personne = FakedPersonne().personne;
      final contact = FakedContact().contact.copyWith(personneId: personne.id);
      final entreprise = FakedEntreprise().entreprise;
      final demarche = FakedDemarche().demarche;

      // mocks
      final contacts = MockContactCollectionBlone();
      final personnes = MockPersonneCollectionBlone();
      final etablissements = MockEtablissementCollectionBlone();
      final entreprises = MockEntrepriseCollectionBlone();

      when(contacts.getSnippet(
        contactId: contact.id,
      )).thenAnswer(
        (_) async => ContactSnippet(
          personne: personne,
          contact: contact,
          entreprise:
              EntrepriseSnippet(entreprise: entreprise, etablissements: []),
        ),
      );

      when(entreprises.getSnippets(demarcheId: demarche.id)).thenAnswer(
        (_) async => [
          EntrepriseSnippet(entreprise: entreprise, etablissements: []),
        ],
      );

      // widget
      await tester.pumpWidget(
        TestScaffold(
          providers: [
            ChangeNotifierProvider<ContactCollectionBlone>.value(
              value: contacts,
            ),
            ChangeNotifierProvider<EtablissementCollectionBlone>.value(
              value: etablissements,
            ),
            ChangeNotifierProvider<PersonneCollectionBlone>.value(
              value: personnes,
            ),
            ChangeNotifierProvider<ContactCollectionBlone>.value(
              value: contacts,
            ),
            ChangeNotifierProvider<EntrepriseCollectionBlone>.value(
              value: entreprises,
            ),
            Provider.value(value: demarche),
          ],
          child: ContactEditor(contactId: contact.id),
        ),
      );

      expect(find.text('Nouveau contact'), findsNothing);

      await tester.pump(const Duration(milliseconds: 100)); // wait for

      // personne
      expect(find.widgetWithText(ElevatedButton, 'OK'), findsOneWidget);
      expect(find.text(personne.prenom), findsOneWidget);
      expect(find.text(personne.nom), findsOneWidget);

      // tester
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nom'),
        'Simpson',
      );
      final ok = find.widgetWithText(ElevatedButton, 'OK');
      await tester.ensureVisible(ok);
      await tester.tap(ok);

      verify(personnes.save(personne.copyWith(nom: 'Simpson'))).called(1);
    });
  });
}

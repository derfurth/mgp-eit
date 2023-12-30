import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/place.dart';
import 'package:mgp_client/data_widgets/editors/animateur_editor.dart';
import 'package:mgp_client/data_widgets/editors/atelier_editor.dart';
import 'package:mgp_client/data_widgets/editors/contact_editor.dart';
import 'package:mgp_client/data_widgets/editors/entreprise_editor.dart';
import 'package:mgp_client/data_widgets/editors/fiche_editor.dart';
import 'package:mgp_client/data_widgets/editors/flux_editor.dart';
import 'package:mgp_client/data_widgets/editors/personne_editor.dart';
import 'package:mgp_client/data_widgets/editors/synergie_editor.dart';
import 'package:mgp_client/models/build_in.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/editor_mode.dart';
import 'package:mgp_client/models/faked.dart';
import 'package:mgp_client/pages/demo_page.dart';
import 'package:provider/provider.dart';

final demos = [
  // --------------------------------------------
  // La seule donnée comprenant des DCPs
  // --------------------------------------------

  Place(
    path: '/demo/dcp/personne/editor',
    iconData: Icons.business,
    builder: (_) => DemoPage(children: [
      MultiProvider(
        providers: [
          Provider<EditorParams>.value(
              value: EditorParams(mode: EditorMode.create)),
          Provider<Personne>.value(value: FakedPersonne().personne),
        ],
        child: const PersonneEditor(),
      ),
    ]),
  ),

  // --------------------------------------------
  // Animation
  // --------------------------------------------
  Place(
    path: '/demo/animation/animateur/editor/:id',
    iconData: Icons.person,
    builder: (info) {
      final params = info.pathParameters;

      return DemoPage(children: [
        MultiProvider(
          providers: [
            Provider<EditorParams>.value(
              value: EditorParams(
                  mode: params.containsKey('id')
                      ? EditorMode.update
                      : EditorMode.create),
            ),
          ],
          child: AnimateurEditor(
            animateurId: params.containsKey('id') ? params['id'] : null,
          ),
        ),
      ]);
    },
  ),

  Place(
    path: '/demo/animation/atelier/editor',
    iconData: Icons.people,
    builder: (_) => DemoPage(children: [
      MultiProvider(
        providers: [
          Provider<EditorParams>.value(
              value: EditorParams(mode: EditorMode.create)),
          Provider<Demarche>.value(value: FakedDemarche().demarche)
        ],
        child: const AtelierEditor(),
      ),
    ]),
  ),

  Place(
    path: '/demo/animation/fiche/editor',
    iconData: Icons.people,
    builder: (_) => DemoPage(children: [
      MultiProvider(
        providers: [
          Provider<EditorParams>.value(
              value: EditorParams(mode: EditorMode.create)),
          Provider<Atelier>.value(value: FakedAtelier().atelier),
          Provider<Contact>.value(value: FakedContact().contact),
          FutureProvider<Thematiques>.value(
            value: BuildIn.thematiques,
            initialData: UnmodifiableListView<Thematique>([]),
          ),
          FutureProvider<Synapse>.value(
            value: BuildIn.synapse,
            initialData: UnmodifiableListView<ClassificationSynapse>([]),
          ),
        ],
        child: const FicheEditor(),
      ),
    ]),
  ),

  // --------------------------------------------
  // Entreprises
  // --------------------------------------------

  Place(
    path: '/demo/entreprises/entreprise/editor',
    iconData: Icons.business_center,
    builder: (_) => DemoPage(children: [
      MultiProvider(
        providers: [
          Provider<EditorParams>.value(
              value: EditorParams(mode: EditorMode.create)),
          Provider<Entreprise>.value(value: FakedEntreprise().entreprise),
        ],
        child: const EntrepriseEditor(),
      ),
    ]),
  ),
  Place(
    path: '/demo/entreprises/contact/editor/:id',
    iconData: Icons.person,
    builder: (info) {
      final params = info.pathParameters;

      return DemoPage(children: [
        MultiProvider(
          providers: [
            Provider<EditorParams>.value(
              value: EditorParams(
                  mode: params.containsKey('id')
                      ? EditorMode.update
                      : EditorMode.create),
            ),
          ],
          child: ContactEditor(
            etablissementId: fakeId(),
            contactId: params.containsKey('id') ? params['id'] : null,
          ),
        ),
      ]);
    },
  ),

  // --------------------------------------------
  // Synergies
  // --------------------------------------------

  Place(
    path: '/demo/synergies/flux/editor',
    iconData: Icons.autorenew,
    builder: (_) => const DemoPage(children: [FluxEditor()]),
  ),
  Place(
    path: '/demo/synergies/synergie/editor',
    iconData: Icons.all_inclusive,
    builder: (_) => const DemoPage(children: [SynergieEditor()]),
  ),
];

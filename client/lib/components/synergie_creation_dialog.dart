import 'package:flutter/material.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:provider/provider.dart';

import '../blones/collection/synergie_collection_blone.dart';
import '../data_widgets/editors/synergie_editor.dart';
import '../models/editables.dart';

Future<void> showNewSynergieUsingSelectionDialog(
  BuildContext context,
  Demarche demarche,
  List<FicheSnippet> selection,
) {
  final Demarche demarche = context.read();
  final SynergieCollectionBlone synergies = context.read();
  final synergie = synergies.create(demarcheId: demarche.id);

  final snippet = SynergieSnippet(
    synergie: synergie,
    flux: [for (final fiche in selection) fiche.flux],
  );

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Nouvelle synergie'),
        content: SizedBox(
          height: 800,
          width: 800,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<EditableSynergie>(
                  create: (_) => EditableSynergie(synergie)),
              Provider.value(value: demarche),
            ],
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SynergieForm(synergie: snippet),
              ),
            ),
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import '../../blones/collection/demarche_collection_blone.dart';
import '../../chauffeur/chauffeur.dart';
import '../../commands/show_message_command.dart';
import '../../components/future_loader.dart';
import '../../components/layout.dart';
import '../../models/donnees.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/ui_message.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import '../../styled_widgets/wrapper.dart';

class DemarcheEditor extends StatelessWidget {
  final String? demarcheId;

  const DemarcheEditor({
    super.key,
    this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final mode = demarcheId != null ? EditorMode.update : EditorMode.create;

    final AppTheme theme = context.watch();
    final DemarcheCollectionBlone demarches = context.watch();

    Future<Demarche> getDemarche() async {
      if (mode == EditorMode.create) {
        return demarches.create();
      } else {
        return demarches.getById(demarcheId!);
      }
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(
            mode == EditorMode.create ? 'Nouvelle démarche' : 'Démarche'),
      ),
      child: PaddedSingleChildScrollable(
        child: Column(
          children: [
            FutureLoader<Demarche>(
                future: getDemarche(),
                builder: (context, snapshot) {
                  final demarche = snapshot.data;
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<EditableDemarche>(
                        create: (_) => EditableDemarche(demarche),
                      ),
                    ],
                    child: _DemarcheForm(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _DemarcheForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableDemarche demarche = context.watch();

    return Wrapper(children: [
      ...[
        demarche.denomination,
        demarche.champLibre,
      ].map(
        (field) => TextFormField(
          decoration: InputDecoration(
            labelText: field.label,
            filled: true,
          ),
          initialValue: field.value,
          validator: field.validator.call,
          onChanged: field.update,
        ),
      ),
      _SnippetSaveBar(),
    ]);
  }
}

class _SnippetSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableDemarche editable = context.watch();
    final DemarcheCollectionBlone blone = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () async {
            await blone.save(editable.value);
            ShowMessageCommand()
                .execute(const UIMessage.save('Demarche enregistrée'));
            chauffeur.chooseDemarche();
          },
          child: const Text('Enregistrer'),
        ),
        ElevatedButton(
          onPressed: () async {
            await blone.save(editable.value.copyWith(deleted: true));
            ShowMessageCommand()
                .execute(const UIMessage.save('Demarche supprimée'));
            chauffeur.chooseDemarche();
          },
          child: const Text('Supprimer'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:mgp_client/models/editor_mode.dart';
import 'package:mgp_client/styled_widgets/missing_widget.dart';
import 'package:provider/provider.dart';

/// The personne editor is to be embedded in other editor
/// although it can be used as a standalone for testing.
class PersonneEditor extends StatelessWidget {
  const PersonneEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final Personne personne = context.watch();
    final EditorParams params = context.watch();

    return Column(
      children: [
        if (!params.embedded) ...[
          if (params.mode == EditorMode.create)
            Text(
              'Nouvelle personne',
              style: Theme.of(context).textTheme.displaySmall,
            ),
        ],
        ChangeNotifierProvider(
          create: (_) => EditablePersonne(personne),
          child: Column(
            children: [
              const PersonneForm(),
              if (!params.embedded) _PersonneSaveBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class _PersonneSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditablePersonne personne = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            logMessage(personne.value.toString());
          },
          child: Text('OK ${personne.value.nom}'),
        ),
      ],
    );
  }
}

class PersonneForm extends StatelessWidget {
  const PersonneForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditablePersonne personne = context.watch();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        runSpacing: 20,
        children: [
          ...[
            personne.nom,
            personne.prenom,
            personne.email,
            personne.telephone,
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
          // todo add rgpd field
          const MissingWidget(title: Text('RGPD')),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mgp_client/blones/collection/administrateur_collection_blone.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import '../../chauffeur/chauffeur.dart';
import '../../chauffeur/places.dart';
import '../../commands/show_message_command.dart';
import '../../components/layout.dart';
import '../../environment.dart';
import '../../models/donnees.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/ui_message.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';

/// The administrateur editor is made of
///
/// - Personne editor
class AdministrateurEditor extends StatelessWidget {
  final String? administrateurId;

  const AdministrateurEditor({super.key, this.administrateurId});

  @override
  Widget build(BuildContext context) {
    final mode =
        administrateurId != null ? EditorMode.update : EditorMode.create;
    final AppTheme theme = context.watch();
    final AdministrateurCollectionBlone administrateurs = context.read();

    Future<Administrateur> getData() async {
      late final Administrateur administrateur;
      if (mode == EditorMode.create) {
        administrateur = administrateurs.create();
      } else {
        administrateur = await administrateurs.getById(administrateurId!);
      }
      return administrateur;
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(mode == EditorMode.create
            ? 'Nouvel administrateur'
            : 'Administrateur'),
      ),
      child: PaddedSingleChildScrollable(
        child: FutureBuilder<Administrateur>(
          future: getData(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) return const CircularProgressIndicator();
            return AdministrateurForm(
              administrateur: data,
            );
          },
        ),
      ),
    );
  }
}

/// Administrateur form
class AdministrateurForm extends StatelessWidget {
  final Administrateur administrateur;

  const AdministrateurForm({
    super.key,
    required this.administrateur,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => EditableAdministrateur(administrateur)),
      ],
      child: Column(
        children: [
          const _AdministrateurForm(),
          Leading.vMedium(),
          if (administrateur.userId == null) _AdministrateurInvitation(),
          _AdministrateurSaveBar(),
        ],
      ),
    );
  }
}

class _AdministrateurInvitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableAdministrateur administrateur = context.watch();

    final fullPath = (kIsWeb ? Environment.webUrl : 'not-web') +
        invitationAdministrateurPlace.path
            .replaceAll(':administrateurId', administrateur.value.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(fullPath),
        ButtonBar(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copier le lien'),
              onPressed: () => Clipboard.setData(ClipboardData(text: fullPath)),
            ),
            if (Environment.showSpikes)
              TextButton(
                onPressed: () => chauffeur.openAdministrateurInvitation(
                  administrateur.value.id,
                ),
                child: const Text('tester'),
              ),
          ],
        ),
      ],
    );
  }
}

class _AdministrateurSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableAdministrateur administrateur = context.watch();
    final AdministrateurCollectionBlone administrateurs = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Annuler'),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            final success = await administrateurs.save(administrateur.value);
            if (success) {
              ShowMessageCommand()
                  .execute(const UIMessage.save('Administrateur enregistré'));
              Navigator.pop(context, 'Enregistrer');
            } else {
              ShowMessageCommand().execute(const UIMessage.error(
                  "L'administrateur n'est pas enregistré"));
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class _AdministrateurForm extends StatelessWidget {
  const _AdministrateurForm();

  @override
  Widget build(BuildContext context) {
    final EditableAdministrateur administrateur = context.watch();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        runSpacing: 20,
        children: [
          ...[
            administrateur.nom,
            administrateur.prenom,
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
        ],
      ),
    );
  }
}

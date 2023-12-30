import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/commands/show_message_command.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/etablissement_editor.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/editable.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:mgp_client/models/editor_mode.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mgp_client/models/ui_message.dart';
import 'package:mgp_client/styled_widgets/heading.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/styled_widgets/padded_single_child_scrollable.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';
import 'package:provider/provider.dart';

import '../items/contact_item.dart';

class EntrepriseEditor extends StatelessWidget {
  final EditorMode mode;
  final String? entrepriseId;

  const EntrepriseEditor({
    super.key,
    this.mode = EditorMode.create,
    this.entrepriseId,
  });

  @override
  Widget build(BuildContext context) {
    final params = EditorParams(
      mode: entrepriseId != null ? EditorMode.update : EditorMode.create,
    );
    final AppTheme theme = context.watch();
    final EntrepriseCollectionBlone entreprises = context.read();
    final EtablissementCollectionBlone etablissements = context.read();
    final Demarche demarche = context.watch();

    /// The Snippet is a convenient way to display participants names etc.
    ///
    /// New snippets will pop here as the firebase collection is updated by
    /// widgets down the tree.
    Future<Entreprise> entreprise() async {
      if (params.mode == EditorMode.create) {
        final Demarche demarche = context.read();
        return entreprises.create(demarcheId: demarche.id);
      } else {
        return entreprises.getById(entrepriseId!);
      }
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(params.mode == EditorMode.create
            ? 'Nouvelle entreprise'
            : 'Entreprise'),
      ),
      child: PaddedSingleChildScrollable(
        child: Wrapper(
          children: [
            FutureLoader<Entreprise>(
                future: entreprise(),
                builder: (context, snapshot) {
                  final entreprise = snapshot.data;

                  return FutureLoader<Iterable<Etablissement>>(
                      future: etablissements.getOrCreateByEntrepriseId(
                        demarcheId: demarche.id,
                        entrepriseId: entreprise.id,
                      ),
                      builder: (context, snapshot) {
                        final list = snapshot.data;
                        return ChangeNotifierProvider<EditableEntreprise>(
                          create: (_) {
                            return EditableEntreprise(entreprise)
                              ..attachEtablissements(
                                  list.map((e) => EditableEtablissement(e)));
                          },
                          child: const EntrepriseForm(),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}

/// Entreprise form with access to:
///
///  - entreprise
///  - établissements
class EntrepriseForm extends StatelessWidget {
  const EntrepriseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableEntreprise entreprise = context.watch();
    final EtablissementCollectionBlone etablissements = context.watch();

    return Wrap(
      runSpacing: 20,
      children: [
        _EntrepriseProperties(),
        Column(
          children: [
            for (final etablissement in entreprise.etablissements)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Leading.vMedium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Heading.h5('Etablissement ${etablissement.siret.value}'),
                      OutlinedButton.icon(
                        onPressed: () => MapsLauncher.launchQuery(
                            etablissement.adressePostale),
                        label: const Text('carte'),
                        icon: const Icon(Icons.map),
                      ),
                    ],
                  ),
                  Leading.vHair(),
                  ChangeNotifierProvider<EditableEtablissement>.value(
                    value: etablissement,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const EtablissementForm(),
                        Leading.vMedium(),
                        Heading.h5("Contacts de l'établissement"),
                        const EtablissementContacts(),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        Center(
          child: TextButton.icon(
            onPressed: () {
              final etablissement = etablissements.create(
                demarcheId: entreprise.value.demarcheId,
                entrepriseId: entreprise.value.id,
              );
              final editable = EditableEtablissement(etablissement);
              entreprise.attachEtablissements([editable]);
            },
            icon: const Icon(Icons.add),
            label: const Text('Ajouter un établissement'),
          ),
        ),
        _EnterpriseSaveBar(),
      ],
    );
  }
}

class EtablissementContacts extends StatelessWidget {
  const EtablissementContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableEtablissement etablissement = context.watch();
    final Demarche demarche = context.watch();
    final ContactCollectionBlone contacts = context.watch();
    final EntrepriseCollectionBlone entreprises = context.watch();
    final EditableEntreprise entreprise = context.watch();
    final EtablissementCollectionBlone etablissements = context.watch();

    return Column(
      children: [
        FutureLoader<Iterable<ContactSnippet>>(
          future: contacts.getSnippetsForEtablissement(
              etablissementId: etablissement.value.id),
          builder: (context, snapshot) {
            final snippets = snapshot.data;
            return Column(
              children: [
                for (final snippet in snippets)
                  ContactItem(
                    snippet: snippet,
                    demarcheId: demarche.id,
                  ),
              ],
            );
          },
        ),
        TextButton.icon(
          onPressed: () async {
            await entreprises.save(entreprise.value);
            for (final etablissement in entreprise.etablissements) {
              await etablissements.save(etablissement.value);
            }

            chauffeur.createContact(
              demarche.id,
              etablissement.value.id,
            );
          },
          icon: const Icon(Icons.add),
          label: const Text("Ajouter un contact à l'établissement"),
        )
      ],
    );
  }
}

class _EntrepriseProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableEntreprise entreprise = context.watch();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        runSpacing: 20,
        children: [
          entreprise.siren.toTextFormField(),
          entreprise.denomination.toTextFormField(),
          entreprise.commentaire.toTextFormField(maxLines: 5),
        ],
      ),
    );
  }
}

class _EnterpriseSaveBar extends StatefulWidget {
  @override
  State<_EnterpriseSaveBar> createState() => _EnterpriseSaveBarState();
}

class _EnterpriseSaveBarState extends State<_EnterpriseSaveBar> {
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    final EditableEntreprise entreprise = context.watch();
    final EntrepriseCollectionBlone entreprises = context.watch();
    final EtablissementCollectionBlone etablissements = context.watch();
    final Demarche demarche = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () => chauffeur.contactsAndEntreprises(demarche.id),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: saving
              ? null
              : () async {
                  setState(() {
                    saving = true;
                  });
                  await entreprises.save(entreprise.value);
                  for (final etablissement in entreprise.etablissements) {
                    await etablissements.save(etablissement.value);
                  }
                  setState(() {
                    ShowMessageCommand().execute(
                        const UIMessage.save('Entreprise enregistrée'));
                    saving = false;
                  });
                },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

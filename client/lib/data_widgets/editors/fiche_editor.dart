import 'dart:collection';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/blones/rapport_blone.dart';
import 'package:mgp_client/commands/download_command.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../app_theme.dart';
import '../../blones/collection/fiche_collection_blone.dart';
import '../../blones/collection/flux_collection_blone.dart';
import '../../components/future_loader.dart';
import '../../components/synapse_dropdown.dart';
import '../../models/build_in.dart';
import '../../models/donnees.dart';
import '../../models/editable.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/snippets.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/wrapper.dart';

/// Hold contacts for creating 'mirrors fiches'
typedef ContactListNotifier = ValueNotifier<List<ContactSnippet>>;

/// Fiche Editor
///
/// Needs a [Contact] participant and an [Atelier] to be provided above.
/// It can also update [editableMeta] on save.
///
/// Made of
/// - Fiche form (saisie rapide)
/// - FluxInlineForm (flux details)
class FicheEditor extends StatelessWidget {
  final String? ficheId;
  final EditableParticipantMeta? editableMeta;

  const FicheEditor({
    super.key,
    this.ficheId,
    this.editableMeta,
  });

  @override
  Widget build(BuildContext context) {
    final FluxCollectionBlone flux = context.read();
    final FicheCollectionBlone fiches = context.read();
    final Demarche demarche = context.watch();
    final mode = ficheId != null ? EditorMode.update : EditorMode.create;

    /// The Snippet is a convenient way to display participants names etc.
    ///
    /// New snippets will pop here as the firebase collection is updated by
    /// widgets down the tree.
    Stream<FicheSnippet> snippets() {
      if (mode == EditorMode.create) {
        final AtelierSnippet atelier = context.read();
        final Contact participant = context.read();
        return fiches.createSnippet(
          demarcheId: demarche.id,
          atelierId: atelier.atelier.id,
          contactId: participant.id,
          etablissementId: participant.etablissementId,
        );
      } else {
        return fiches.subscribeToSnippet(ficheId!);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder<FicheSnippet>(
            stream: snippets(),
            builder: (context, snapshot) {
              final snippet = snapshot.data;
              if (snippet == null) {
                return const CircularProgressIndicator();
              }
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<EditableFiche>(
                      create: (_) => EditableFiche(snippet.fiche)),
                  Provider<FicheSnippet>.value(value: snippet),
                  FutureProvider<Thematiques>.value(
                    value: BuildIn.thematiques,
                    initialData: UnmodifiableListView<Thematique>([]),
                  ),
                  FutureProvider<Synapse>.value(
                    value: BuildIn.synapse,
                    initialData:
                        UnmodifiableListView<ClassificationSynapse>([]),
                  ),
                  ChangeNotifierProvider<ContactListNotifier>(
                    create: (_) => ContactListNotifier([]),
                  ),
                ],
                child: FutureLoader<Flux>(
                  future: flux.getById(snippet.fiche.fluxId),
                  builder: (context, snapshot) {
                    final flux = snapshot.data;
                    final EditableFiche fiche = context.watch();

                    return ChangeNotifierProvider(
                      create: (_) => EditableFlux(flux, fiche: fiche),
                      child: Wrapper(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: mode == EditorMode.create
                                    ? Heading.h4('Nouvelle fiche')
                                    : Heading.h4('Fiche'),
                              ),
                              const FluxDirectionForm(),
                            ],
                          ),
                          const FicheForm(),
                          const Divider(height: 32),
                          FluxInlineForm(flux: flux),
                          const Divider(height: 32),
                          _MirrorContactSelector(),
                          _FicheAndFluxSaveBar(editableMeta: editableMeta),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}

/// Fiche form, saisie rapide.
class FicheForm extends StatelessWidget {
  const FicheForm({super.key});

  @override
  Widget build(BuildContext context) {
    final FicheSnippet snippet = context.watch();
    final EditableFiche fiche = context.watch();
    final Thematiques thematiques = context.watch();

    return Wrapper.form(
      children: [
        Row(
          children: [
            Text(snippet.contact.personne.displayName).bold().padding(right: 5),
            Text(snippet.contact.entreprise.entreprise.denomination),
          ],
        ),
        fiche.thematiques.toChoiceChips(
          thematiques.map((t) => Choice(label: t.nom, value: t.id)),
        ),
        Leading.vMedium(),
        fiche.designation.toTextFormField(),
        fiche.commentaire.toTextFormField(maxLines: 5),
      ],
    );
  }
}

/// Flux direction form.
class FluxDirectionForm extends StatelessWidget {
  const FluxDirectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableFlux flux = context.watch();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<FluxDirection>(
          value: FluxDirection.entrant,
          groupValue: flux.value.direction,
          onChanged: (FluxDirection? direction) {
            if (direction != null) {
              flux.updateDirection(direction);
            }
          },
        ),
        const Text('Besoin'),
        Leading.hSmall(),
        Radio<FluxDirection>(
          value: FluxDirection.sortant,
          groupValue: flux.value.direction,
          onChanged: (FluxDirection? direction) {
            if (direction != null) {
              flux.updateDirection(direction);
            }
          },
        ),
        const Text('Offre'),
      ],
    );
  }
}

/// Flux inline form, saisie détaillée
class FluxInlineForm extends StatefulWidget {
  final Flux flux;

  const FluxInlineForm({super.key, required this.flux});

  @override
  State<FluxInlineForm> createState() => _FluxInlineFormState();
}

class _FluxInlineFormState extends State<FluxInlineForm> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EditableFlux flux = context.watch();
    final Synapse synapse = context.watch();
    final AppTheme theme = context.watch();
    final matches =
        synapse.where((c) => c.code == flux.value.resourceCodeSynapse);
    final selected = matches.isEmpty ? null : matches.first;
    controller.text = flux.resourceNom.value ?? '';

    return Wrapper.form(
      children: [
        Heading.section('Saisie du flux'),
        Row(children: [
          // use a custom text controller to allow one way binding
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: flux.resourceNom.label,
              filled: true,
            ),
            validator: flux.resourceNom.validator.call,
            onChanged: (fieldValue) => flux.update(
              flux.value.copyWith(resourceNom: fieldValue),
              notify: false,
            ),
            maxLines: 1,
          ).padding(right: theme.grid * 2).flexible(flex: 3),
          flux.quantite
              .toTextFormField()
              .padding(right: theme.grid * 2)
              .flexible(),
          flux.unite.toTextFormField().flexible(),
        ]),
        SynapseDropdown(
          selected: selected,
          onSelected: (classification) =>
              flux.updateResourceCodeSynapse(classification?.code ?? ''),
        ),
      ],
    );
  }
}

/// Allow the creation of mirrors.
class _MirrorContactSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FicheSnippet fiche = context.read();
    final ContactListNotifier selection = context.watch();
    final AtelierSnippet atelier = context.watch();
    final EditableFlux flux = context.watch();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpandablePanel(
        header: Heading.h6('Création de fiche miroir'),
        collapsed: Container(),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selection.value.isNotEmpty)
              Text('${selection.value.length} nouvelles'
                      ' fiches ${flux.value.direction == FluxDirection.entrant ? 'Offre' : 'Besoin'}'
                      ' seront crées pour ces participants.')
                  .padding(bottom: 5),
            Wrapper(
              size: .5,
              children: [
                for (final contact in atelier.participants
                    .where((p) => p.contact != fiche.contact.contact))
                  ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(contact.personne.displayName)
                            .bold()
                            .padding(right: 3),
                        Text(contact.entreprise.entreprise.denomination),
                      ],
                    ),
                    selected: selection.value.contains(contact),
                    onSelected: (bool selected) {
                      final choices = selection.value.toList();
                      if (choices.contains(contact)) {
                        choices.remove(contact);
                      } else {
                        choices.add(contact);
                      }
                      selection.value = choices;
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// Save both Fiche and Flux editable.
class _FicheAndFluxSaveBar extends StatelessWidget {
  final EditableParticipantMeta? editableMeta;

  const _FicheAndFluxSaveBar({
    this.editableMeta,
  });

  @override
  Widget build(BuildContext context) {
    final FicheSnippet snippet = context.watch();

    final EditableFiche fiche = context.watch();
    final EditableFlux flux = context.watch();
    final ContactListNotifier participants = context.watch();
    final FicheCollectionBlone fiches = context.watch();
    final FluxCollectionBlone fluxes = context.watch();

    return ButtonBar(
      children: [
        OutlinedButton.icon(
          onPressed: () async {
            final RapportBlone rapport = context.read();
            final csv = await rapport.fiche(fiche.value.id);
            DownloadCommand().execute(data: csv);
          },
          icon: const Icon(Icons.download),
          label: const Text('csv'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            fiches.saveEditables(
              fiche: fiche,
              flux: flux,
              contact: snippet.contact,
              mirrorParticipants: participants.value,
              meta: editableMeta,
            );

            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

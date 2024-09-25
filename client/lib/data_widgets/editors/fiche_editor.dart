import 'package:collection/collection.dart';
import 'package:collection_providers/collection_providers.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/blones/rapport_blone.dart';
import 'package:mgp_client/commands/download_command.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../app_theme.dart';
import '../../blones/collection/fiche_collection_blone.dart';
import '../../blones/collection/flux_collection_blone.dart';
import '../../blones/collection/lien_fiche_collection_blone.dart';
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
    final LienFicheCollectionBlone liens = context.read();
    final FicheCollectionBlone fiches = context.read();
    final Demarche demarche = context.watch();
    final mode = ficheId != null ? EditorMode.update : EditorMode.create;

    /// The Snippet is a convenient way to display participants names etc.
    ///
    /// New snippets will pop here as the firebase collection is updated by
    /// widgets down the tree.
    Future<FicheSnippet> snippets() {
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
        return fiches.getSnippet(ficheId: ficheId!);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FutureLoader<FicheSnippet>(
            future: snippets(),
            builder: (context, snapshot) {
              final snippet = snapshot.data;
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
                ],
                child: FutureLoader<List<LienFiche>>(
                    future: liens.getForFiche(
                      demarcheId: demarche.id,
                      ficheId: snippet.fiche.id,
                    ),
                    builder: (context, snapshot) {
                      final liens = snapshot.data;

                      return FutureLoader<Flux>(
                        future: flux.getById(snippet.fiche.fluxId),
                        builder: (context, snapshot) {
                          final flux = snapshot.data;
                          final EditableFiche fiche = context.watch();

                          return MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                  create: (_) =>
                                      EditableFlux(flux, fiche: fiche)),
                              CollectionProvider(
                                  create: (_) =>
                                      ListChangeNotifier<EditableLienFiche>([
                                        for (final lien in liens)
                                          EditableLienFiche(lien)
                                      ])),
                            ],
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
                                Leading.vSmall(),
                                FluxInlineForm(flux: flux),
                                // _MirrorContactSelector(),
                                Leading.vSmall(),
                                const LienFichesEditor(),
                                _FicheAndFluxSaveBar(
                                    editableMeta: editableMeta),
                              ],
                            ),
                          );
                        },
                      );
                    }),
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

/// Allow the creation of linked fiches.
class LienFichesEditor extends StatefulWidget {
  const LienFichesEditor({super.key});

  @override
  State<LienFichesEditor> createState() => _LienFichesEditorState();
}

class _LienFichesEditorState extends State<LienFichesEditor> {
  ListChangeNotifier<EditableLienFiche>? liens;

  void onEditableChange() {
    liens?.notifyListeners();
  }

  void listen(ListChangeNotifier<EditableLienFiche> liens) {
    stopListen();
    this.liens = liens;
    for (final editable in liens) {
      editable.addListener(onEditableChange);
    }
  }

  void stopListen() {
    if (liens != null) {
      for (final editable in liens!) {
        editable.removeListener(onEditableChange);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LienFicheCollectionBlone blone = context.read();
    final FicheSnippet fiche = context.read();
    final AtelierSnippet atelier = context.watch();
    final liens = CollectionProvider.of<ListChangeNotifier<EditableLienFiche>>(
      context,
      listen: true,
    );
    listen(liens);

    return Wrapper.form(
      children: [
        Heading.h6('Fiche liées'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Create a ListView.builder to display existing linked fiches
            for (final lien in liens)
              ChangeNotifierProvider.value(
                value: lien,
                child: LienFicheForm(
                  onDelete: () {
                    final ficheAId = lien.value.ficheAId;
                    final ficheBId = lien.value.ficheBId;
                    if (ficheBId != null) {
                      blone.deleteForFiches(ficheAId, ficheBId);
                    }
                    liens.remove(lien);
                  },
                ),
              ),
            // Create a button to add a new LinkedFicheForm
            ElevatedButton(
              onPressed: () {
                liens.add(EditableLienFiche(LienFiche(
                  demarcheId: atelier.atelier.demarcheId,
                  atelierId: atelier.atelier.id,
                  ficheAId: fiche.fiche.id,
                  contactAId: fiche.contact.contact.id,
                  directionA: fiche.flux.direction,
                  quantiteA: fiche.flux.quantite,
                  // Placeholders
                  ficheBId: null,
                  contactBId: null,
                  directionB: FluxDirection.sortant,
                  quantiteB: 0,
                  nature: '',
                )));
              },
              child: const Text('Ajouter une fiche liée'),
            ).alignment(AlignmentDirectional.bottomStart),
          ],
        ),
      ],
    );
  }
}

class LienFicheForm extends StatelessWidget {
  final VoidCallback onDelete;

  const LienFicheForm({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final AtelierSnippet atelier = context.watch();
    final AppTheme theme = context.watch();
    final EditableLienFiche editable = context.watch();
    final FicheSnippet ficheSnippet = context.watch();

    final items = [
      for (final participant in atelier.participants)
        DropdownMenuEntry<ContactSnippet>(
          value: participant,
          label: participant.personne.displayName,
        )
    ];

    final List<DropdownMenuEntry<ContactSnippet?>> dropdownMenuEntries =
        items.isNotEmpty
            ? items
            : [
                const DropdownMenuEntry(
                    value: null, label: "No participants available")
              ];

    // True if the current fiche is A.
    final editingA = editable.value.ficheAId == ficheSnippet.fiche.id;

    final updateDirection = editingA
        ? editable.updateFluxDirectionB
        : editable.updateFluxDirectionA;

    final initialDirection =
        editingA ? editable.value.directionB : editable.value.directionA;

    final updateContact =
        editingA ? editable.updateContactBId : editable.updateContactAId;
    final initialContactId =
        editingA ? editable.value.contactBId : editable.value.contactAId;

    final readOnly = editable.value.ficheBId != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownMenu<ContactSnippet?>(
          enableFilter: true,
          requestFocusOnTap: true,
          leadingIcon: const Icon(Icons.person),
          label: const Text('Participant'),
          initialSelection: atelier.participants.firstWhereOrNull(
              (participant) => participant.contact.id == initialContactId),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          onSelected: readOnly ? null : (ContactSnippet? contact) {
            if (contact != null) updateContact(contact.contact.id);
          },
          dropdownMenuEntries: dropdownMenuEntries,
        ).padding(right: theme.grid * 2).flexible(flex: 2),
        editable.nature
            .toTextFormField(maxLines: 1, enabled: !readOnly)
            .padding(right: theme.grid * 2)
            .flexible(flex: 2),
        (editingA ? editable.quantiteB : editable.quantiteA)
            .toTextFormField(maxLines: 1, enabled: !readOnly)
            .padding(right: theme.grid * 2)
            .flexible(flex: 1),
        DropdownMenu<FluxDirection?>(
          enableFilter: false,
          enableSearch: false,
          requestFocusOnTap: true,
          label: const Icon(Icons.compare_arrows),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          initialSelection: initialDirection,
          onSelected: readOnly ? null : (FluxDirection? direction) {
            if (direction != null) {
              updateDirection(direction);
            }
          },
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: FluxDirection.entrant, label: 'Besoin'),
            DropdownMenuEntry(value: FluxDirection.sortant, label: 'Offre'),
          ],
        ).padding(right: theme.grid * 2).flexible(flex: 1),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ],
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
    final AtelierSnippet atelier = context.read();
    final FicheSnippet snippet = context.watch();
    final EditableFiche fiche = context.watch();
    final EditableFlux flux = context.watch();
    final FicheCollectionBlone fiches = context.watch();
    final FluxCollectionBlone fluxes = context.watch();

    final liens = CollectionProvider.of<ListChangeNotifier<EditableLienFiche>>(
      context,
      listen: true,
    );

    return OverflowBar(
      alignment: MainAxisAlignment.end,
      spacing: 8,
      children: [
        TextButton.icon(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Suppression de la fiche'),
              content: const Text('Souhaitez-vous supprimer cette fiche ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Annuler'),
                  child: const Text('Annuler'),
                ),
                TextButton(
                  onPressed: () {
                    // ferme l'AlertDialog
                    Navigator.pop(context, 'Supprimer');
                    // ferme la modale d'édition
                    Navigator.pop(context, 'Supprimer');

                    // Supprimer le flux entraine la suppression de la fiche.
                    fluxes.delete(flux.value.id);
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ),
          icon: const Icon(Icons.delete),
          label: const Text('supprimer'),
        ),
        TextButton.icon(
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
              atelier: atelier,
              fiche: fiche,
              flux: flux,
              contact: snippet.contact,
              liens: liens,
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

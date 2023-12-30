import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/editable.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/atelier_collection_blones.dart';
import '../../blones/collection/fiche_collection_blone.dart';

typedef ShowFiche = void Function({
  required BuildContext context,
  String? ficheId,
  EditableParticipantMeta? editableMeta,
});

/// Displays the participant synthetic information in a card.
///
/// The card appears collapsed and can be expanded to reveal more information
/// attached to the participant such as :
/// - thématiques
/// - participants fiches
/// - champ libre field
class AtelierParticipantMetaCard extends StatelessWidget {
  final ContactSnippet contact;
  final ShowFiche showFiche;
  final AtelierSnippet atelier;
  final ParticipantMeta meta;

  const AtelierParticipantMetaCard({
    super.key,
    required this.meta,
    required this.contact,
    required this.atelier,
    required this.showFiche,
  });

  @override
  Widget build(BuildContext context) {
    return _Form(
      meta: meta,
      atelier: atelier,
      contact: contact,
      showFiche: showFiche,
    );
  }
}

class _Form extends StatefulWidget {
  final ParticipantMeta meta;
  final AtelierSnippet atelier;
  final ContactSnippet contact;
  final ShowFiche showFiche;

  const _Form({
    required this.contact,
    required this.showFiche,
    required this.atelier,
    required this.meta,
  });

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final ExpandableController controller;
  late final EditableParticipantMeta editable;

  @override
  void initState() {
    controller = ExpandableController();
    editable = EditableParticipantMeta(widget.meta);
    editable.addListener(onChange);
    super.initState();
  }

  @override
  void dispose() {
    editable.removeListener(onChange);
    editable.dispose();
    controller.dispose();
    super.dispose();
  }

  void onChange() {
    setState(() {
      final ParticipantMetaCollectionBlone blone = context.read();
      blone.save(editable.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Thematiques thematiques = context.watch();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandablePanel(
          controller: controller,
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Leading.vHair(),
              Row(
                children: [
                  Text(
                    widget.contact.personne.displayName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ).bold().padding(right: 5),
                  Text(
                    widget.contact.entreprise.entreprise.denomination,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),
          collapsed: InkWell(
            onTap: () => controller.expanded = true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Leading.vHair(),
                Wrapper(
                  size: .5,
                  children: [
                    ...thematiques
                        .where((t) => widget.meta.thematiqueIds.contains(t.id))
                        .map((t) => Chip(label: Text(t.nom)))
                  ],
                ),
                Leading.vHair(),
              ],
            ),
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Leading.vSmall(),
              const Text("Thématiques :"),
              Leading.vHair(),
              // editable.thematiques.toChoiceChips(
              //   thematiques.map((t) => Choice(label: t.nom, value: t.id)),
              // ),
              Wrapper(
                size: .5,
                children: [
                  ...thematiques
                      .where((t) => widget.meta.thematiqueIds.contains(t.id))
                      .map((t) => Chip(label: Text(t.nom)))
                ],
              ),

              Leading.vMedium(),
              const Text('Fiches offre et besoin :'),
              Leading.vHair(),
              FicheChipList(
                atelier: widget.atelier,
                contact: widget.contact,
                editable: editable,
                showFiche: widget.showFiche,
              ),
              ButtonBar(
                children: [
                  TextButton.icon(
                    onPressed: () => widget.showFiche(
                      context: context,
                      editableMeta: editable,
                    ),
                    label: const Text('Nouvelle fiche'),
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              const Divider(),
              Leading.vHair(),
              editable.champLibre.toTextFormField(maxLines: 2),
              Leading.vHair(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Display fiches related to [contact] [atelier] as a list of chips.
class FicheChipList extends StatelessWidget {
  final ContactSnippet contact;
  final ShowFiche showFiche;
  final AtelierSnippet atelier;
  final EditableParticipantMeta editable;

  const FicheChipList({
    super.key,
    required this.contact,
    required this.showFiche,
    required this.atelier,
    required this.editable,
  });

  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.watch();
    final FicheCollectionBlone fiches = context.watch();
    return Column(
      children: [
        FutureLoader<Iterable<FicheSnippet>>(
          future: fiches.getSnippetsForContactAndAtelier(
            atelierId: atelier.atelier.id,
            contactId: contact.contact.id,
            demarcheId: demarche.id,
          ),
          builder: (
            BuildContext context,
            AsyncSnapshotWithData<Iterable<FicheSnippet>> snapshot,
          ) {
            final snippets = snapshot.data;

            return Wrapper(size: .5, children: [
              for (final snippet in snippets)
                InkWell(
                  onTap: () => showFiche(
                    context: context,
                    editableMeta: editable,
                    ficheId: snippet.fiche.id,
                  ),
                  child: Chip(
                    label: Text(shortDescription(snippet)),
                  ),
                ),
            ]);
          },
        ),
      ],
    );
  }
}

/// Build a short text to be displayed in a chip representing a Fiche.
String shortDescription(FicheSnippet snippet) {
  final flux = snippet.flux;
  final verb = flux.direction == FluxDirection.entrant ? 'Je veux' : "J'offre";
  final what = '${flux.quantite} ${flux.unite} de ${flux.resourceNom}';
  return '$verb $what';
}

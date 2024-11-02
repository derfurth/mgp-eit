import 'dart:collection';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/models/editable.dart';
import 'package:mgp_client/styled_widgets/heading.dart';
import 'package:mgp_client/utils/time_utils.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/synergie_collection_blone.dart';
import '../../commands/show_message_command.dart';
import '../../components/layout.dart';
import '../../models/build_in.dart';
import '../../models/donnees.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/snippets.dart';
import '../../models/ui_message.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import '../../styled_widgets/page_header.dart';
import '../../styled_widgets/wrapper.dart';
import '../add_boxes/flux_add_box.dart';

class SynergieEditor extends StatelessWidget {
  final String? synergieId;

  const SynergieEditor({
    super.key,
    this.synergieId,
  });

  @override
  Widget build(BuildContext context) {
    final SynergieCollectionBlone synergies = context.read();

    final params = EditorParams(
      mode: synergieId != null ? EditorMode.update : EditorMode.create,
    );

    /// The Snippet is a convenient way to display participants names etc.
    ///
    /// New snippets will pop here as the firebase collection is updated by
    /// widgets down the tree.
    Stream<SynergieSnippet> snippets() {
      if (params.mode == EditorMode.create) {
        final Demarche demarche = context.read();
        return synergies.createSnippet(
          demarcheId: demarche.id,
        );
      } else {
        return synergies.subscribeToSnippet(synergieId!);
      }
    }

    return DefaultTabController(
      length: 2,
      child: Body(
        header: const PageHeader(
          title: 'Synergie',
        ),
        child: StreamBuilder<SynergieSnippet>(
          stream: snippets(),
          builder: (context, snapshot) {
            final synergie = snapshot.data;
            if (synergie == null) return const CircularProgressIndicator();
            return ChangeNotifierProvider<EditableSynergie>(
              create: (_) => EditableSynergie(synergie.synergie),
              child: PaddedSingleChildScrollable(
                child: SynergieForm(synergie: synergie),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Synergie 'head' form
///
/// Sets properties like name, animateurs, participants.
class SynergieForm extends StatelessWidget {
  final SynergieSnippet synergie;

  const SynergieForm({
    super.key,
    required this.synergie,
  });

  @override
  Widget build(BuildContext context) {
    final EditableSynergie editable = context.watch();

    return FutureProvider<Thematiques>.value(
      value: BuildIn.thematiques,
      initialData: UnmodifiableListView<Thematique>([]),
      child: Wrapper.form(
        children: [
          Wrapper(
            children: [
              Text('Crée le: ' +
                  TimeUtils.timestampToFrench(editable.value.createdAt)),
              Text('Modifiée le: ' +
                  TimeUtils.timestampToFrench(editable.value.modifiedAt)),
            ],
          ).alignment(Alignment.centerRight),
          TextFormField(
            decoration: InputDecoration(
              labelText: editable.nom.label,
              filled: true,
            ),
            initialValue: editable.nom.value,
            validator: editable.nom.validator.call,
            onChanged: editable.nom.update,
          ),
          Row(
            children: [
              const Text('Type'),
              Leading.hSmall(),
              DropdownButton<SynergieType>(
                value: editable.value.type,
                onChanged: (SynergieType? type) {
                  if (type != null) editable.updateType(type);
                },
                items: [
                  for (final type in SynergieType.values)
                    DropdownMenuItem<SynergieType>(
                      value: type,
                      child: Text(type.nom),
                    ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text('Statut'),
              Leading.hSmall(),
              DropdownButton<SynergieStatut>(
                value: editable.value.statut,
                onChanged: (SynergieStatut? statut) {
                  if (statut != null) editable.updateStatut(statut);
                },
                items: [
                  for (final statut in SynergieStatut.values)
                    DropdownMenuItem<SynergieStatut>(
                      value: statut,
                      child: Text(statut.nom),
                    ),
                ],
              ),
            ],
          ),
          editable.commentaire.toTextFormField(maxLines: 3).flexible(),
          const SynergieIndicators(),
          FluxAddBox(
            initialSelection: synergie.flux,
            onSelected: (fluxes) {
              editable.updateFluxIds([for (final flux in fluxes) flux.id]);
            },
          ),
          _SynergieSaveBar(),
        ],
      ),
    );
  }
}

class SynergieIndicatorsPreview extends StatelessWidget {
  const SynergieIndicatorsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableSynergie editable = context.watch();

    final indicateurs = [
      editable.reductionTotaleDeLaConsommationMatiere,
      editable.reductionDeLaConsommationMatiereHorsInerte,
      editable.reductionTotaleDesDechets,
      editable.reductionDesDechetsNonInertes,
      editable.ameliorationDeLaValorisationDesDechets,
      editable.reductionDesConsommationsDenergie,
      editable.productionDenergieRenouvelable,
      editable.reductionDesConsommationsDeau,
      editable.reductionDesEmissionsDeGES,
      editable.realisationDeconomiesFinancieres,
      editable.chiffreDaffairesGenere,
      editable.investissementsRealises,
      editable.developpementDeNouvellesActivitesEtEntreprises,
      editable.creationDemplois,
      editable.maintienDeLemploi,
    ];

    final isEmpty = indicateurs.every((field) => field.value == '0');
    if (isEmpty) return const Text('Aucun indicateur de synergie rempli');
    final nonZeroIndicateurs = indicateurs.where((field) => field.value != '0');
    return DataTable(
      columns: const [
        DataColumn(
          label: Expanded(
            child: Text('Indicateur',
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ),
        DataColumn(
          label: Expanded(
            child:
                Text('Valeur', style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ),
      ],
      rows: [
        for (var field in nonZeroIndicateurs)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(field.label)),
              DataCell(Text(field.value!)),
            ],
          )
      ],
    );
  }
}

class SynergieIndicators extends StatelessWidget {
  const SynergieIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final EditableSynergie editable = context.watch();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: ExpandablePanel(
          header: Heading.h5('Indicateurs'),
          collapsed: const SynergieIndicatorsPreview(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Leading.vSmall(),
              Heading.h6('Réduction de la consommation matière'),
              Leading.vHair(),
              editable.reductionTotaleDeLaConsommationMatiere.toTextFormField(),
              Leading.vHair(),
              editable.reductionDeLaConsommationMatiereHorsInerte
                  .toTextFormField(),
              Leading.vMedium(),
              Heading.h6(
                  'Amélioration des modes de gestion et de traitement des déchets'),
              Leading.vHair(),
              editable.reductionTotaleDesDechets.toTextFormField(),
              Leading.vHair(),
              editable.reductionDesDechetsNonInertes.toTextFormField(),
              Leading.vHair(),
              editable.ameliorationDeLaValorisationDesDechets.toTextFormField(),
              Leading.vMedium(),
              Heading.h6('Énergie'),
              Leading.vHair(),
              editable.reductionDesConsommationsDenergie.toTextFormField(),
              Leading.vHair(),
              editable.productionDenergieRenouvelable.toTextFormField(),
              Leading.vMedium(),
              Heading.h6('Ressources en eau'),
              Leading.vHair(),
              editable.reductionDesConsommationsDeau.toTextFormField(),
              Leading.vMedium(),
              Heading.h6('Gaz à effet de serre'),
              Leading.vHair(),
              editable.reductionDesEmissionsDeGES.toTextFormField(),
              Leading.vMedium(),
              Heading.h6('Économies'),
              Leading.vHair(),
              editable.realisationDeconomiesFinancieres.toTextFormField(),
              Leading.vMedium(),
              Heading.h6(
                  'Retours bénéfiques pour les entreprises et le territoire'),
              Leading.vHair(),
              editable.chiffreDaffairesGenere.toTextFormField(),
              Leading.vHair(),
              editable.investissementsRealises.toTextFormField(),
              Leading.vHair(),
              editable.developpementDeNouvellesActivitesEtEntreprises
                  .toTextFormField(),
              Leading.vMedium(),
              Heading.h6(
                  'Retours bénéfiques pour les entreprises et le territoire'),
              Leading.vHair(),
              editable.creationDemplois.toTextFormField(),
              Leading.vHair(),
              editable.maintienDeLemploi.toTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SynergieSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SynergieCollectionBlone synergies = context.read();
    final EditableSynergie synergie = context.watch();
    final SynergieCollectionBlone blone = context.watch();

    return OverflowBar(
      alignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Suppression de la synergie'),
              content: const Text('Souhaitez-vous supprimer cette synergie ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Annuler'),
                  child: const Text('Annuler'),
                ),
                TextButton(
                  onPressed: () {
                    // ferme l'AlertDialog
                    Navigator.pop(context, 'Supprimer');

                    // ferme la synergie
                    Navigator.pop(context, 'Supprimer');

                    // Supprimer le flux entraine la suppression de la fiche.
                    synergies.delete(synergie.value.id);
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ),
          icon: const Icon(Icons.delete),
          label: const Text('supprimer'),
        ),
        ElevatedButton(
          onPressed: () async {
            await blone.save(synergie.value);
            ShowMessageCommand()
                .execute(const UIMessage.save('Synergie enregistrée'));
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}

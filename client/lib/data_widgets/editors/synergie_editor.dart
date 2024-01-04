import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mgp_client/models/editable.dart';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editable.commentaire.toTextFormField(maxLines: 5).flexible(),
              // Leading.hSmall(),
              // OutlinedButton(
              //   onPressed: () async {
              //     final picked = await showDatePicker(
              //       context: context,
              //       firstDate: DateTime(1970),
              //       lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
              //       initialDate: editable.value.commentaireDate == null
              //           ? DateTime.now()
              //           : DateTime.parse(editable.value.commentaireDate!),
              //     );
              //     editable.dateCommentaire.update(picked);
              //   },
              //   child: Text(TimeUtils.timestampToFrench(
              //       editable.value.commentaireDate)),
              // ),
            ],
          ),
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

/// Synergie commentaires.
class SynergieCommentaires extends StatelessWidget {
  final SynergieSnippet synergie;

  const SynergieCommentaires({
    super.key,
    required this.synergie,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('todo'));
  }
}

class _SynergieSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SynergieCollectionBlone synergies = context.read();
    final EditableSynergie synergie = context.watch();
    final SynergieCollectionBlone blone = context.watch();

    return ButtonBar(
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

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../app_theme.dart';
import '../../blones/collection/flux_collection_blone.dart';
import '../../commands/show_message_command.dart';
import '../../components/layout.dart';
import '../../components/synapse_dropdown.dart';
import '../../data_widgets/items/contact_item.dart';
import '../../models/build_in.dart';
import '../../models/donnees.dart';
import '../../models/editable.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/snippets.dart';
import '../../models/ui_message.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import '../../styled_widgets/wrapper.dart';

class FluxEditor extends StatelessWidget {
  final EditorMode mode;
  final String? fluxId;

  const FluxEditor({
    super.key,
    this.mode = EditorMode.create,
    this.fluxId,
  });

  @override
  Widget build(BuildContext context) {
    final mode = fluxId != null ? EditorMode.update : EditorMode.create;

    final AppTheme theme = context.watch();
    final FluxCollectionBlone flux = context.watch();
    final Demarche demarche = context.watch();

    Future<FluxSnippet> getSnippet() async {
      if (mode == EditorMode.create) {
        throw UnimplementedError('cannot create flux snippet');
      } else {
        return flux.getSnippet(fluxId: fluxId!);
      }
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(mode == EditorMode.create ? 'Nouveau flux' : 'Flux'),
      ),
      child: PaddedSingleChildScrollable(
        child: Column(
          children: [
            FutureBuilder<FluxSnippet>(
                future: getSnippet(),
                builder: (context, snapshot) {
                  final snippet = snapshot.data;
                  if (snippet == null) return const CircularProgressIndicator();
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<EditableFlux>(
                        create: (_) => EditableFlux(snippet.flux),
                      ),
                      Provider<FluxSnippet>.value(value: snippet),
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
                    child: Wrapper(children: [
                      Heading.h5('Contact'),
                      ContactItem(
                        snippet: snippet.contact,
                        demarcheId: demarche.id,
                      ),
                      _FluxForm(),
                    ]),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _FluxForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableFlux flux = context.watch();
    final AppTheme theme = context.watch();

    final Synapse synapse = context.watch();
    final matches =
        synapse.where((c) => c.code == flux.value.resourceCodeSynapse);
    final selected = matches.isEmpty ? null : matches.first;
    final Thematiques thematiques = context.watch();

    return Wrapper(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 10),
            child: Heading.h5('Flux'),
          ),
          const FluxDirectionForm(),
        ],
      ),
      flux.thematiques.toChoiceChips(
        thematiques.map((t) => Choice(label: t.nom, value: t.id)),
      ),
      Row(children: [
        flux.resourceNom
            .toTextFormField()
            .padding(right: theme.grid * 2)
            .flexible(flex: 3),
        flux.quantite
            .toTextFormField()
            .padding(right: theme.grid * 2)
            .flexible(),
        flux.unite.toTextFormField().flexible(),
      ]),
      flux.commentaire.toTextFormField(maxLines: 2),
      Heading.h5('Resource'),
      Leading.vSmall(),
      flux.resourceDescription.toTextFormField(),
      SynapseDropdown(
        selected: selected,
        onSelected: (classification) =>
            flux.updateResourceCodeSynapse(classification?.code ?? ''),
      ),
      _SnippetSaveBar(),
    ]);
  }
}

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
        const Text('Entrant'),
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
        const Text('Sortant'),
      ],
    );
  }
}

class _SnippetSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableFlux editable = context.watch();
    final FluxCollectionBlone blone = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () async {
            await blone.save(editable.value);
            ShowMessageCommand()
                .execute(const UIMessage.save('Flux enregistré'));
          },
          child: const Text('Enregister'),
        ),
      ],
    );
  }
}

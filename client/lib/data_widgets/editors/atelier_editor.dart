import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tuple/tuple.dart';

import '../../blones/auth_blone.dart';
import '../../blones/collection/atelier_collection_blones.dart';
import '../../blones/rapport_blone.dart';
import '../../commands/download_command.dart';
import '../../components/layout.dart';
import '../../data_widgets/add_boxes/animateur_add_box.dart';
import '../../data_widgets/add_boxes/coanimateur_add_box.dart';
import '../../data_widgets/add_boxes/contact_add_box.dart';
import '../../data_widgets/editors/atelier_participant_meta_card.dart';
import '../../models/build_in.dart';
import '../../models/donnees.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/snippets.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import '../../styled_widgets/page_header.dart';
import '../../styled_widgets/wrapper.dart';
import '../../utils/time_utils.dart';
import 'fiche_editor.dart';

/// Atelier Editor, where the live work happens.
///
/// Made of:
/// - head form: edit atelier properties
/// - live view: manage and view fiches.
class AtelierEditor extends StatelessWidget {
  final String? atelierId;

  const AtelierEditor({
    super.key,
    this.atelierId,
  });

  @override
  Widget build(BuildContext context) {
    final AtelierCollectionBlone ateliers = context.read();

    final mode = atelierId != null ? EditorMode.update : EditorMode.create;

    /// The Snippet is a convenient way to display participants names etc.
    ///
    /// New snippets will pop here as the firebase collection is updated by
    /// widgets down the tree.
    Stream<AtelierSnippet> snippets() {
      if (mode == EditorMode.create) {
        final Demarche demarche = context.read();
        final AuthBlone auth = context.read();
        return ateliers.createSnippet(
          demarcheId: demarche.id,
          animateurId: auth.user.maybeMap(
            connected: (user) =>
                user.animateurIds.isEmpty ? null : user.animateurIds.first,
            orElse: () => null,
          ),
        );
      } else {
        return ateliers.subscribeToSnippet(atelierId!);
      }
    }

    return FutureProvider<Thematiques>.value(
      value: BuildIn.thematiques,
      initialData: UnmodifiableListView<Thematique>([]),
      child: DefaultTabController(
        length: 3,
        child: Body(
          header: const PageHeader(
            title: 'Ateliers',
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Fiches ressources'),
              Tab(text: 'Thematiques'),
            ],
          ),
          child: Center(
            child: StreamBuilder<AtelierSnippet>(
              stream: snippets(),
              builder: (context, snapshot) {
                final atelier = snapshot.data;
                if (atelier == null) return const CircularProgressIndicator();
                final editable = EditableAtelier(atelier.atelier);
                return ChangeNotifierProvider<EditableAtelier>.value(
                  value: editable,
                  child: TabBarView(
                    children: [
                      PaddedSingleChildScrollable(
                        child: AtelierDescriptionForm(atelier: atelier),
                      ),
                      PaddedSingleChildScrollable(
                        child: AtelierParticipantLiveView(atelier: atelier),
                      ),
                      PaddedSingleChildScrollable(
                        child: AtelierThematiqueLiveView(atelier: atelier),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Atelier 'description' form
///
/// Sets properties like name, animateurs, participants.
class AtelierDescriptionForm extends StatelessWidget {
  final AtelierSnippet atelier;

  const AtelierDescriptionForm({
    super.key,
    required this.atelier,
  });

  @override
  Widget build(BuildContext context) {
    final EditableAtelier editable = context.watch();

    return ChangeNotifierProvider(
      create: (_) => ValueNotifier<List<String>>([]),
      child: Wrapper(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1970),
                    lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                    initialDate: editable.dateMs.value ?? DateTime.now(),
                  );
                  editable.dateMs.update(picked);
                },
                child: Text(TimeUtils.millisToFrench(editable.value.dateMs)),
              ),
            ],
          ),
          ...[
            editable.organisateur,
            editable.lieu,
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
          Leading.vSmall(),
          Builder(builder: (context) {
            final ValueNotifier<List<String>> participantIds = context.read();
            return ContactAddBox(
              title: Text(atelier.participantsWithFiche.isNotEmpty
                  ? 'Participants sans fiche'
                  : 'Participants'),
              initialSelection: atelier.participantsWithoutFiche,
              onSelected: (selected) {
                participantIds.value =
                    selected.map((e) => e.contact.id).toList();
              },
            );
          }),
          if (atelier.participantsWithFiche.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Heading.h5('Participants avec fiche'),
                Leading.vSmall(),
                Wrap(
                  spacing: 5,
                  children: [
                    for (var p in atelier.participantsWithFiche)
                      Chip(label: Text(p.personne.displayName))
                  ],
                ),
              ],
            ),
          Leading.vSmall(),
          AnimateurAddBox(
            initialSelection: atelier.animateurs,
            onSelected: (selected) {
              editable.updateAnimateurIds(
                selected.map((e) => e.animateur.id).toList(),
              );
            },
          ),
          CoAnimateurAddBox(
            initialSelection: atelier.coAnimateurs,
            onSelected: (selected) {
              editable.updateCoAnimateurIds(
                selected.map((e) => e.coAnimateur.id).toList(),
              );
            },
          ),
          _AtelierSaveBar(),
        ],
      ),
    );
  }
}

/// Atelier 'live' view
///
/// Shows Fiches, by participant.
class AtelierParticipantLiveView extends StatelessWidget {
  final AtelierSnippet atelier;

  const AtelierParticipantLiveView({
    super.key,
    required this.atelier,
  });

  @override
  Widget build(BuildContext context) {
    if (atelier.participants.isEmpty) {
      return Center(child: Heading.h5("L'atelier n'a pas de participants"));
    }

    final Demarche demarche = context.watch();
    final ParticipantMetaCollectionBlone participantMetas = context.watch();
    final ContactCollectionBlone contacts = context.watch();

    return FutureBuilder<Iterable<ParticipantMeta>>(
        future: participantMetas.getByAtelier(atelierId: atelier.atelier.id),
        builder: (context, snapshot) {
          final metas = snapshot.data;

          if (metas == null) return const CircularProgressIndicator.adaptive();

          return Stack(
            children: [
              Column(children: [
                Leading.vMedium(),
                // Text('${metas.length} metas: ${metas.map((e) => e.contactId)}'),
                ...[
                  for (final meta in metas)
                    FutureLoader<ContactSnippet>(
                      key: Key(meta.contactId),
                      future: contacts.getSnippet(contactId: meta.contactId),
                      builder: (_, snapshot) => AtelierParticipantMetaCard(
                        key: Key(meta.contactId),
                        meta: meta,
                        contact: snapshot.data,
                        atelier: atelier,
                        showFiche: showFicheFunction(
                          demarche,
                          atelier,
                          snapshot.data.contact,
                        ),
                      ),
                    ),
                ],
                Leading.vMedium(),
                ButtonBar(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        final RapportBlone rapport = context.read();
                        final csv = await rapport.fiches(atelier.atelier.id);
                        DownloadCommand().execute(data: csv);
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Fiches ressources'),
                    ),
                  ],
                ),
              ]),
            ],
          );
        });
  }
}

/// Atelier 'live' view
///
/// Shows Fiches, by thematique.
class AtelierThematiqueLiveView extends StatelessWidget {
  final AtelierSnippet atelier;

  const AtelierThematiqueLiveView({
    super.key,
    required this.atelier,
  });

  @override
  Widget build(BuildContext context) {
    if (atelier.participants.isEmpty) {
      return Center(child: Heading.h5("L'atelier n'a pas de participants"));
    }

    final ParticipantMetaCollectionBlone participantMetas = context.watch();
    final Thematiques thematiques = context.watch();
    final Demarche demarche = context.watch();

    return FutureBuilder<Iterable<ParticipantMeta>>(
      future: participantMetas.getByAtelier(atelierId: atelier.atelier.id),
      builder: (context, snapshot) {
        final metas = snapshot.data;
        if (metas == null) return const CircularProgressIndicator.adaptive();

        final byThematiques = {
          for (final thematique in thematiques)
            thematique: metas
                .where((meta) => meta.thematiqueIds.contains(thematique.id))
        };

        final entries = byThematiques.entries // sort entries by meta length
            .sorted((a, b) => b.value.length.compareTo(a.value.length));

        return Column(
          children: [
            for (final entry in entries)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Heading.h5(entry.key.nom),
                      Leading.hSmall(),
                      Chip(label: Text('${entry.value.length}')),
                    ],
                  ),
                  Leading.hHair(),
                  for (final tuple in entry.value.map(
                    (e) => contactFromMeta(atelier, e),
                  ))
                    if (tuple.item2 != null)
                      AtelierParticipantMetaCard(
                        meta: tuple.item1,
                        contact: tuple.item2!,
                        atelier: atelier,
                        showFiche: showFicheFunction(
                          demarche,
                          atelier,
                          tuple.item2!.contact,
                        ),
                      ),
                  ButtonBar(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () async {
                          final RapportBlone rapport = context.read();
                          final csv = await rapport.thematiques(
                            atelier.atelier.id,
                            entry.key.id,
                          );
                          DownloadCommand().execute(data: csv);
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('Fiches ressources'),
                      ),
                    ],
                  ),
                  const Divider().opacity(.3),
                  Leading.vSmall(),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _AtelierSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableAtelier atelier = context.watch();
    final AtelierCollectionBlone ateliers = context.watch();

    final ValueNotifier<List<String>> participantIds = context.watch();
    final ParticipantMetaCollectionBlone metas = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () {
            logMessage(atelier.value.toString());
            ateliers.save(atelier.value);
            logMessage(participantIds.toString());
            metas.setParticipants(
              demarcheId: atelier.value.demarcheId,
              atelierId: atelier.value.id,
              participantIds: participantIds.value,
            );
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}

ShowFiche showFicheFunction(
  Demarche demarche,
  AtelierSnippet atelier,
  Contact contact,
) {
  return ({
    required BuildContext context,
    String? ficheId,
    EditableParticipantMeta? editableMeta,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            Provider.value(value: atelier),
            Provider.value(value: contact),
            Provider.value(value: demarche),
          ],
          child: Dialog(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: PaddedSingleChildScrollable(
                child: FicheEditor(
                  ficheId: ficheId,
                  editableMeta: editableMeta,
                ),
              ),
            ),
          ),
        );
      },
    );
  };
}

Tuple2<ParticipantMeta, ContactSnippet?> contactFromMeta(
  AtelierSnippet atelier,
  ParticipantMeta meta,
) =>
    Tuple2(
      meta,
      atelier.participants
          .firstWhereOrNull((p) => p.contact.id == meta.contactId),
    );

import 'dart:math';

import 'package:collection/collection.dart';
import 'package:collection_providers/collection_providers.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/blones/collection/fiche_collection_blone.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/models/editable.dart';
import 'package:mgp_client/models/schedule.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:tuple/tuple.dart';

import '../../blones/auth_blone.dart';
import '../../blones/collection/atelier_collection_blones.dart';
import '../../blones/collection/lien_fiche_collection_blone.dart';
import '../../blones/rapport_blone.dart';
import '../../commands/download_command.dart';
import '../../components/layout.dart';
import '../../components/synergie_creation_dialog.dart';
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
        length: 5,
        child: Body(
          header: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PageHeader(
              title: 'Ateliers',
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Fiches ressources'),
                Tab(text: 'Thématiques'),
                Tab(text: 'Rencontres'),
                Tab(text: 'Fiches liées'),
              ],
            ),
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
                      PaddedSingleChildScrollable(
                        child: ScheduleEditor(atelier: atelier),
                      ),
                      AtelierFicheLieesLiveView(atelier: atelier),
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

    return FutureLoader<Iterable<ParticipantMeta>>(
      future: participantMetas.getByAtelier(atelierId: atelier.atelier.id),
      builder: (context, snapshot) {
        final metas = snapshot.data;
        return Stack(
          children: [
            Column(children: [
              Leading.vMedium(),
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
              Leading.vMedium(),
              OverflowBar(
                children: [
                  OutlinedButton.icon(
                    onPressed: () async {
                      final RapportBlone rapport = context.read();
                      final csv =
                          await rapport.fiches(demarche.id, atelier.atelier.id);
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
      },
    );
  }
}

/// Fiche liées
///
/// Shows Fiches snippet by lien.
class AtelierFicheLieesLiveView extends StatelessWidget {
  final AtelierSnippet atelier;

  const AtelierFicheLieesLiveView({
    super.key,
    required this.atelier,
  });

  @override
  Widget build(BuildContext context) {
    final LienFicheCollectionBlone blone = context.watch();
    final ParticipantMetaCollectionBlone participantMetas = context.watch();
    final Demarche demarche = context.read();

    if (atelier.participants.isEmpty) {
      return Center(child: Heading.h5("L'atelier n'a pas de participants"));
    }

    return CollectionProvider(
      create: (_) => SetChangeNotifier<FicheSnippet>({}),
      child: Stack(
        children: [
          PaddedSingleChildScrollable(
            child: FutureLoader<Iterable<LienFiche>>(
              future: blone.getForAtelier(
                demarcheId: atelier.atelier.demarcheId,
                atelierId: atelier.atelier.id,
              ),
              builder: (context, snapshot) {
                final liens = snapshot.data;

                if (liens.isEmpty) {
                  return Heading.h4("Pas de fiches liées pour l'instant");
                }

                final sortedLiens = liens
                    .sortedBy((lien) => atelier.participants
                        .firstWhere((participant) =>
                            participant.contact.id == lien.contactAId)
                        .personne
                        .displayName)
                    .toList();

                return FutureLoader(
                  future: participantMetas.getByAtelier(
                      atelierId: atelier.atelier.id),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        for (final (i, lien) in sortedLiens.indexed)
                          Row(
                            children: [
                              Card(
                                elevation: 2,
                                child: LienFicheSide(
                                    atelier: atelier, lien: lien, showA: true),
                              ).flexible(),
                              Card(
                                elevation: 2,
                                child: LienFicheSide(
                                    atelier: atelier, lien: lien, showA: false),
                              ).flexible(),
                            ],
                          ).padding(
                            bottom:
                                sortedLiens[min(i + 1, sortedLiens.length - 1)]
                                            .contactAId ==
                                        lien.contactAId
                                    ? 0
                                    : 32,
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Builder(builder: (context) {
            final selection =
                CollectionProvider.of<SetChangeNotifier<FicheSnippet>>(context,
                    listen: true);

            return Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                elevation: selection.isEmpty ? 0 : 4,
                backgroundColor: selection.isEmpty ? Colors.grey : null,
                onPressed: selection.isEmpty
                    ? null
                    : () async {
                        await showNewSynergieUsingSelectionDialog(
                            context, demarche, selection.toList());
                        selection.clear();
                      },
                child: const Icon(Icons.add),
              ).padding(all: 8 * 2),
            );
          }),
        ],
      ),
    );
  }
}

/// One side of the lien, that is A or B.
class LienFicheSide extends StatelessWidget {
  final AtelierSnippet atelier;
  final LienFiche lien;
  final bool showA;

  const LienFicheSide({
    super.key,
    required this.atelier,
    required this.lien,
    required this.showA,
  });

  ContactSnippet getContactSnippetById(String id) {
    return atelier.participants
        .firstWhere((snippet) => snippet.contact.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.read();
    final FicheCollectionBlone fiches = context.watch();
    final ParticipantMetaCollectionBlone participantMetas = context.watch();

    final contactId = showA ? lien.contactAId : lien.contactBId!;
    final contactSnippet = getContactSnippetById(contactId);
    final ficheId = showA ? lien.ficheAId : lien.ficheBId!;

    return ListTile(
      title: Text.rich(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: contactSnippet.personne.displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: '  '),
            TextSpan(text: contactSnippet.entreprise.entreprise.denomination),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureLoader(
          showIndicator: false,
          future: participantMetas.getByAtelierAndContact(
            atelierId: atelier.atelier.id,
            contactId: contactSnippet.contact.id,
          ),
          builder: (context, snapshot) {
            final participantMeta = snapshot.data;
            return FutureLoader(
              showIndicator: false,
              future: fiches.getSnippet(ficheId: ficheId),
              builder: (builder, snapshot) {
                final snippet = snapshot.data;
                final selection =
                    CollectionProvider.of<SetChangeNotifier<FicheSnippet>>(
                        context,
                        listen: true);
                return Row(
                  children: [
                    InkWell(
                        onTap: () => showFicheFunction(
                              demarche,
                              atelier,
                              contactSnippet.contact,
                            ).call(
                                context: context,
                                editableMeta:
                                    EditableParticipantMeta(participantMeta),
                                ficheId: ficheId),
                        child: Chip(label: Text(shortDescription(snippet)))),
                    Checkbox(
                      value: selection.contains(snippet),
                      onChanged: (selected) => selected == true
                          ? selection.add(snippet)
                          : selection.remove(snippet),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// Atelier 'live' view
///
/// Shows Fiches, by thématique.
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
                  OverflowBar(
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

    return OverflowBar(
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
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

class ScheduleEditor extends StatelessWidget {
  final AtelierSnippet atelier;

  const ScheduleEditor({super.key, required this.atelier});

  @override
  Widget build(BuildContext context) {
    final FicheCollectionBlone fiches = context.watch();

    // todo get from a new blone.
    final rencontres = AtelierRencontres(
      demarcheId: atelier.atelier.demarcheId,
      atelierId: atelier.atelier.id,
    );

    return FutureLoader(
      future: fiches.getSnippetsForAtelier(atelierId: atelier.atelier.id),
      builder: (context, snapshot) {
        final fiches = snapshot.data;
        final contacts = fiches
            .map((fiche) => fiche.contact)
            .groupFoldBy((snippet) => snippet.contact.id, (_, e) => e);

        return ChangeNotifierProvider<EditableAtelierRencontres>(
          create: (_) => EditableAtelierRencontres(rencontres),
          child: Builder(builder: (context) {
            final EditableAtelierRencontres editable = context.watch();
            final configuration = ScheduleConfiguration(
              turnCount: editable.value.turnCount.toInt(),
              tableCount: editable.value.tableCount.toInt(),
              tableSeatCount: editable.value.tableSeatCount.toInt(),
            );

            final nonExcludedFiches = fiches.whereNot(
              (fiche) => editable.value.excludedParticipantIds
                  .contains(fiche.contact.contact.id),
            );

            final cards = [
              for (final fiche in nonExcludedFiches)
                ScheduleCard(
                  participant: fiche.contact.contact.id,
                  ressource: fiche.flux.resourceNom,
                  offre: fiche.flux.direction == FluxDirection.sortant,
                )
            ];
            final schedule =
                Schedule(configuration: configuration, cards: cards);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactAddBox(
                  title: const Text('Participants exclus'),
                  initialSelection: editable.value.excludedParticipantIds
                      .map((id) => contacts[id])
                      .whereNotNull()
                      .toList(),
                  onSelected: (selected) {
                    editable.updateExcludedParticipantIds(
                        selected.map((e) => e.contact.id).toList());
                  },
                ),
                Leading.vSmall(),
                Heading.h5('Configuration des tables'),
                Leading.vHair(),
                Row(
                  children: [
                    editable.turnCount.toTextFormField().expanded(),
                    Leading.hSmall(),
                    editable.tableCount.toTextFormField().expanded(),
                    Leading.hSmall(),
                    editable.tableSeatCount.toTextFormField().expanded(),
                  ],
                ),
                Leading.vSmall(),
                ScheduleDataGrid(
                    schedule: schedule, editable: editable, contacts: contacts),
              ],
            );
          }),
        );
      },
    );
  }
}

class ScheduleDataGrid extends StatelessWidget {
  final Schedule schedule;
  final EditableAtelierRencontres editable;
  final Map<String, ContactSnippet> contacts;
  final dataGridKey = GlobalKey<SfDataGridState>();

  ScheduleDataGrid({
    super.key,
    required this.schedule,
    required this.editable,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    final customColumnSizer = ScheduleColumnSizer(contacts: contacts);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Leading.vHair(),
        OutlinedButton.icon(
          onPressed: () async {
            await ExportGridToExcelCommand().execute(
              state: dataGridKey.currentState!,
              contacts: contacts,
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Tableau des rencontres'),
        ),
        Leading.vHair(),
        FutureLoader(
          future: schedule.compute(),
          builder: (context, snapshot) {
            final maxTables = schedule.turns.map((turn) => turn.tables.length).maxOrNull ?? 0;
            final rowHeight = 24.0 + 20.0 * schedule.configuration.tableSeatCount;
            return SizedBox(
              height: rowHeight * (min(maxTables, 8) + 1),
              child: SfDataGrid(
                key: dataGridKey,
                columnSizer: customColumnSizer,
                columnWidthMode: ColumnWidthMode.auto,
                rowHeight: rowHeight,
                frozenColumnsCount: 1,
                source: ScheduleDataSource(
                  schedule: schedule,
                  editable: editable,
                  contacts: contacts,
                ),
                columns: [
                  GridColumn(
                    columnName: 'Table',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(''),
                    ),
                  ),
                  ...List.generate(
                      schedule.turns.length,
                      (i) => GridColumn(
                            columnName: 'Tour ${i + 1}',
                            label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.centerLeft,
                              child: Text('Tour ${i + 1}'),
                            ),
                          )),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class ScheduleDataSource extends DataGridSource {
  final Schedule schedule;
  final EditableAtelierRencontres editable;
  final Map<String, ContactSnippet> contacts;

  List<DataGridRow> _rows = [];

  ScheduleDataSource({
    required this.schedule,
    required this.editable,
    required this.contacts,
  }) {
    final maxTables = schedule.turns.map((turn) => turn.tables.length).maxOrNull ?? 0;

    _rows = List<DataGridRow>.generate(
      maxTables,
      (tableIndex) => DataGridRow(
        // For every row or table:
        cells: [
          // the first column shows the table name
          DataGridCell<String>(
            columnName: 'Table',
            value: 'Table ${tableIndex + 1}',
          ),
          // the rest show tables
          ...List.generate(
            schedule.turns.length,
            // for every turn or column:
            (turnIndex) {
              // get the table
              final table = schedule.getBy(turnIndex, tableIndex);
              if (table == null) {
                return DataGridCell<String>(
                  columnName: 'Tour ${turnIndex + 1}',
                  value: '-',
                );
              } else {
                return DataGridCell<Table>(
                  columnName: 'Tour ${turnIndex + 1}',
                  value: table,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        final value = dataGridCell.value;
        if (value is Table) {
          final table = value;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${table.ressources.join(', ')}:'),
                Leading.vHair(),
                ...table.participants
                    .map((id) => contacts[id])
                    .whereNotNull()
                    .map((snippet) => Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${snippet.personne.displayName} ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    snippet.entreprise.entreprise.denomination,
                              ),
                            ],
                          ),
                        )),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

class ScheduleColumnSizer extends ColumnSizer {
  final Map<String, ContactSnippet> contacts;

  ScheduleColumnSizer({required this.contacts});

  @override
  double computeCellWidth(
    GridColumn column,
    DataGridRow row,
    Object? cellValue,
    TextStyle textStyle,
  ) {
    if (cellValue is Table) {
      final textValue = cellValue.participants
          .map((id) => contacts[id])
          .whereNotNull()
          .map((snippet) =>
              '${snippet.personne.displayName} ${snippet.entreprise.entreprise.denomination}')
          .join('\n');
      return super.computeCellWidth(column, row, textValue, textStyle);
    }
    return super.computeCellWidth(column, row, cellValue, textStyle);
  }
}

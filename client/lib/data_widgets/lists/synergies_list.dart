import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/utils/time_utils.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../app_theme.dart';
import '../../blones/collection/synergie_collection_blone.dart';
import '../../blones/rapport_blone.dart';
import '../../chauffeur/chauffeur.dart';
import '../../commands/download_command.dart';
import '../../components/layout.dart';
import '../../models/donnees.dart';
import '../../styled_widgets/page_header.dart';

class SynergiesList extends StatelessWidget {
  const SynergiesList({
    super.key,
    required this.demarcheId,
  });

  final String demarcheId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Body(
        header: const PageHeader(title: 'Synergies'),
        child: SearchableSynergieList(demarcheId: demarcheId),
      ),
    );
  }
}

class SearchableSynergieList extends StatefulWidget {
  const SearchableSynergieList({
    super.key,
    required this.demarcheId,
  });

  final String demarcheId;

  @override
  State<SearchableSynergieList> createState() => _SearchableSynergieListState();
}

class _SearchableSynergieListState extends State<SearchableSynergieList> {
  late final ScrollController controller;
  String needle = '';

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SynergieCollectionBlone synergies = context.watch();
    final AppTheme theme = context.watch();

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Rechercher',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (input) {
                        setState(() {
                          needle = input;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextButton.icon(
                      onPressed: () async {
                        final RapportBlone rapport = context.read();
                        final csv = await rapport.synergies(
                          demarcheId: widget.demarcheId,
                          needle: needle,
                        );
                        DownloadCommand().execute(data: csv);
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Flux'),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<Iterable<Synergie>>(
              future: synergies.search(
                demarcheId: widget.demarcheId,
                needle: needle,
              ),
              builder: (context, snapshot) {
                final synergies = snapshot.data;
                if (synergies == null) return const CircularProgressIndicator();

                final list = synergies.toList();
                return Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SynergieItem(
                            synergie: list[index],
                            demarcheId: widget.demarcheId,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        FloatingActionButton(
          onPressed: () => chauffeur.createSynergie(widget.demarcheId),
          child: const Icon(Icons.add),
        )
            .alignment(AlignmentDirectional.bottomEnd)
            .padding(all: theme.grid * 2),
      ],
    );
  }
}

class SynergieItem extends StatelessWidget {
  final String demarcheId;
  final Synergie synergie;

  const SynergieItem({
    super.key,
    required this.synergie,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(synergie.nom),
          Text(TimeUtils.timestampToFrench(synergie.modifiedAt)),
        ],
      ),
      subtitle: Row(children: [
        Text(synergie.type.nom),
        Leading.hHair(),
        Text(synergie.statut.nom),
      ]),
      onTap: () => chauffeur.editSynergie(demarcheId, synergie.id),
    );
  }
}

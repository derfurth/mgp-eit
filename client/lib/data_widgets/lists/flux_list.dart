import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blones/collection/flux_collection_blone.dart';
import '../../blones/rapport_blone.dart';
import '../../commands/download_command.dart';
import '../../components/layout.dart';
import '../../data_widgets/items/flux_item.dart';
import '../../models/build_in.dart';
import '../../models/donnees.dart';
import '../../styled_widgets/page_header.dart';

class FluxList extends StatefulWidget {
  const FluxList({
    super.key,
    required this.demarcheId,
  });

  final String demarcheId;

  @override
  State<FluxList> createState() => _FluxListState();
}

class _FluxListState extends State<FluxList> {
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
    final FluxCollectionBlone flux = context.watch();

    return MultiProvider(
      providers: [
        FutureProvider<Thematiques>.value(
          value: BuildIn.thematiques,
          initialData: UnmodifiableListView<Thematique>([]),
        ),
      ],
      child: Body(
        header: const PageHeader(title: 'Flux'),
        child: Column(
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
                        final csv = await rapport.fluxes(
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
            FutureBuilder<Iterable<Flux>>(
              future: flux.search(
                demarcheId: widget.demarcheId,
                needle: needle,
              ),
              builder: (context, snapshot) {
                final fluxes = snapshot.data;
                if (fluxes == null) return const CircularProgressIndicator();
                final list = fluxes.toList();

                return Expanded(
                  child: Scrollbar(
                    trackVisibility: kIsWeb,
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        cacheExtent: 0,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FluxItem(
                            flux: list[index],
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/blones/auth_blone.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/demarche_collection_blone.dart';
import '../../chauffeur/chauffeur.dart';
import '../../components/future_loader.dart';
import '../../components/layout.dart';
import '../../models/donnees.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import '../../styled_widgets/page_header.dart';

class DemarchesList extends StatelessWidget {
  const DemarchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final DemarcheCollectionBlone demarches = context.watch();
    final AuthBlone auth = context.watch();

    final itemBuilder = auth.isAdministrateur
        ? (d) => AdminDemarcheItem(demarche: d)
        : (d) => DemarcheItem(demarche: d);

    return Body(
      header: const PageHeader(title: 'Demarches'),
      child: FutureLoader<Iterable<Demarche>>(
        future: demarches.getMine(),
        builder: (context, snapshot) {
          final demarches = snapshot.data;
          return Stack(
            children: [
              PaddedSingleChildScrollable(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (final demarche in demarches)
                      Card(
                        elevation: 2,
                        child: itemBuilder(demarche).padding(all: 8),
                      ),
                  ],
                ),
              ),
              if (auth.isAdministrateur)
                FloatingActionButton(
                  onPressed: () => chauffeur.createDemarche(),
                  child: const Icon(Icons.add),
                ).alignment(AlignmentDirectional.bottomEnd).padding(all: 8),
            ],
          );
        },
      ),
    );
  }
}

class DemarcheItem extends StatelessWidget {
  final Demarche demarche;

  const DemarcheItem({
    super.key,
    required this.demarche,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demarche.denomination),
      onTap: () => chauffeur.listAteliers(demarche.id),
    );
  }
}

class AdminDemarcheItem extends StatelessWidget {
  final Demarche demarche;

  const AdminDemarcheItem({
    super.key,
    required this.demarche,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text(demarche.denomination),
            subtitle: Text(demarche.champLibre)),
        ButtonBar(
          children: [
            TextButton(
              onPressed: () => chauffeur.editDemarche(demarche.id),
              child: const Text('Modifier'),
            ),
            ElevatedButton(
              onPressed: () => chauffeur.listAteliers(demarche.id),
              child: const Text('Ouvrir'),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/items/contact_item.dart';
import 'package:mgp_client/data_widgets/items/entreprise_item.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mgp_client/styled_widgets/page_header.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../chauffeur/chauffeur.dart';

class ActeursList extends StatelessWidget {
  const ActeursList({
    super.key,
    required this.demarcheId,
  });

  final String demarcheId;

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Body(
        header: PageHeader(
          title: 'Acteurs',
          tabs: [
            Tab(text: 'Entreprises & co.'),
            Tab(text: 'Contacts'),
          ],
        ),
        child: TabBarView(
          children: [
            /// Entreprise tab
            EntrepriseList(),

            /// Contacts tab
            ContactList(),
          ],
        ),
      ),
    );
  }
}

class EntrepriseList extends StatefulWidget {
  const EntrepriseList({super.key});

  @override
  State<EntrepriseList> createState() => _EntrepriseListState();
}

class _EntrepriseListState extends State<EntrepriseList> {
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
    final Demarche demarche = context.watch();
    final EntrepriseCollectionBlone entreprises = context.watch();
    final AppTheme theme = context.watch();

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            FutureLoader<Iterable<EntrepriseSnippet>>(
              future: entreprises.search(
                demarcheId: demarche.id,
                needle: needle,
              ),
              builder: (context, snapshot) {
                final entreprises = snapshot.data.toList();
                return Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: entreprises.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EntrepriseItem(
                            snippet: entreprises[index],
                            demarcheId: demarche.id,
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
          onPressed: () => chauffeur.createEntreprise(demarche.id),
          child: const Icon(Icons.add),
        )
            .alignment(AlignmentDirectional.bottomEnd)
            .padding(all: theme.grid * 2),
      ],
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
    final Demarche demarche = context.watch();
    final ContactCollectionBlone contacts = context.watch();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
        FutureLoader<Iterable<ContactSnippet>>(
          future: contacts.search(
            demarcheId: demarche.id,
            needle: needle,
          ),
          builder: (context, snapshot) {
            final contacts = snapshot.data.toList();
            return Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                controller: controller,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContactItem(
                        snippet: contacts[index],
                        demarcheId: demarche.id,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/entreprise_collection_blones.dart';
import '../../models/donnees.dart';
import '../../models/provided.dart';
import '../../models/snippets.dart';
import 'add_box.dart';

class ContactAddBox extends StatefulWidget {
  final Widget title;
  final List<ContactSnippet> initialSelection;
  final void Function(List<ContactSnippet> selection) onSelected;

  const ContactAddBox({
    super.key,
    this.title = const Text('Contacts'),
    required this.initialSelection,
    required this.onSelected,
  });

  @override
  State<ContactAddBox> createState() => _ContactAddBoxState();
}

class _ContactAddBoxState extends State<ContactAddBox> {
  late Contacts contacts;

  @override
  void initState() {
    super.initState();
    contacts = Contacts(widget.initialSelection);
    contacts.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    contacts.removeListener(listener);
  }

  void listener() {
    widget.onSelected(contacts.value);
  }

  @override
  Widget build(BuildContext context) {
    final ContactCollectionBlone blone = context.watch();
    final Demarche demarche = context.watch();

    return ChangeNotifierProvider.value(
      value: contacts,
      child: ChipAddBox<ContactSnippet>(
        search: (String needle) =>
            blone.search(needle: needle, demarcheId: demarche.id),
        title: widget.title,
        chipText: (snippet) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(snippet.personne.displayName).bold().padding(right: 3),
            Text(snippet.entreprise.entreprise.denomination),
          ],
        ),
        itemBuilder: (snippet) =>
            SelectableContactItem(contact: snippet, contacts: contacts),
      ),
    );
  }
}

class SelectableContactItem extends StatefulWidget {
  final ContactSnippet contact;
  final Contacts contacts;

  const SelectableContactItem({
    super.key,
    required this.contact,
    required this.contacts,
  });

  @override
  State<SelectableContactItem> createState() => _SelectableContactItemState();
}

class _SelectableContactItemState extends State<SelectableContactItem> {
  @override
  Widget build(BuildContext context) {
    final etablissement = widget.contact.entreprise.etablissements
        .firstWhere((e) => e.id == widget.contact.contact.etablissementId);
    return Row(
      children: [
        Checkbox(
          value: widget.contacts.value.contains(widget.contact),
          onChanged: (selected) {
            setState(() {
              if (selected == true) {
                widget.contacts.value = widget.contacts.value.toList()
                  ..add(widget.contact);
              } else {
                widget.contacts.value = widget.contacts.value.toList()
                  ..remove(widget.contact);
              }
            });
          },
        ).padding(horizontal: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.contact.personne.displayName),
            Opacity(
              opacity: .7,
              child: Row(
                children: [
                  Text(widget.contact.entreprise.entreprise.denomination),
                  Leading.hHair(),
                  Text(etablissement.siret),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

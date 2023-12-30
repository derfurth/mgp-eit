import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/blones/collection/personne_collection_blone.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/editables.dart';
import 'package:mgp_client/models/editor_mode.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:mgp_client/styled_widgets/heading.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/styled_widgets/padded_single_child_scrollable.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';
import 'package:provider/provider.dart';

import 'personne_editor.dart';

/// The contact editor is a composite of
///
/// - Personne editor
/// - Etablissement selector
class ContactEditor extends StatelessWidget {
  final String? contactId;
  final String? etablissementId;

  const ContactEditor({
    super.key,
    this.contactId,
    this.etablissementId,
  });

  @override
  Widget build(BuildContext context) {
    final ContactCollectionBlone contacts = context.read();
    final Demarche demarche = context.watch();
    final AppTheme theme = context.watch();

    final params = EditorParams(
      mode: contactId != null ? EditorMode.update : EditorMode.create,
    );

    if (contactId == null && params.mode != EditorMode.create) {
      throw StateError(
          'The object id is null while the editor mode is not create'
          '\n'
          'A contact .');
    }

    if (etablissementId == null && params.mode == EditorMode.create) {
      throw StateError(
          'The etablissementId id is null while the editor mode is create.'
          '\n'
          'An etablissement is required to create a contact.');
    }

    Future<ContactSnippet> getSnippet() async {
      if (params.mode == EditorMode.create) {
        return contacts.createSnippet(
          demarcheId: demarche.id,
          etablissementId: etablissementId!,
        );
      } else {
        return contacts.getSnippet(contactId: contactId!);
      }
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(
            params.mode == EditorMode.create ? "Nouveau contact" : 'Contact'),
      ),
      child: PaddedSingleChildScrollable(
        child: Wrapper(
          children: [
            FutureLoader<ContactSnippet>(
              future: getSnippet(),
              builder: (context, snapshot) {
                final contact = snapshot.data;
                return ContactForm(contact: contact);
              },
            )
          ],
        ),
      ),
    );
  }
}

/// Contact form with access to
///
/// - personne
/// - etablissement
class ContactForm extends StatelessWidget {
  final ContactSnippet contact;

  const ContactForm({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => EditablePersonne(contact.personne)),
        ChangeNotifierProvider(create: (_) => EditableContact(contact.contact)),
      ],
      child: Column(
        children: [
          const PersonneForm(),
          Leading.vMedium(),
          const EtablissementPicker(),
          _ContactSaveBar(),
        ],
      ),
    );
  }
}

class EtablissementPicker extends StatelessWidget {
  const EtablissementPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.watch();
    final EntrepriseCollectionBlone entreprises = context.watch();
    final EditableContact contact = context.watch();

    return FutureLoader<Iterable<EntrepriseSnippet>>(
      future: entreprises.getSnippets(demarcheId: demarche.id),
      builder: (context, snapshot) {
        final entreprises = snapshot.data;
        final etablissements = entreprises.expand((e) => e.etablissements);

        final matches =
            etablissements.where((e) => e.id == contact.value.etablissementId);
        final selected = matches.isEmpty ? null : matches.first;

        return DropdownSearch<Etablissement>(
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration:
                InputDecoration(labelText: "Etablissement"),
          ),
          popupProps: const PopupProps.dialog(
            showSearchBox: true,
          ),
          // onFind: (String? filter) async {
          //   if (filter == null) return etablissements.toList();
          //
          //   return entreprises
          //       .where((e) => e.entreprise.denomination.contains(filter))
          //       .expand((e) => e.etablissements)
          //       .toList();
          // },
          items: etablissements.toList(),
          itemAsString: (Etablissement? etablissement) => etablissement == null
              ? '...'
              : '${entreprises.firstWhere((e) => e.entreprise.id == etablissement.entrepriseId).entreprise.denomination}: ${etablissement.siret}',
          onChanged: (etablissement) {
            if (etablissement != null) {
              contact.update(
                  contact.value.copyWith(etablissementId: etablissement.id));
            }
          },
          // emptyBuilder: (context, filter) => Center(
          //   child: Text(
          //     filter == null ? '' : "Pas d'établissement trouvé pour $filter",
          //   ),
          // ),
          selectedItem: selected,
        );
      },
    );
  }
}

class _ContactSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditablePersonne personne = context.watch();
    final EditableContact contact = context.watch();
    final PersonneCollectionBlone personnes = context.watch();
    final ContactCollectionBlone contacts = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: chauffeur.routeMaster.history.back,
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            await personnes.save(personne.value);
            await contacts.save(contact.value);
            chauffeur.routeMaster.history.back();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

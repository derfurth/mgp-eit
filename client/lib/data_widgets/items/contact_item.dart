import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/models/snippets.dart';

class ContactItem extends StatelessWidget {
  final String demarcheId;
  final ContactSnippet snippet;

  const ContactItem({
    super.key,
    required this.snippet,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final etablissement = snippet.entreprise.etablissements
        .firstWhere((e) => e.id == snippet.contact.etablissementId);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(snippet.personne.displayName),
              Text(snippet.entreprise.entreprise.denomination),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(snippet.personne.email),
              Text(etablissement.siret),
            ],
          ),
          onTap: () => chauffeur.editContact(demarcheId, snippet.contact.id),
        ),
      ),
    );
  }
}

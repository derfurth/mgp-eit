import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/models/snippets.dart';

class EntrepriseItem extends StatelessWidget {
  final String demarcheId;
  final EntrepriseSnippet snippet;

  const EntrepriseItem({
    super.key,
    required this.snippet,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(snippet.entreprise.denomination),
              Chip(
                label: Text(
                  snippet.etablissements.length.toString(),
                ),
              ),
            ],
          ),
          subtitle: Text(snippet.entreprise.siren),
          onTap: () =>
              chauffeur.editEntreprise(demarcheId, snippet.entreprise.id),
        ),
      ),
    );
  }
}

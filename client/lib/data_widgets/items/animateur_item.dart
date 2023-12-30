import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/models/snippets.dart';

class AnimateurItem extends StatelessWidget {
  final String demarcheId;
  final AnimateurSnippet snippet;

  const AnimateurItem({
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
              Text(snippet.personne.displayName),
            ],
          ),
          subtitle: Text(snippet.personne.email),
          onTap: () =>
              chauffeur.editAnimateur(demarcheId, snippet.animateur.id),
        ),
      ),
    );
  }
}

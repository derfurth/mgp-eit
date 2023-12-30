import 'package:flutter/material.dart';
import 'package:mgp_client/blones/collection/atelier_collection_blones.dart';
import 'package:provider/provider.dart';

import '../../chauffeur/chauffeur.dart';
import '../../models/donnees.dart';
import '../../utils/time_utils.dart';

class AtelierItem extends StatelessWidget {
  final String demarcheId;
  final Atelier atelier;

  const AtelierItem({
    super.key,
    required this.atelier,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _showDeleteDialog(context, atelier),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(atelier.organisateur),
          Text(TimeUtils.millisToFrench(atelier.dateMs)),
        ],
      ),
      subtitle: Text(atelier.lieu),
      onTap: () => chauffeur.editAtelier(demarcheId, atelier.id),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, Atelier atelier) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final AtelierCollectionBlone ateliers = context.read();

        return AlertDialog(
          title: const Text('Suppression d\'atelier'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Supprimer l\'atelier de ${atelier.organisateur} ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Supprimer'),
              onPressed: () async {
                await ateliers.delete(atelier.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';

import '../../models/donnees.dart';

class AdministrateurItem extends StatelessWidget {
  final Administrateur administrateur;

  const AdministrateurItem({
    super.key,
    required this.administrateur,
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
              Text(administrateur.displayName),
            ],
          ),
          onTap: () => chauffeur.editAdministrateur(administrateur.id),
        ),
      ),
    );
  }
}

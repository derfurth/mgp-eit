import 'package:flutter/material.dart';
import 'package:mgp_client/blones/collection/flux_collection_blone.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/components/future_loader.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/snippets.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class FluxItem extends StatelessWidget {
  final String demarcheId;
  final Flux flux;
  final bool navigateOnTap;

  const FluxItem({
    super.key,
    required this.flux,
    required this.demarcheId,
    this.navigateOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    final Thematiques thematiques = context.watch();
    final FluxCollectionBlone fluxes = context.watch();

    return ListTile(
      leading: Tooltip(
        message: flux.direction.name,
        child: Icon(flux.direction == FluxDirection.entrant
            ? Icons.login
            : Icons.logout),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 5,
            children: [
              Text(flux.resourceNom),
              for (final thematique in thematiques
                  .where((t) => flux.thematiqueIds.contains(t.id)))
                Text(thematique.nom).opacity(.5),
            ],
          ),
          FutureLoader<FluxSnippet>(
            future: fluxes.getSnippet(fluxId: flux.id),
            builder: (context, snapshot) {
              return Row(
                children: [
                  Text(
                      snapshot.data.contact.entreprise.entreprise.denomination),
                ],
              );
            },
          ),
        ],
      ),
      subtitle: Wrap(
        spacing: 5,
        children: [
          Text(flux.quantite.toString()),
          Text(flux.unite),
        ],
      ),
      onTap:
          navigateOnTap ? () => chauffeur.editFlux(demarcheId, flux.id) : null,
    );
  }
}

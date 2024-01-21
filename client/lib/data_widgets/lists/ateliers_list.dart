import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blones/collection/animation_collection_blones.dart';
import '../../blones/collection/atelier_collection_blones.dart';
import '../../chauffeur/chauffeur.dart';
import '../../components/future_scrollable_list.dart';
import '../../components/layout.dart';
import '../../data_widgets/items/animateur_item.dart';
import '../../data_widgets/items/atelier_item.dart';
import '../../data_widgets/items/co_animateur_item.dart';
import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../../styled_widgets/bottom_fab.dart';
import '../../styled_widgets/page_header.dart';

class AteliersList extends StatelessWidget {
  const AteliersList({
    super.key,
    required this.demarcheId,
  });

  final String demarcheId;

  @override
  Widget build(BuildContext context) {
    final AtelierCollectionBlone ateliers = context.watch();
    final CoAnimateurCollectionBlone coAnimateurs = context.watch();
    final AnimateurCollectionBlone animateurs = context.watch();

    return DefaultTabController(
      length: 3,
      child: Body(
        header: const PageHeader(
          title: 'Ateliers',
          tabs: [
            Tab(text: 'Ateliers'),
            Tab(text: 'Animateurs'),
            Tab(text: 'Co-Animateurs'),
          ],
        ),
        child: TabBarView(
          children: [
            /// Ateliers tab
            Stack(
              children: [
                FutureScrollableList<Atelier>(
                  future: ateliers.getAll(demarcheId: demarcheId),
                  builder: (context, atelier) {
                    return AtelierItem(
                        atelier: atelier, demarcheId: demarcheId);
                  },
                ),
                BottomFab(
                  onPressed: () => chauffeur.createAtelier(demarcheId),
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            /// Animateurs tab
            Stack(
              children: [
                FutureScrollableList<AnimateurSnippet>(
                  future: animateurs.getSnippets(demarcheId: demarcheId),
                  builder: (context, snippet) {
                    return AnimateurItem(
                        snippet: snippet, demarcheId: demarcheId);
                  },
                ),
                BottomFab(
                  onPressed: () => chauffeur.createAnimateur(demarcheId),
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            /// Co-Animateurs tab
            Stack(
              children: [
                FutureScrollableList<CoAnimateurSnippet>(
                  future: coAnimateurs.getSnippets(demarcheId: demarcheId),
                  builder: (context, snippet) {
                    return CoAnimateurItem(
                      snippet: snippet,
                      demarcheId: demarcheId,
                    );
                  },
                ),
                BottomFab(
                  onPressed: () => chauffeur.createCoAnimateur(demarcheId),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

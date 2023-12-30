import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';

import '../data_widgets/editors/co_animateur_editor.dart';

class CoAnimateurPage extends StatelessWidget {
  final String demarcheId;
  final String? coAnimateurId;

  const CoAnimateurPage(
      {super.key, required this.demarcheId, this.coAnimateurId});

  @override
  Widget build(BuildContext context) {
    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: CoAnimateurEditor(coAnimateurId: coAnimateurId),
      ),
    );
  }
}

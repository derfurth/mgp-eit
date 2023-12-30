import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/animateur_editor.dart';

class AnimateurPage extends StatelessWidget {
  final String demarcheId;
  final String? animateurId;

  const AnimateurPage({super.key, required this.demarcheId, this.animateurId});

  @override
  Widget build(BuildContext context) {
    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: AnimateurEditor(animateurId: animateurId),
      ),
    );
  }
}

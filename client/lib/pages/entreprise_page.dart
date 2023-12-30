import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/entreprise_editor.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';

class EntreprisePage extends StatelessWidget {
  final String demarcheId;
  final String? entrepriseId;

  const EntreprisePage({super.key, required this.demarcheId, this.entrepriseId});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.entreprise;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: EntrepriseEditor(entrepriseId: entrepriseId),
      ),
    );
  }
}

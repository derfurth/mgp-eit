import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/synergie_editor.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';

class SynergiePage extends StatelessWidget {
  final String demarcheId;
  final String? synergieId;

  const SynergiePage({super.key, required this.demarcheId, this.synergieId});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.synergies;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: SynergieEditor(synergieId: synergieId),
      ),
    );
  }
}

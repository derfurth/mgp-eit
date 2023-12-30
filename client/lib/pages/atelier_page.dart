import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/atelier_editor.dart';
import 'package:provider/src/provider.dart';

import '../app_theme.dart';

class AtelierPage extends StatelessWidget {
  final String demarcheId;
  final String? atelierId;

  const AtelierPage({super.key, required this.demarcheId, this.atelierId});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.atelier;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: AtelierEditor(atelierId: atelierId),
      ),
    );
  }
}

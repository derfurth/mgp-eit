import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/flux_editor.dart';
import 'package:provider/src/provider.dart';

import '../app_theme.dart';

class FluxPage extends StatelessWidget {
  final String demarcheId;
  final String? fluxId;

  const FluxPage({super.key, required this.demarcheId, this.fluxId});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.flux;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: FluxEditor(fluxId: fluxId),
      ),
    );
  }
}

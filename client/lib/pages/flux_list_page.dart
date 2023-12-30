import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/lists/flux_list.dart';
import 'package:provider/src/provider.dart';

import '../app_theme.dart';

class FluxListPage extends StatelessWidget {
  final String demarcheId;

  const FluxListPage({
    super.key,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.flux;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: FluxList(demarcheId: demarcheId),
      ),
    );
  }
}

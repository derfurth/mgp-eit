import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/lists/synergies_list.dart';
import 'package:provider/provider.dart';

class SynergiesPage extends StatelessWidget {
  final String demarcheId;

  const SynergiesPage({
    super.key,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.synergies;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: SynergiesList(demarcheId: demarcheId),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/lists/acteurs_list.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';

class ActeursPage extends StatelessWidget {
  final String demarcheId;

  const ActeursPage({
    super.key,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.entreprise;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: ActeursList(demarcheId: demarcheId),
      ),
    );
  }
}

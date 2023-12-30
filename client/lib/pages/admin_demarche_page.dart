import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_widgets/editors/demarche_editor.dart';
import '../app_theme.dart';
import '../components/layout.dart';

class AdminDemarchePage extends StatelessWidget {
  final String? demarcheId;

  const AdminDemarchePage({super.key, required this.demarcheId});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.admin;

    return Layout(
      navigation: Container(),
      body: DemarcheEditor(
        demarcheId: demarcheId,
      ),
    );
  }
}

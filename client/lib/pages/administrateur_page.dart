import 'package:flutter/material.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/components/navigation.dart';

import '../data_widgets/editors/administrateur_editor.dart';

class AdministrateurPage extends StatelessWidget {
  final String? administrateurId;

  const AdministrateurPage({super.key, this.administrateurId});

  @override
  Widget build(BuildContext context) {
    return Layout(
      navigation: const VerticalAdminNavigation(),
      body: AdministrateurEditor(administrateurId: administrateurId),
    );
  }
}

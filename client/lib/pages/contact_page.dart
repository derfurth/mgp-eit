import 'package:flutter/material.dart';
import 'package:mgp_client/components/demarche_loader.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:mgp_client/data_widgets/editors/contact_editor.dart';
import 'package:provider/src/provider.dart';

import '../app_theme.dart';

class ContactPage extends StatelessWidget {
  final String demarcheId;
  final String? contactId;
  final String? etablissementId;

  const ContactPage({
    super.key,
    required this.demarcheId,
    this.contactId,
    this.etablissementId,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    theme.flavor = ThemeFlavor.entreprise;

    return DemarcheLoader(
      demarcheId: demarcheId,
      child: Layout(
        body: ContactEditor(
          contactId: contactId,
          etablissementId: etablissementId,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/blones/auth_blone.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../blones/collection/demarche_collection_blone.dart';
import 'layout.dart';

/// Load a démarche and provide a snippet.
class DemarcheLoader extends StatelessWidget {
  final String demarcheId;
  final Widget? child;
  final Widget? loading;

  const DemarcheLoader({
    super.key,
    this.child,
    this.loading,
    required this.demarcheId,
  });

  @override
  Widget build(BuildContext context) {
    final DemarcheCollectionBlone demarches = context.watch();
    final AppTheme theme = context.watch();
    final AuthBlone auth = context.watch();

    return auth.user.maybeMap(
      connected: (_) {
        return FutureBuilder<Demarche>(
        future: demarches.getById(demarcheId),
        builder: (context, snapshot) {
          final demarche = snapshot.data;
          if (demarche == null) {
            return loading ??
                Layout(
                  navigation: ColoredBox(
                    color: theme.surface,
                  ),
                  body: Body(
                    header: SizedBox(height: 10 * theme.grid),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
          }
          return Provider<Demarche>.value(
            value: demarche,
            child: child,
          );
        },
      );
      },
      orElse: () {
        return const LinearProgressIndicator();
      },
    );
  }
}

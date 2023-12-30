import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mgp_client/models/ui_message.dart';

import 'commands.dart';

/// Provided to
class ShowMessageCommand extends AppCommand {
  final log = Logger('ShowMessageCommand');

  Future<void> execute(UIMessage message) async {
    log.info('📃 $message');

    final color = message.maybeMap<Color?>(
      saveError: (_) => Theme.of(mainContext).colorScheme.error,
      authError: (_) => Theme.of(mainContext).colorScheme.error,
      error: (_) => Theme.of(mainContext).colorScheme.error,
      orElse: () => null,
    );

    final duration = message.maybeMap<Duration>(
      saveError: (_) => const Duration(seconds: 8),
      authError: (_) => const Duration(seconds: 8),
      error: (_) => const Duration(seconds: 8),
      orElse: () => const Duration(seconds: 2),
    );

    final icon = message.maybeMap<IconData?>(
      saveError: (_) => Icons.save,
      save: (_) => Icons.save,
      orElse: () => null,
    );

    final text = message.map<String>(
      loading: (m) => 'chargement en cours',
      download: (m) => m.message,
      save: (m) => m.message,
      saveError: (m) => m.message,
      error: (m) => m.message,
      plain: (m) => m.message,
      auth: (m) => m.message,
      authError: (m) => m.message,
      none: (_) => '',
    );

    if (text.isNotEmpty) {
      final snackBar = SnackBar(
        backgroundColor: color,
        duration: duration,
        content: SizedBox(
          height: 32,
          child: Row(
            children: <Widget>[
              if (icon != null) Icon(icon),
              Container(width: 6),
              Text(text),
            ],
          ),
        ),
      );
      ScaffoldMessenger.of(mainContext).showSnackBar(snackBar);
    }
  }
}

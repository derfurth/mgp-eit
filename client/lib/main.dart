import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/blones/app_blone.dart';
import 'package:mgp_client/commands/show_message_command.dart';
import 'package:mgp_client/supabase/constants.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_theme.dart';
import 'chauffeur/chauffeur.dart';
import 'chauffeur/routemaster.dart';

void main() async {
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);

  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnnonKey,
    debug: true,
  );

  supabase.client.auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;

    if (event == AuthChangeEvent.passwordRecovery) {
      chauffeur.changePassword();
    }
  });

  final app = AppBlone(
    supabaseClient: supabase.client,
    showMessage: ShowMessageCommand().execute,
  );
  runApp(MainApp(app));
  WidgetsFlutterBinding.ensureInitialized();

  app.mount();
}

/// MainApp
class MainApp extends StatefulWidget {
  final AppBlone app;

  const MainApp(this.app, {super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    /// Main application
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppTheme()),
        ChangeNotifierProvider.value(value: widget.app),
        ChangeNotifierProvider.value(value: widget.app.personnes),
        ChangeNotifierProvider.value(value: widget.app.administrateurs),
        ChangeNotifierProvider.value(value: widget.app.demarches),
        ChangeNotifierProvider.value(value: widget.app.animateurs),
        ChangeNotifierProvider.value(value: widget.app.coAnimateurs),
        ChangeNotifierProvider.value(value: widget.app.ateliers),
        ChangeNotifierProvider.value(value: widget.app.participantMeta),
        ChangeNotifierProvider.value(value: widget.app.fiches),
        ChangeNotifierProvider.value(value: widget.app.entreprises),
        ChangeNotifierProvider.value(value: widget.app.etablissements),
        ChangeNotifierProvider.value(value: widget.app.contacts),
        ChangeNotifierProvider.value(value: widget.app.flux),
        ChangeNotifierProvider.value(value: widget.app.synergies),
        ChangeNotifierProvider.value(value: widget.app.auth),
        Provider.value(value: widget.app.rapport),
      ],
      child: Builder(builder: (context) {
        final AppTheme appTheme = context.watch();

        return MaterialApp.router(
          // debugShowCheckedModeBanner: false,
          title: "Synergies",
          theme: appTheme.themeData,
          routerDelegate: routeMaster,
          routeInformationParser: const RoutemasterParser(),

          /// Wrap root navigator in various styling widgets
          builder: (_, navigator) {
            // Wrap root page in a builder, so we can make initial responsive tweaks based on MediaQuery
            return Builder(builder: (c) {
              return navigator ?? Container();
            });
          },
        );
      }),
    );
  }
}

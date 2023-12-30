import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blones/auth_blone.dart';
import '../chauffeur/chauffeur.dart';
import '../models/authentication.dart';
import '../styled_widgets/heading.dart';
import '../styled_widgets/wrapper.dart';

class ConnectedInfo extends StatelessWidget {
  final User user;

  const ConnectedInfo(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBlone auth = context.watch();
    final email = user.maybeMap(
      connected: (user) => user.email,
      orElse: () => '...',
    );

    return Wrapper(
      children: [
        Heading.h4('Bienvenue'),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            filled: true,
          ),
          readOnly: true,
          initialValue: email,
        ),
        ButtonBar(
          children: [
            TextButton(
              onPressed: () => auth.signOut(),
              child: const Text('Se déconnecter'),
            ),
            ElevatedButton(
              onPressed: () => chauffeur.chooseDemarche(),
              child: const Text('Continuer'),
            ),
          ],
        ),
      ],
    );
  }
}

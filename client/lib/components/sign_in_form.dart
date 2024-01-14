import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../blones/auth_blone.dart';
import '../environment.dart';
import '../models/faked.dart';
import '../styled_widgets/heading.dart';
import '../styled_widgets/wrapper.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool connecting = false;

  void connect(AuthBlone auth) async {
    setState(() {
      connecting = true;
    });

    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      await auth.signInWithPassword(email, password);
    }

    setState(() {
      connecting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthBlone auth = context.watch();
    return Wrapper(
      children: [
        Heading.h4('Connexion'),
        connecting
            ? const CircularProgressIndicator()
            : Form(
                key: formKey,
                child: Wrapper(
                  children: [
                    if (Environment.showSpikes)
                      _Spike(onSelect: auth.signInWithPassword),
                    SupaEmailAuth(
                      redirectTo: kIsWeb ? null : 'io.supabase.flutter://',
                      onSignInComplete: (response) {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      onSignUpComplete: (response) {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      metadataFields: [
                        MetaDataField(
                          prefixIcon: const Icon(Icons.person),
                          label: 'Email',
                          key: 'username',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter something';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

class _Spike extends StatelessWidget {
  final void Function(String email, String password) onSelect;

  const _Spike({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [yolododo, yulududu, yilididi, yaladada]
          .map(
            (u) => OutlinedButton(
              child: Text(u.email),
              onPressed: () => onSelect(u.email, u.password),
            ),
          )
          .toList(),
    );
  }
}

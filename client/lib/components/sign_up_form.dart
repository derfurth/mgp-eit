import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blones/auth_blone.dart';
import '../styled_widgets/heading.dart';
import '../styled_widgets/wrapper.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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

      await auth.signUpWithPassword(email, password);
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
        Heading.h4('Nouveau compte'),
        connecting
            ? const CircularProgressIndicator()
            : Form(
                key: formKey,
                child: Wrapper(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        filled: true,
                      ),
                      onSaved: (value) => email = value ?? '',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        filled: true,
                      ),
                      onSaved: (value) => password = value ?? '',
                      obscureText: true,
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: connecting ? null : () => connect(auth),
                          child: const Text('Se connecter'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/styled_widgets/heading.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';

/// Password update form
class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final formKey = GlobalKey<FormState>();

  String password = '';
  bool updating = false;

  void onErrorAuthenticating(String message) {
    showMessage(message);
  }

  void showMessage(String message) {
    print(message);
  }

  void updatePassword() async {
    setState(() {
      updating = true;
    });
    final form = formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      print('changing actual password to $password');
      // todo
      const success = true;

      if (success) {
        chauffeur.profile();
      } else {
        showMessage('Erreur de changement de mot de passe');
      }
    }

    setState(() {
      updating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      children: [
        Heading.h4('Connexion'),
        Form(
          key: formKey,
          child: Wrapper(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nouveau mot de passe',
                  filled: true,
                ),
                onSaved: (value) => password = value ?? '',
                obscureText: true,
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: updating ? null : updatePassword,
                    child: const Text('Mettre à jour'),
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

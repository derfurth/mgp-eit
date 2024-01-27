import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/styled_widgets/heading.dart';
import 'package:mgp_client/utils/show_snack_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../styled_widgets/leading.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    super.key,
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    // final AppTheme theme = context.read();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Heading.h3('Nouveau mot de passe'),
                Leading.vSmall(),
                SupabaseResetPassword(
                  accessToken:
                      Supabase.instance.client.auth.currentSession!.accessToken,
                  onSuccess: (response) => chauffeur.land(),
                ),
                Leading.vSmall(),
                TextButton(
                  child: const Text(
                    "Revenir à l'accueil",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => chauffeur.land(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// UI component to create password reset form
class SupabaseResetPassword extends StatefulWidget {
  /// accessToken of the user
  final String? accessToken;

  /// Method to be called when the auth action is success
  final void Function(UserResponse response) onSuccess;

  /// Method to be called when the auth action threw an exception
  final void Function(Object error)? onError;

  const SupabaseResetPassword({
    super.key,
    this.accessToken,
    required this.onSuccess,
    this.onError,
  });

  @override
  State<SupabaseResetPassword> createState() => _SupabaseResetPasswordState();
}

class _SupabaseResetPasswordState extends State<SupabaseResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final supabase = Supabase.instance.client;

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return "Saisissez un mot de passe d'au moins 6 caractères";
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              label: Text('Votre mot de passe'),
            ),
            controller: _password,
          ),
          Leading.vSmall(),
          ElevatedButton(
            child: const Text(
              'Changer de mot de passe',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              try {
                final response = await supabase.auth.updateUser(
                  UserAttributes(
                    password: _password.text,
                  ),
                );
                widget.onSuccess.call(response);
              } on AuthException catch (error) {
                if (widget.onError == null && context.mounted) {
                  context.showErrorSnackBar(error.message);
                } else {
                  widget.onError?.call(error);
                }
              } catch (error) {
                if (widget.onError == null && context.mounted) {
                  context.showErrorSnackBar('Une erreur est survenue: $error');
                } else {
                  widget.onError?.call(error);
                }
              }
            },
          ),
          Leading.vSmall(),
        ],
      ),
    );
  }
}

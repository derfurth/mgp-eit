import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/chauffeur/chauffeur.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/utils/show_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                    SupabaseEmailAuth(
                      redirectTo: kIsWeb ? null : 'io.supabase.flutter://',
                      onSignInComplete: (response) {
                        chauffeur.land();
                      },
                      onSignUpComplete: (response) {
                        chauffeur.land();
                      },
                      onPasswordResetEmailSent: () => chauffeur.land(),
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

class SupabaseEmailAuth extends StatefulWidget {
  final String? redirectTo;
  final void Function(AuthResponse response) onSignInComplete;
  final void Function(AuthResponse response) onSignUpComplete;
  final void Function()? onPasswordResetEmailSent;
  final void Function(Object error)? onError;

  const SupabaseEmailAuth({
    super.key,
    this.redirectTo,
    required this.onSignInComplete,
    required this.onSignUpComplete,
    this.onPasswordResetEmailSent,
    this.onError,
  });

  @override
  State<SupabaseEmailAuth> createState() => _SupabaseEmailAuthState();
}

class _SupabaseEmailAuthState extends State<SupabaseEmailAuth> {
  final supabase = Supabase.instance.client;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  /// The user has pressed forgot password button
  bool _forgotPassword = false;

  final bool _isSigningIn = true; // Removed sign up

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !EmailValidator.validate(_emailController.text)) {
                return "L'adresse email doit être valide";
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              label: Text('Votre email'),
            ),
            controller: _emailController,
          ),
          if (!_forgotPassword) ...[
            Leading.vHair(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Le mot de passe doit faire au moins 6 caractères de long.';
                }
                return null;
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                label: Text('Mot de passe'),
              ),
              obscureText: true,
              controller: _passwordController,
            ),
            Leading.vSmall(),
            ElevatedButton(
              child: (_isLoading)
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Text(_isSigningIn ? 'Se connecter' : "S'enregistrer"),
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                setState(() {
                  _isLoading = true;
                });
                try {
                  if (_isSigningIn) {
                    final response = await supabase.auth.signInWithPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                    widget.onSignInComplete.call(response);
                  } else {
                    final response = await supabase.auth.signUp(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                      emailRedirectTo: widget.redirectTo,
                    );
                    widget.onSignUpComplete.call(response);
                  }
                } on AuthException catch (error) {
                  if (widget.onError == null && context.mounted) {
                    context.showErrorSnackBar(error.message);
                  } else {
                    widget.onError?.call(error);
                  }
                } catch (error) {
                  if (widget.onError == null && context.mounted) {
                    context
                        .showErrorSnackBar('Une erreur est survenue : $error');
                  } else {
                    widget.onError?.call(error);
                  }
                }
                if (mounted) {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
            Leading.vHair(),
            if (_isSigningIn) ...[
              TextButton(
                onPressed: () {
                  setState(() {
                    _forgotPassword = true;
                  });
                },
                child: const Text('Mot de passe oublié ?'),
              ),
            ],
            // TextButton(
            //   key: const ValueKey('toggleSignInButton'),
            //   onPressed: () {
            //     setState(() {
            //       _forgotPassword = false;
            //       _isSigningIn = !_isSigningIn;
            //     });
            //   },
            //   child: Text(_isSigningIn
            //       ? 'Don\'t have an account? Sign up'
            //       : 'Already have an account? Sign in'),
            // ),
          ],
          if (_isSigningIn && _forgotPassword) ...[
            Leading.vSmall(),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  setState(() {
                    _isLoading = true;
                  });

                  final email = _emailController.text.trim();
                  await supabase.auth.resetPasswordForEmail(email);
                  widget.onPasswordResetEmailSent?.call();
                } on AuthException catch (error) {
                  widget.onError?.call(error);
                } catch (error) {
                  widget.onError?.call(error);
                }
              },
              child: const Text("Envoyer l'email de réinitialisation"),
            ),
            Leading.vHair(),
            TextButton(
              onPressed: () {
                setState(() {
                  _forgotPassword = false;
                });
              },
              child: const Text('Revenir au formulaire de connexion'),
            ),
          ],
          Leading.vHair(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blones/auth_blone.dart';
import 'connected_info.dart';
import 'sign_in_form.dart';

/// Sign in form
class HomeSignIn extends StatelessWidget {
  const HomeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBlone auth = context.watch();
    final user = auth.user;
    return user.maybeMap(
      connected: (user) => ConnectedInfo(user),
      orElse: () => const SignInForm(),
    );
  }
}

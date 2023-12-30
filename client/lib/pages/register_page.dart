import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../blones/auth_blone.dart';
import '../components/connected_info.dart';
import '../components/layout.dart';
import '../components/sign_up_form.dart';
import '../styled_widgets/heading.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBlone auth = context.watch();
    final AppTheme theme = context.read();
    final user = auth.user;

    return Layout(
      navigation: Container(),
      body: Body(
        header: Padding(
          padding: EdgeInsets.only(
            bottom: theme.grid * 4,
            right: theme.grid,
          ),
          child: Heading.h3('Créer un compte'),
        ),
        child: user.maybeMap(
          connected: (user) => ConnectedInfo(user),
          orElse: () => const SignUpForm(),
        ),
      ),
    );
  }
}

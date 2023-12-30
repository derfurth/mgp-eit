import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/components/password_change.dart';
import 'package:mgp_client/components/version.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

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
    final AppTheme theme = context.read();
    return Scaffold(
      body: SizedBox.expand(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                'MOT DE PASSE',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: theme.accentTxt),
              ).padding(all: 50).fittedBox().center().backgroundLinearGradient(
                colors: [
                  theme.accent2,
                  theme.accent1,
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: Container(
                color: Colors.white70,
                child: Stack(
                  children: [
                    const Center(
                      child: PasswordChange(),
                    ),
                    const Version()
                        .padding(all: theme.grid * 2)
                        .alignment(AlignmentDirectional.bottomEnd),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

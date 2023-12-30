import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:mgp_client/components/version.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class UnknownPage extends StatelessWidget {
  final String path;

  const UnknownPage({
    super.key,
    required this.path,
  });

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
                'Page inconnue',
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
                    Text(path),
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

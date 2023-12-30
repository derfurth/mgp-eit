import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../app_theme.dart';
import '../components/home_sign_in.dart';
import '../components/version.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.read();
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'EDGAR',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: theme.accentTxt),
                  )
                      .padding(all: 50)
                      .fittedBox()
                      .center()
                      .backgroundLinearGradient(
                    colors: [
                      theme.accent2,
                      theme.accent1,
                    ],
                  ).expanded(),
                  SizedBox(
                    width: 300,
                    child: Container(
                      color: Colors.white70,
                      child: Stack(
                        children: [
                          Center(
                            child:
                                const HomeSignIn().padding(all: theme.grid * 2),
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
            const Credits().boxShadow(blurRadius: 5, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Image(image: AssetImage('logos/mgp.png'))
                  .constrained(maxHeight: 70),
              Leading.hSmall(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Avec le soutient de'),
                  const Image(image: AssetImage('logos/ademe.png'))
                      .constrained(maxHeight: 50),
                ],
              ),
              Leading.hMedium(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Conception'),
                  Row(
                    children: [
                      const Image(image: AssetImage('logos/inddigo.png'))
                          .constrained(maxHeight: 50, maxWidth: 150),
                      Leading.hSmall(),
                      const Image(image: AssetImage('logos/mydiane.png'))
                          .constrained(maxHeight: 50, maxWidth: 150),
                    ],
                  )
                ],
              ),
              Leading.hMedium(),
              Column(
                children: [
                  const Text('Développement, conception'),
                  const Image(image: AssetImage('logos/derfurth.png'))
                      .constrained(maxHeight: 50, maxWidth: 150)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

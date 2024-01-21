import 'package:flutter/material.dart';
import 'package:mgp_client/components/version.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../app_theme.dart';
import '../chauffeur/chauffeur.dart';
import '../models/donnees.dart';

/// Display the navigation accessible to the user.
class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = appSize(context.widthPx);
    return const SafeArea(
      child: VerticalDemarcheNavigation(),
    );
  }
}

class HorizontalNavigation extends StatelessWidget {
  const HorizontalNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('horizontal');
  }
}

class VerticalDemarcheNavigation extends StatelessWidget {
  const VerticalDemarcheNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    final Demarche demarche = context.watch();

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: theme.grid * 7),
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.grid * 8),
              child: InkWell(
                onTap: () => chauffeur.land(),
                child: const NavigationLogo(),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            demarche.denomination,
            style: theme.navigationTextStyle,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            chauffeur.chooseDemarche();
          },
        ),
        const Divider(),
        ListTile(
          title: Text(
            'Ateliers',
            style: theme.navigationTextStyle,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            chauffeur.listAteliers(demarche.id);
          },
        ),
        ListTile(
          title: Text(
            'Flux',
            style: theme.navigationTextStyle,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            chauffeur.listFlux(demarche.id);
          },
        ),
        ListTile(
          title: Text(
            'Synergies',
            style: theme.navigationTextStyle,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            chauffeur.listSynergies(demarche.id);
          },
        ),
        ListTile(
          title: Text(
            'Acteurs',
            style: theme.navigationTextStyle,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            chauffeur.contactsAndEntreprises(demarche.id);
          },
        ),
        const Version()
            .padding(all: theme.grid * 2)
            .alignment(AlignmentDirectional.bottomCenter)
            .opacity(.5),
      ],
    );
  }
}

class VerticalAdminNavigation extends StatelessWidget {
  const VerticalAdminNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: theme.grid * 7),
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.grid * 8),
              child: InkWell(
                onTap: () => chauffeur.land(),
                child: const NavigationLogo(),
              ),
            ),
          ),
        ),
        const Version()
            .padding(all: theme.grid * 2)
            .alignment(AlignmentDirectional.bottomCenter)
            .opacity(.5),
      ],
    );
  }
}

class NavigationLogo extends StatelessWidget {
  const NavigationLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            theme.accent2,
            theme.accent1,
          ],
        ).createShader(Offset.zero & bounds.size);
      },
      child: Text(
        'EDGAR',
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}

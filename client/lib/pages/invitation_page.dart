import 'package:flutter/material.dart';
import 'package:mgp_client/blones/collection/administrateur_collection_blone.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../blones/auth_blone.dart';
import '../blones/collection/demarche_collection_blone.dart';
import '../chauffeur/chauffeur.dart';
import '../components/demarche_loader.dart';
import '../components/layout.dart';
import '../components/sign_in_form.dart';
import '../components/sign_up_form.dart';
import '../models/authentication.dart';
import '../models/donnees.dart';
import '../models/invitation.dart';
import '../styled_widgets/heading.dart';
import '../styled_widgets/leading.dart';
import '../styled_widgets/page_header.dart';

class InvitationPage extends StatelessWidget {
  final Invitation invitation;

  const InvitationPage({
    super.key,
    required this.invitation,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBlone auth = context.watch();
    final user = auth.user;

    return Layout(
      navigation: Container(),
      body: user.maybeMap(
        connected: (user) {
          return switch (invitation) {
            AdministrateurInvitation() => AdminInvitationClaim(
                user: user, invitation: invitation as AdministrateurInvitation),
            AnimateurInvitation() => DemarcheInvitationClaim(
                user: user, invitation: invitation as DemarcheInvitation),
            CoAnimateurInvitation() => DemarcheInvitationClaim(
                user: user, invitation: invitation as DemarcheInvitation)
          };
        },
        orElse: () => const Sign(),
      ),
    );
  }
}

class Sign extends StatelessWidget {
  const Sign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Body(
        header: PageHeader(
          title: 'Invitation',
          tabs: [
            Tab(text: 'Se connecter'),
            Tab(text: 'Créer un compte'),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              // todo update those forms
              SignInForm(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class DemarcheInvitationClaim extends StatelessWidget {
  final User user;
  final DemarcheInvitation invitation;

  const DemarcheInvitationClaim({
    super.key,
    required this.user,
    required this.invitation,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.read();

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3('Invitation'),
      ),
      child: DemarcheLoader(
        demarcheId: invitation.demarcheId,
        child: Builder(
          builder: (BuildContext context) {
            final Demarche demarche = context.watch();
            final DemarcheCollectionBlone demarches = context.watch();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Leading.vMedium(),
                Text(
                  'Rejoindre la démarche ${demarche.denomination} '
                  'en tant ${invitation is AnimateurInvitation ? "qu'animateur" : "que co-animateur"}.',
                ),
                Leading.vSmall(),
                ElevatedButton(
                  onPressed: () async {
                    await demarches.acceptInvitation(invitation);
                    chauffeur.land();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AdminInvitationClaim extends StatelessWidget {
  final User user;
  final AdministrateurInvitation invitation;

  const AdminInvitationClaim({
    super.key,
    required this.user,
    required this.invitation,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.read();

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3('Invitation'),
      ),
      child: Builder(
        builder: (BuildContext context) {
          final AdministrateurCollectionBlone administrateurs = context.read();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Leading.vMedium(),
              const Text('Devenir administrateur.'),
              Leading.vSmall(),
              ElevatedButton(
                onPressed: () async {
                  await administrateurs.claim(
                    administrateurId: invitation.administrateurId,
                  );
                  chauffeur.land();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      ),
    );
  }
}

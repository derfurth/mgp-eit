import '../chauffeur/place.dart';
import '../models/authentication.dart';
import '../pages/acteurs_page.dart';
import '../pages/admin_demarche_page.dart';
import '../pages/animateur_page.dart';
import '../pages/atelier_page.dart';
import '../pages/ateliers_page.dart';
import '../pages/change_password_page.dart';
import '../pages/co_animateur_page.dart';
import '../pages/contact_page.dart';
import '../pages/demarche_choice_page.dart';
import '../pages/entreprise_page.dart';
import '../pages/flux_list_page.dart';
import '../pages/flux_page.dart';
import '../pages/invitation_page.dart';
import '../pages/landing_page.dart';
import '../pages/profile_page.dart';
import '../pages/synergie_page.dart';
import '../pages/synergies_page.dart';

const String creationId = "nouveau";

/// Provide routes to routermaster
final places = [
  // Flow
  landingPlace,
  profilePlace,
  changePasswordPlace,
  demarcheChoicePlace,
  invitationAnimateurPlace,
  invitationCoAnimateurPlace,
  // Administration
  demarcheEditorPlace,
  // Animation
  animateurEditorPlace,
  coAnimateurEditorPlace,
  ateliers,
  atelierEditorPlace,
  // Entreprises
  contactsEtEntreprises,
  contactEditorPlace,
  contactCreatorPlace,
  entrepriseEditorPlace,
  fluxList,
  fluxEditorPlace,
  // Synergies
  synergies,
  synergieEditorPlace,
];

// --------------------------------------------
// Flow
// --------------------------------------------

final landingPlace = Place(
  path: '/',
  builder: (info) {
    return const LandingPage();
  },
);

final profilePlace = Place(
  path: '/profile',
  builder: (info) {
    return const ProfilePage();
  },
);

final changePasswordPlace = Place(
  path: '/update_password',
  builder: (info) {
    return const ChangePasswordPage();
  },
);

final demarcheChoicePlace = Place(
  path: '/demarche',
  builder: (info) {
    return const DemarcheChoicePage();
  },
);

final invitationAnimateurPlace = Place(
  path: '/invitation/demarche/:demarcheId/animateur/:animateurId',
  builder: (info) {
    final params = info.pathParameters;
    final invitation = Invitation.animateur(
      demarcheId: params['demarcheId']!,
      animateurId: params['animateurId']!,
    );

    return InvitationPage(
      invitation: invitation,
    );
  },
);

final invitationCoAnimateurPlace = Place(
  path: '/invitation/demarche/:demarcheId/co_animateur/:coAnimateurId',
  builder: (info) {
    final params = info.pathParameters;
    final invitation = Invitation.coAnimateur(
      demarcheId: params['demarcheId']!,
      coAnimateurId: params['coAnimateurId']!,
    );

    return InvitationPage(
      invitation: invitation,
    );
  },
);

// --------------------------------------------
// Administration
// --------------------------------------------

final demarcheEditorPlace = Place(
  path: '/administration/demarche/:demarcheId',
  builder: (info) {
    final params = info.pathParameters;

    return AdminDemarchePage(
      demarcheId:
          params['demarcheId'] == creationId ? null : params['demarcheId'],
    );
  },
);

// --------------------------------------------
// Animation
// --------------------------------------------

/// AnimateurEditor
final animateurEditorPlace = Place(
  path: '/demarche/:demarcheId/animateur/:animateurId',
  builder: (info) {
    final params = info.pathParameters;

    return AnimateurPage(
      demarcheId: params['demarcheId']!,
      animateurId:
          params['animateurId'] == creationId ? null : params['animateurId'],
    );
  },
);

/// CoAnimateurEditor
final coAnimateurEditorPlace = Place(
  path: '/demarche/:demarcheId/co_animateur/:coAnimateurId',
  builder: (info) {
    final params = info.pathParameters;

    return CoAnimateurPage(
      demarcheId: params['demarcheId']!,
      coAnimateurId: params['coAnimateurId'] == creationId
          ? null
          : params['coAnimateurId'],
    );
  },
);

/// Atelier list
final ateliers = Place(
  path: '/demarche/:demarcheId/ateliers',
  builder: (info) {
    final params = info.pathParameters;

    return AteliersPage(demarcheId: params['demarcheId']!);
  },
);

/// AtelierEditor
final atelierEditorPlace = Place(
  path: '/demarche/:demarcheId/atelier/:atelierId',
  builder: (info) {
    final params = info.pathParameters;

    return AtelierPage(
      demarcheId: params['demarcheId']!,
      atelierId: params['atelierId'] == creationId ? null : params['atelierId'],
    );
  },
);

// --------------------------------------------
// Entreprises
// --------------------------------------------

/// Contacts
final contactsEtEntreprises = Place(
  path: '/demarche/:demarcheId/contacts',
  builder: (info) {
    final params = info.pathParameters;

    return ActeursPage(demarcheId: params['demarcheId']!);
  },
);

/// ContactEditor
final contactEditorPlace = Place(
  path: '/demarche/:demarcheId/contact/:contactId',
  builder: (info) {
    final params = info.pathParameters;

    return ContactPage(
      demarcheId: params['demarcheId']!,
      contactId: params['contactId']!,
    );
  },
);

/// ContactEditor
final contactCreatorPlace = Place(
  path: '/demarche/:demarcheId/nouveau_contact/:etablissementId',
  builder: (info) {
    final params = info.pathParameters;

    return ContactPage(
      demarcheId: params['demarcheId']!,
      etablissementId: params['etablissementId']!,
    );
  },
);

/// EntrepriseEditor
final entrepriseEditorPlace = Place(
  path: '/demarche/:demarcheId/entreprise/:entrepriseId',
  builder: (info) {
    final params = info.pathParameters;

    return EntreprisePage(
      demarcheId: params['demarcheId']!,
      entrepriseId: params['entrepriseId'],
    );
  },
);

/// Flux list
final fluxList = Place(
  path: '/demarche/:demarcheId/fluxList',
  builder: (info) {
    final params = info.pathParameters;

    return FluxListPage(demarcheId: params['demarcheId']!);
  },
);

/// FluxEditor
final fluxEditorPlace = Place(
  path: '/demarche/:demarcheId/flux/:fluxId',
  builder: (info) {
    final params = info.pathParameters;

    return FluxPage(
      demarcheId: params['demarcheId']!,
      fluxId: params['fluxId'],
    );
  },
);

// --------------------------------------------
// Synergies
// --------------------------------------------

/// Synergies
final synergies = Place(
  path: '/demarche/:demarcheId/synergies',
  builder: (info) {
    final params = info.pathParameters;

    return SynergiesPage(demarcheId: params['demarcheId']!);
  },
);

/// SynergieEditor
final synergieEditorPlace = Place(
  path: '/demarche/:demarcheId/synergie/:synergieId',
  builder: (info) {
    final params = info.pathParameters;

    return SynergiePage(
      demarcheId: params['demarcheId']!,
      synergieId: params['synergieId'],
    );
  },
);

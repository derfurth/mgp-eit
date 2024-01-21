import 'package:routemaster/routemaster.dart';

import 'places.dart';
import 'routemaster.dart';

/// The global instance of chauffeur, uses the global route master.
final chauffeur = Chauffeur(routeMaster);

/// The navigation command like layer
class Chauffeur {
  Chauffeur(this.routeMaster);

  final RoutemasterDelegate routeMaster;

  // --------------------------------------------
  // Flow
  // --------------------------------------------

  NavigationResult land() => routeMaster.push(landingPlace.path);

  NavigationResult profile() => routeMaster.push(profilePlace.path);

  NavigationResult changePassword() =>
      routeMaster.push(changePasswordPlace.path);

  NavigationResult chooseDemarche() =>
      routeMaster.push(demarcheChoicePlace.path);

  NavigationResult openAnimateurInvitation(
    String demarcheId,
    String animateurId,
  ) {
    final path = invitationAnimateurPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':animateurId', animateurId);
    return routeMaster.push(path);
  }

  NavigationResult openAdministrateurInvitation(
    String administrateurId,
  ) {
    final path = invitationAdministrateurPlace.path
        .replaceAll(':administrateurId', administrateurId);
    return routeMaster.push(path);
  }

  NavigationResult openCoAnimateurInvitation(
    String demarcheId,
    String coAnimateurId,
  ) {
    final path = invitationCoAnimateurPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':coAnimateurId', coAnimateurId);
    return routeMaster.push(path);
  }

  // --------------------------------------------
  // Administration
  // --------------------------------------------

  NavigationResult editDemarche(String demarcheId) {
    final path = demarcheEditorPlace.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult createDemarche() {
    final path = demarcheEditorPlace.path.replaceAll(':demarcheId', creationId);
    return routeMaster.push(path);
  }

  // --------------------------------------------
  // Animation
  // --------------------------------------------

  NavigationResult editAdministrateur(String administrateurId) {
    final path = administrateurEditorPlace.path
        .replaceAll(':administrateurId', administrateurId);
    return routeMaster.push(path);
  }

  NavigationResult createAdministrateur() {
    final path = administrateurEditorPlace.path
        .replaceAll(':administrateurId', creationId);
    return routeMaster.push(path);
  }

  NavigationResult editAnimateur(String demarcheId, String animateurId) {
    final path = animateurEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':animateurId', animateurId);
    return routeMaster.push(path);
  }

  NavigationResult createAnimateur(String demarcheId) {
    final path = animateurEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':animateurId', creationId);
    return routeMaster.push(path);
  }

  NavigationResult editCoAnimateur(String demarcheId, String coAnimateurId) {
    final path = coAnimateurEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':coAnimateurId', coAnimateurId);
    return routeMaster.push(path);
  }

  NavigationResult createCoAnimateur(String demarcheId) {
    final path = coAnimateurEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':coAnimateurId', creationId);
    return routeMaster.push(path);
  }

  NavigationResult listAteliers(String demarcheId) {
    final path = ateliers.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult editAtelier(String demarcheId, String atelierId) {
    final path = atelierEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':atelierId', atelierId);
    return routeMaster.push(path);
  }

  NavigationResult createAtelier(String demarcheId) {
    final path = atelierEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':atelierId', creationId);
    return routeMaster.push(path);
  }

  // --------------------------------------------
  // Entreprises
  // --------------------------------------------

  NavigationResult contactsAndEntreprises(String demarcheId) {
    final path =
        contactsEtEntreprises.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult editContact(String demarcheId, String contactId) {
    final path = contactEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':contactId', contactId);
    return routeMaster.push(path);
  }

  NavigationResult createContact(String demarcheId, String etablissementId) {
    final path = contactCreatorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':etablissementId', etablissementId);
    return routeMaster.push(path);
  }

  NavigationResult editEntreprise(String demarcheId, String entrepriseId) {
    final path = entrepriseEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':entrepriseId', entrepriseId);
    return routeMaster.push(path);
  }

  NavigationResult createEntreprise(String demarcheId) {
    final path =
        entrepriseEditorPlace.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult listFlux(String demarcheId) {
    final path = fluxList.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult editFlux(String demarcheId, String fluxId) {
    final path = fluxEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':fluxId', fluxId);
    return routeMaster.push(path);
  }

  // --------------------------------------------
  // Synergies
  // --------------------------------------------

  NavigationResult listSynergies(String demarcheId) {
    final path = synergies.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }

  NavigationResult editSynergie(String demarcheId, String synergieId) {
    final path = synergieEditorPlace.path
        .replaceAll(':demarcheId', demarcheId)
        .replaceAll(':synergieId', synergieId);
    return routeMaster.push(path);
  }

  NavigationResult createSynergie(String demarcheId) {
    final path = synergieEditorPlace.path.replaceAll(':demarcheId', demarcheId);
    return routeMaster.push(path);
  }
}

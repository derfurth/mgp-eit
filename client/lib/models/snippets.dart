import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mgp_client/models/donnees.dart';

part 'snippets.freezed.dart';
part 'snippets.g.dart';

// --------------------------------------------------------------------
// All data ready to display, consolidated using multiple data sources.
//
// Built by 'collection blones' consumed by views.
// --------------------------------------------------------------------

/// Entreprise editor
@freezed
class EntrepriseSnippet with _$EntrepriseSnippet {
  factory EntrepriseSnippet({
    required Entreprise entreprise,
    required List<Etablissement> etablissements,
  }) = _EntrepriseSnippet;

  factory EntrepriseSnippet.fromJson(Map<String, dynamic> json) =>
      _$EntrepriseSnippetFromJson(json);
}

/// Contact editor, lists
@freezed
class ContactSnippet with _$ContactSnippet {
  factory ContactSnippet({
    required Contact contact,
    required Personne personne,
    required EntrepriseSnippet entreprise,
  }) = _ContactSnippet;

  factory ContactSnippet.fromJson(Map<String, dynamic> json) =>
      _$ContactSnippetFromJson(json);
}

/// Animateur editor, lists
@freezed
class AnimateurSnippet with _$AnimateurSnippet {
  factory AnimateurSnippet({
    required Animateur animateur,
    required Personne personne,
  }) = _AnimateurSnippet;

  factory AnimateurSnippet.fromJson(Map<String, dynamic> json) =>
      _$AnimateurSnippetFromJson(json);
}

/// Co-animateur editor, lists
@freezed
class CoAnimateurSnippet with _$CoAnimateurSnippet {
  factory CoAnimateurSnippet({
    @JsonKey(name: 'co_animateur') required CoAnimateur coAnimateur,
    required Personne personne,
  }) = _CoAnimateurSnippet;

  factory CoAnimateurSnippet.fromJson(Map<String, dynamic> json) =>
      _$CoAnimateurSnippetFromJson(json);
}

/// Atelier editor
@freezed
class AtelierSnippet with _$AtelierSnippet {
  factory AtelierSnippet({
    required Atelier atelier,
    required List<ContactSnippet> participants,
    required List<AnimateurSnippet> animateurs,
    @JsonKey(name: 'co_animateurs')
        required List<CoAnimateurSnippet> coAnimateurs,
  }) = _AtelierSnippet;

  factory AtelierSnippet.fromJson(Map<String, dynamic> json) =>
      _$AtelierSnippetFromJson(json);
}

/// Atelier editor ('live' view), Fiche editor
@freezed
class FicheSnippet with _$FicheSnippet {
  factory FicheSnippet({
    required Fiche fiche,
    required ContactSnippet contact,
    required Flux flux,
  }) = _FicheSnippet;

  factory FicheSnippet.fromJson(Map<String, dynamic> json) =>
      _$FicheSnippetFromJson(json);
}

/// Flux editor, lists
@freezed
class FluxSnippet with _$FluxSnippet {
  factory FluxSnippet({
    required Flux flux,
    required ContactSnippet contact,
    required List<AnimateurSnippet> animateurs,
    @JsonKey(name: 'co_animateurs')
        required List<CoAnimateurSnippet> coAnimateurs,
  }) = _FluxSnippet;

  factory FluxSnippet.fromJson(Map<String, dynamic> json) =>
      _$FluxSnippetFromJson(json);
}

/// Synergie editor
@freezed
class SynergieSnippet with _$SynergieSnippet {
  factory SynergieSnippet({
    required Synergie synergie,
    required List<Flux> flux,
  }) = _SynergieSnippet;

  factory SynergieSnippet.fromJson(Map<String, dynamic> json) =>
      _$SynergieSnippetFromJson(json);
}

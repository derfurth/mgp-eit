// ignore_for_file: invalid_annotation_target

import 'dart:collection';

import 'package:characters/characters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'donnees.freezed.dart';
part 'donnees.g.dart';

const uuid = Uuid();

mixin Storable {
  static String generateId() => uuid.v4();

  String get id;
}

// --------------------------------------------
// La seule donnée comprenant des DCPs
// --------------------------------------------

/// Une personne.
@freezed
class Personne with _$Personne, Storable {
  const Personne._();

  const factory Personne({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @Default('') String nom,
    @Default('') String prenom,
    @Default('') String email,
    @Default('') String telephone,
    @Default(false) bool limited,
    @Default(false) bool deleted,
  }) = _Personne;

  factory Personne.fromJson(Map<String, dynamic> json) =>
      _$PersonneFromJson(json);

  String get initiales {
    var s = '';
    // if (prenom.isNotEmpty) s += prenom.characters.first;
    if (nom.isNotEmpty) s += nom.characters.first;
    return s;
  }

  String get displayName {
    return '$prenom $nom';
  }
}

/// Administrateur
///
/// Peut creer des démarches et asssigner des animateurs
@freezed
class Administrateur with _$Administrateur, Storable {
  const factory Administrateur({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'personne_id') @Default('') String personneId,
  }) = _Administrateur;

  factory Administrateur.fromJson(Map<String, dynamic> json) =>
      _$AdministrateurFromJson(json);
}

/// Animateur de démarche.
///
/// `personne x démarches x ateliers`
///
/// - est une _personne_ associée à une ou plusieurs démarches
/// - ne voit pas tout mais peut créer ses propres ateliers
/// - peut ajouter des animateur de démarche
/// - peut voir ce qui se passe au sein de la même démarche
@freezed
class Animateur with _$Animateur, Storable {
  const factory Animateur({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'personne_id') @Default('') String personneId,
  }) = _Animateur;

  factory Animateur.fromJson(Map<String, dynamic> json) =>
      _$AnimateurFromJson(json);
}

/// Co-animateur d'atelier.
///
/// `personne x ateliers`
///
/// - est une _personne_ associée à un ou plusieurs ateliers
/// - sans aucun droit autres que sur l'atelier.
@freezed
class CoAnimateur with _$CoAnimateur, Storable {
  const factory CoAnimateur({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'personne_id') @Default('') String personneId,
  }) = _CoAnimateur;

  factory CoAnimateur.fromJson(Map<String, dynamic> json) =>
      _$CoAnimateurFromJson(json);
}

// --------------------------------------------
// Animation
// --------------------------------------------

/// Démarche
///
/// `denomination x description x animateurs`
///
/// - Démomination
/// - Champ libre
/// - _Animateurs_ de démarche
@freezed
class Demarche with _$Demarche, Storable {
  const factory Demarche({
    required String id,
    @Default('') String denomination,
    @JsonKey(name: 'champ_libre') @Default('') String champLibre,
  }) = _Demarche;

  factory Demarche.fromJson(Map<String, dynamic> json) =>
      _$DemarcheFromJson(json);
}

/// Atelier
///
/// `Lieu x date x contacts x fiches x
///  animateurs x co-animateurs x organisateur (texte)`
///
/// Un atelier est un évènement à un endroit avec des personnes rattachées à
/// des entreprises portant sur des _fiches_ resources.
///
/// Comprends un ou plusieurs _animateurs_ de la même démarche
/// On peut produire des rapports à partir de ses _fiches_.
/// Description et taxonomie issue de la nomenclature
@freezed
class Atelier with _$Atelier, Storable {
  const factory Atelier({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'animateur_ids') @Default([]) List<String> animateurIds,
    @JsonKey(name: 'co_animateur_ids') @Default([]) List<String> coAnimateurIds,
    @Default('') String lieu,
    @Default('') String organisateur,
    @JsonKey(name: 'date_ms') @Default(0) num dateMs,
  }) = _Atelier;

  factory Atelier.fromJson(Map<String, dynamic> json) =>
      _$AtelierFromJson(json);
}

/// Participant meta
///
/// Des données liées a un participant spécifique à un atelier.
@freezed
class ParticipantMeta with _$ParticipantMeta {
  factory ParticipantMeta({
    @JsonKey(name: 'atelier_id') required String atelierId,
    @JsonKey(name: 'contact_id') required String contactId,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'thematique_ids') @Default([]) List<String> thematiqueIds,
    @JsonKey(name: 'champ_libre') @Default('') String champLibre,
  }) = _ParticipantMeta;

  factory ParticipantMeta.fromJson(Map<String, dynamic> json) =>
      _$ParticipantMetaFromJson(json);
}

/// Fiche besoin
///
/// Une fiche par participant (_contact_)
@freezed
class Fiche with _$Fiche, Storable {
  const factory Fiche({
    required String id,
    @JsonKey(name: 'atelier_id') required String atelierId,
    @JsonKey(name: 'contact_id') required String contactId,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'flux_id') required String fluxId,
    @JsonKey(name: 'designation') @Default('') String designation,
    @JsonKey(name: 'commentaire') @Default('') String commentaire,
    @JsonKey(name: 'thematique_ids') @Default([]) List<String> thematiqueIds,
  }) = _Fiche;

  factory Fiche.fromJson(Map<String, dynamic> json) => _$FicheFromJson(json);
}

/// Thématique
///
/// `Nom` parmi des thématiques existantes
@freezed
class Thematique with _$Thematique, Storable {
  const factory Thematique({
    required String id,
    required String nom,
  }) = _Thematique;

  factory Thematique.fromJson(Map<String, dynamic> json) =>
      _$ThematiqueFromJson(json);
}

typedef Thematiques = UnmodifiableListView<Thematique>;

// --------------------------------------------
// Entreprises
// --------------------------------------------

/// Établissement
@freezed
class Entreprise with _$Entreprise, Storable {
  const factory Entreprise({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @Default('') String siren,
    @Default('') String denomination,
    @Default('') String commentaire,
  }) = _Entreprise;

  factory Entreprise.fromJson(Map<String, dynamic> json) =>
      _$EntrepriseFromJson(json);
}

/// Etablissement
///
/// Un établissement est typiquement une entreprise, un site de prod.
/// Un établissement peut avoir plusieurs _contacts_ associés
@freezed
class Etablissement with _$Etablissement, Storable {
  const factory Etablissement({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'entreprise_id') required String entrepriseId,
    @Default('') String siret,
    @JsonKey(name: 'adresse_ligne1') @Default('') String adresseLigne1,
    @JsonKey(name: 'adresse_ligne2') @Default('') String adresseLigne2,
    @JsonKey(name: 'code_postal') @Default('') String codePostal,
    @Default('') String ville,
    @Default('') String cedex,
  }) = _Etablissement;

  factory Etablissement.fromJson(Map<String, dynamic> json) =>
      _$EtablissementFromJson(json);
}

/// Contact
///
/// `personne x sites`
@freezed
class Contact with _$Contact, Storable {
  const factory Contact({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'personne_id') required String personneId,
    @JsonKey(name: 'etablissement_id') required String etablissementId,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

// --------------------------------------------
// Synergies
// --------------------------------------------

/// Direction d'un flux.
enum FluxDirection {
  @JsonValue('entrant')
  entrant,
  @JsonValue('sortant')
  sortant,
}

/// Nature de la fréquence du flux.
enum FluxNature {
  @JsonValue('continu')
  continu,
  @JsonValue('ponctuel')
  ponctuel,
}

/// ### Flux
/// ```
/// resource x quantité x durée x unite
/// x direction x (ponctuel + fréquence )
/// x origine (établissement) x auteurs [(animateur + co-animateur)]
/// ```
/// unite peut remplacer celle de la resource.
@freezed
class Flux with _$Flux, Storable {
  const factory Flux({
    required String id,

    // resource
    @JsonKey(name: 'resource_nom') @Default('') String resourceNom,
    @JsonKey(name: 'resource_description')
    @Default('')
    String resourceDescription,
    @JsonKey(name: 'resource_code_synapse')
    @Default('')
    String resourceCodeSynapse,

    // flux
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'contact_id') required String contactId,
    @JsonKey(name: 'atelier_id') required String atelierId,
    @JsonKey(name: 'etablissement_id') required String etablissementId,
    @Default('') String designation,
    @Default('') String commentaire,
    @Default(0) num quantite,
    @JsonKey(name: 'duree_ms') @Default(0) num dureeMs,
    @Default('') String unite,
    @Default(FluxDirection.entrant) FluxDirection direction,
    @Default(FluxNature.ponctuel) FluxNature nature,
    @JsonKey(name: 'thematique_ids') @Default([]) List<String> thematiqueIds,
    @JsonKey(name: 'animateur_ids') @Default([]) List<String> animateurIds,
    @JsonKey(name: 'co_animateur_ids') @Default([]) List<String> coAnimateurIds,
  }) = _Flux;

  factory Flux.fromJson(Map<String, dynamic> json) => _$FluxFromJson(json);
}

/// L'état de l'avancement d'une synergie.
enum SynergieStatut {
  @JsonValue('identifiee')
  identifiee,
  @JsonValue('en_cours')
  enCours,
  @JsonValue('active')
  active,
  @JsonValue('abandonnee')
  abandonnee,
}

/// L'état de l'avancement d'une synergie.
enum SynergieType {
  @JsonValue('mutualisation')
  mutualisation,
  @JsonValue('substitution')
  substitution,
  @JsonValue('nouvelle')
  nouvelle,
  @JsonValue('achat')
  achat,
  @JsonValue('cooperation')
  cooperation,
}

extension PrettyStatut on SynergieStatut {
  String get nom {
    switch (this) {
      case SynergieStatut.identifiee:
        return 'Identifiée';
      case SynergieStatut.enCours:
        return 'Etudiée';
      case SynergieStatut.active:
        return 'Active';
      case SynergieStatut.abandonnee:
        return 'Abandonnée';
    }
  }
}

extension PrettyType on SynergieType {
  String get nom {
    switch (this) {
      case SynergieType.mutualisation:
        return 'Mutualisation';
      case SynergieType.substitution:
        return 'Substitution';
      case SynergieType.nouvelle:
        return 'Nouvelle activité / Filière';
      case SynergieType.achat:
        return 'Achats et collectes mutualisés';
      case SynergieType.cooperation:
        return 'Action de coopération';
    }
  }
}

/// ### Synergie
/// `Contacts x Flux (many) x Etat`
///
/// - Etat
///   - avancement `Identifiée + En cours de développement + Active + Abandonnée`
///   - objectif `?`
@freezed
class Synergie with _$Synergie, Storable {
  factory Synergie({
    required String id,
    @JsonKey(name: 'demarche_id') required String demarcheId,
    @JsonKey(name: 'nom') @Default('') String nom,
    @JsonKey(name: 'commentaire') @Default('') String commentaire,
    @JsonKey(name: 'commentaire_date') @Default(null) String? commentaireDate,
    @Default(SynergieStatut.identifiee) SynergieStatut statut,
    @Default(SynergieType.mutualisation) SynergieType type,
    @JsonKey(name: 'flux_ids') @Default(<String>[]) List<String> fluxIds,
    @JsonKey(name: 'created_at') @Default(null) String? createdAt,
    @JsonKey(name: 'modified_at') @Default(null) String? modifiedAt,
  }) = _Synergie;

  factory Synergie.fromJson(Map<String, dynamic> json) =>
      _$SynergieFromJson(json);
}

/// class Classification(BaseModel):
///     categorie: str
///     sous_categorie: str
///     code: str
///     unite: str
///     tags: List[str]
@freezed
class ClassificationSynapse with _$ClassificationSynapse {
  factory ClassificationSynapse(
    String categorie,
    @JsonKey(name: 'sous_categorie') String sousCategorie,
    String code,
    String unite,
    List<String> tags,
  ) = _ClassificationSynapse;

  factory ClassificationSynapse.fromJson(Map<String, dynamic> json) =>
      _$ClassificationSynapseFromJson(json);
}

typedef Synapse = UnmodifiableListView<ClassificationSynapse>;

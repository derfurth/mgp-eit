import 'package:form_field_validator/form_field_validator.dart';
import 'package:mgp_client/data_widgets/editors/entreprise_editor.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/validators.dart';

import 'editable.dart';

// --------------------------------------------
// La seule donnée comprenant des DCPs
// --------------------------------------------

/// Une personne, utilisé dans un sous éditeur (contact, animateur...)
///
/// - le sous-éditeur de personne [PersonneEditor]
class EditablePersonne extends Editable<Personne> {
  EditablePersonne(super.personne);

  late final nom = Field<String?>(
    label: 'Nom',
    validator: MaxLengthValidator(
      64,
      errorText: 'le nom doit faire moins de 64 caractères.',
    ),
    get: () => value.nom,
    update: (fieldValue) => update(value.copyWith(nom: fieldValue ?? '')),
  );

  late final prenom = Field<String?>(
    label: 'Prenom',
    validator: MaxLengthValidator(
      64,
      errorText: 'le prénom doit faire moins de 64 caractères.',
    ),
    get: () => value.prenom,
    update: (fieldValue) => update(value.copyWith(prenom: fieldValue ?? '')),
  );

  late final email = Field<String?>(
    label: 'Adresse email',
    validator: EmailValidator(errorText: "l'adresse email n'est pas valide"),
    get: () => value.email,
    update: (fieldValue) => update(value.copyWith(email: fieldValue ?? '')),
  );

  late final telephone = Field<String?>(
    label: 'Téléphone',
    validator: telephoneValidator,
    get: () => value.telephone,
    update: (fieldValue) => update(value.copyWith(telephone: fieldValue ?? '')),
  );
}

// --------------------------------------------
// Animation
// --------------------------------------------

/// Une démarche, sert à rattacher des animateurs.
///
/// - éditeur de demarches
class EditableDemarche extends Editable<Demarche> {
  EditableDemarche(super.demarche);

  late final denomination = Field<String?>(
    label: 'dénomination',
    validator: MaxLengthValidator(
      128,
      errorText: 'La dénomination doit faire moins de 128 caractères.',
    ),
    get: () => value.denomination,
    update: (fieldValue) =>
        update(value.copyWith(denomination: fieldValue ?? '')),
  );

  late final champLibre = Field<String?>(
    label: 'champ libre',
    validator: MaxLengthValidator(
      356,
      errorText: 'Le champ libre doit faire moins de 356 caractères.',
    ),
    get: () => value.champLibre,
    update: (fieldValue) =>
        update(value.copyWith(champLibre: fieldValue ?? '')),
  );
}

/// Un administrateur
class EditableAdministrateur extends Editable<Administrateur> {
  EditableAdministrateur(super.administrateur);

  late final nom = Field<String?>(
    label: 'Nom',
    validator: MaxLengthValidator(
      64,
      errorText: 'le nom doit faire moins de 64 caractères.',
    ),
    get: () => value.nom,
    update: (fieldValue) => update(value.copyWith(nom: fieldValue ?? '')),
  );

  late final prenom = Field<String?>(
    label: 'Prenom',
    validator: MaxLengthValidator(
      64,
      errorText: 'le prénom doit faire moins de 64 caractères.',
    ),
    get: () => value.prenom,
    update: (fieldValue) => update(value.copyWith(prenom: fieldValue ?? '')),
  );
}

/// Un animateur
///
/// - éditeur d'animateur pour les DCPs
/// - rattaché à partir de l'éditeur de demarches pour l'admin
/// - rattaché à partir de l'éditeur d'atelier pour l'animation
class EditableAnimateur extends Editable<Animateur> {
  EditableAnimateur(super.animateur);
}

/// Un co-animateur
///
/// - éditeur de co animateur pour les DCPs
/// - rattaché à partir de l'éditeur d'atelier pour l'animation
class EditableCoAnimateur extends Editable<CoAnimateur> {
  EditableCoAnimateur(super.coAnimateur);
}

/// Un atelier
///
/// - éditeur d'atelier
class EditableAtelier extends Editable<Atelier> {
  EditableAtelier(super.atelier);

  late final lieu = Field<String?>(
    label: 'lieu',
    validator: MaxLengthValidator(
      128,
      errorText: 'Le lieu doit faire moins de 128 caractères.',
    ),
    get: () => value.lieu,
    update: (fieldValue) => update(value.copyWith(lieu: fieldValue ?? '')),
  );

  late final organisateur = Field<String?>(
    label: 'organisateur',
    validator: MaxLengthValidator(
      128,
      errorText: "L'organisateur doit faire moins de 128 caractères.",
    ),
    get: () => value.organisateur,
    update: (fieldValue) =>
        update(value.copyWith(organisateur: fieldValue ?? '')),
  );

  late final dateMs = Field<DateTime?>(
    label: 'date',
    validator: DateTimeValidator(),
    get: () => DateTime.fromMillisecondsSinceEpoch(value.dateMs.toInt()),
    update: (fieldValue) => update(value.copyWith(
        dateMs: fieldValue == null ? 0 : fieldValue.millisecondsSinceEpoch)),
  );

  void updateAnimateurIds(List<String> ids) =>
      update(value.copyWith(animateurIds: ids));

  void updateCoAnimateurIds(List<String> ids) =>
      update(value.copyWith(coAnimateurIds: ids));
}

/// Fiche besoin
///
/// - éditeur de fiche
class EditableFiche extends Editable<Fiche> {
  EditableFiche(super.fiche);

  late final designation = Field<String?>(
    label: 'designation',
    validator: MaxLengthValidator(
      128,
      errorText: 'La designation doit faire moins de 128 caractères.',
    ),
    get: () => value.designation,
    update: (fieldValue) =>
        update(value.copyWith(designation: fieldValue ?? '')),
  );

  late final commentaire = Field<String?>(
    label: 'commentaire',
    validator: MaxLengthValidator(
      256,
      errorText: 'Le commentaire doit faire moins de 256 caractères.',
    ),
    get: () => value.commentaire,
    update: (fieldValue) =>
        update(value.copyWith(commentaire: fieldValue ?? '')),
  );

  void updateThematiqueIds(List<String> ids) =>
      update(value.copyWith(thematiqueIds: ids));

  late final thematiques = MultipleChoiceField(
    label: 'thematiques',
    get: () => value.thematiqueIds,
    update: (fieldValue) => update(value.copyWith(thematiqueIds: fieldValue)),
  );

  void updateFluxId(String id) => update(value.copyWith(fluxId: id));
}

/// Participant meta
///
/// Editeur d'atelier.
class EditableParticipantMeta extends Editable<ParticipantMeta> {
  EditableParticipantMeta(super.meta);

  late final champLibre = Field<String?>(
    label: 'Champ libre',
    validator: MaxLengthValidator(
      256,
      errorText: 'Le commentaire doit faire moins de 256 caractères.',
    ),
    get: () => value.champLibre,
    update: (fieldValue) =>
        update(value.copyWith(champLibre: fieldValue ?? '')),
  );

  void updateThematiqueIds(List<String> ids) =>
      update(value.copyWith(thematiqueIds: ids));

  late final thematiques = MultipleChoiceField(
    label: 'thematiques',
    get: () => value.thematiqueIds,
    update: (fieldValue) => update(value.copyWith(thematiqueIds: fieldValue)),
  );
}

// --------------------------------------------
// Entreprises
// --------------------------------------------

/// Un entreprise
///
/// - éditeur d'entreprise [EntrepriseEditor]
class EditableEntreprise extends Editable<Entreprise> {
  EditableEntreprise(super.entreprise);

  late final siren = Field<String?>(
    label: 'siren',
    validator: sirenValidator,
    get: () => value.siren,
    update: (fieldValue) => update(value.copyWith(siren: fieldValue ?? '')),
  );

  late final denomination = Field<String?>(
    label: 'dénomination',
    validator: MaxLengthValidator(
      128,
      errorText: 'La dénomination doit faire moins de 128 caractères.',
    ),
    get: () => value.denomination,
    update: (fieldValue) =>
        update(value.copyWith(denomination: fieldValue ?? '')),
  );

  late final commentaire = Field<String?>(
    label: 'Activité et commentaires',
    validator: MaxLengthValidator(
      2048,
      errorText: 'Le commentaire doit faire moins de 2048 caractères.',
    ),
    get: () => value.commentaire,
    update: (fieldValue) =>
        update(value.copyWith(commentaire: fieldValue ?? '')),
  );

  final List<EditableEtablissement> _etablissements = <EditableEtablissement>[];

  List<EditableEtablissement> get etablissements =>
      _etablissements.toList(growable: false);

  void attachEtablissements(Iterable<EditableEtablissement> etablissements) {
    _etablissements.addAll(etablissements);
    for (var etablissement in _etablissements) {
      etablissement.addListener(notifyListeners);
    }
    notifyListeners();
  }
}

/// Un établissement, rattaché et édité en ligne avec l'entreprise.
///
/// - éditeur d'entreprise [EntrepriseEditor]
class EditableEtablissement extends Editable<Etablissement> {
  EditableEtablissement(super.etablissement);

  late final siret = Field<String?>(
    label: 'Siret',
    validator: PatternValidator(
      r'^$|^\d{14}$',
      errorText: "le code Siret n'est pas valide",
    ),
    get: () => value.siret,
    update: (fieldValue) => update(value.copyWith(siret: fieldValue ?? '')),
  );

  late final adresseLigne1 = Field<String?>(
    label: 'Adresse ligne 1',
    validator: MaxLengthValidator(
      128,
      errorText: 'cette ligne doit faire moins de 128 caractères.',
    ),
    get: () => value.adresseLigne1,
    update: (fieldValue) =>
        update(value.copyWith(adresseLigne1: fieldValue ?? '')),
  );

  late final adresseLigne2 = Field<String?>(
    label: 'Adresse ligne 2',
    validator: MaxLengthValidator(
      128,
      errorText: 'cette ligne doit faire moins de 128 caractères.',
    ),
    get: () => value.adresseLigne2,
    update: (fieldValue) =>
        update(value.copyWith(adresseLigne2: fieldValue ?? '')),
  );

  late final codePostal = Field<String?>(
    label: 'Code postal',
    validator: PatternValidator(
      r'^(?:[0-8]\d|9[0-8])\d{3}$',
      errorText: "le code postal n'est pas valide",
    ),
    get: () => value.codePostal,
    update: (fieldValue) =>
        update(value.copyWith(codePostal: fieldValue ?? '')),
  );

  late final ville = Field<String?>(
    label: 'Ville',
    validator: MaxLengthValidator(
      128,
      errorText: 'le nom de la ville doit faire moins de 128 caractères.',
    ),
    get: () => value.ville,
    update: (fieldValue) => update(value.copyWith(ville: fieldValue ?? '')),
  );

  late final cedex = Field<String?>(
    label: 'Cedex',
    validator: MaxLengthValidator(
      32,
      errorText: 'le cedex doit faire moins de 32 caractères.',
    ),
    get: () => value.cedex,
    update: (fieldValue) => update(value.copyWith(cedex: fieldValue ?? '')),
  );

  String get adressePostale =>
      '${value.adresseLigne1} ${value.adresseLigne2}, ${value.codePostal} ${value.ville}';
}

/// Un Contact
///
/// - éditeur de contact [ContactEditor]
/// - rattaché à l'entreprise partir de l'éditeur d'entreprise [EntrepriseEditor]
class EditableContact extends Editable<Contact> {
  EditableContact(super.contact);
}

// --------------------------------------------
// Synergies
// --------------------------------------------

/// Un Flux
///
/// - éditeur de flux
/// - éditeur de besoin
class EditableFlux extends Editable<Flux> {
  EditableFlux(super.flux, {EditableFiche? fiche}) {
    if (fiche != null) {
      fiche.addListener(() => syncWithFiche(fiche.value));
    }
  }

  // Keep flux in sync with fiche.
  void syncWithFiche(Fiche fiche) {
    if (value.resourceNom.isEmpty ||
        fiche.designation.startsWith(value.resourceNom) ||
        value.resourceNom.startsWith(fiche.designation)) {
      update(value.copyWith(resourceNom: fiche.designation));
    }
  }

  // Resource
  // --------

  late final resourceNom = Field<String?>(
    label: 'Nom de la resource',
    validator: MaxLengthValidator(
      128,
      errorText: 'le nom de la resource doit faire moins de 128 caractères.',
    ),
    get: () => value.resourceNom,
    update: (fieldValue) =>
        update(value.copyWith(resourceNom: fieldValue ?? '')),
  );

  late final resourceDescription = Field<String?>(
    label: 'Description de la resource',
    validator: MaxLengthValidator(
      256,
      errorText:
          'la description de la resource doit faire moins de 256 caractères.',
    ),
    get: () => value.resourceDescription,
    update: (fieldValue) =>
        update(value.copyWith(resourceDescription: fieldValue ?? '')),
  );

  void updateResourceCodeSynapse(String codeSynapse) =>
      update(value.copyWith(resourceCodeSynapse: codeSynapse));

  // Flux
  // ----

  late final designation = Field<String?>(
    label: 'désignation',
    validator: MaxLengthValidator(
      128,
      errorText: 'la désignation doit faire moins de 128 caractères.',
    ),
    get: () => value.designation,
    update: (fieldValue) =>
        update(value.copyWith(designation: fieldValue ?? '')),
  );

  late final commentaire = Field<String?>(
    label: 'commentaire',
    validator: MaxLengthValidator(
      256,
      errorText: 'la commentaire doit faire moins de 256 caractères.',
    ),
    get: () => value.commentaire,
    update: (fieldValue) =>
        update(value.copyWith(commentaire: fieldValue ?? '')),
  );

  late final quantite = Field<String?>(
    label: 'quantité',
    validator: NumericValidator(
      errorText: 'la quantité doit être un nombre.',
    ),
    get: () => value.quantite.toString(),
    update: (fieldValue) => update(value.copyWith(
        quantite: fieldValue == null ? 0 : num.parse(fieldValue))),
  );

  late final dureeMs = Field<Duration?>(
    label: 'durée',
    validator: DurationValidator(),
    get: () => Duration(milliseconds: value.dureeMs.toInt()),
    update: (fieldValue) => update(value.copyWith(
        quantite: fieldValue == null ? 0 : fieldValue.inMilliseconds)),
  );

  late final unite = Field<String?>(
    label: 'unité',
    validator: MaxLengthValidator(
      16,
      errorText: "l'unité doit faire moins de 16 caractères.",
    ),
    get: () => value.unite,
    update: (fieldValue) => update(value.copyWith(unite: fieldValue ?? '')),
  );

  void updateDirection(FluxDirection direction) =>
      update(value.copyWith(direction: direction));

  void updateNature(FluxNature nature) =>
      update(value.copyWith(nature: nature));

  void updateThematiqueIds(List<String> ids) =>
      update(value.copyWith(thematiqueIds: ids));

  void updateAnimateurIds(List<String> ids) =>
      update(value.copyWith(animateurIds: ids));

  void updateCoAnimateurIds(List<String> ids) =>
      update(value.copyWith(coAnimateurIds: ids));

  late final thematiques = MultipleChoiceField(
    label: 'thematiques',
    get: () => value.thematiqueIds,
    update: (fieldValue) => update(value.copyWith(thematiqueIds: fieldValue)),
  );
}

/// Une Synergie
///
/// - éditeur de synergie
class EditableSynergie extends Editable<Synergie> {
  EditableSynergie(super.synergie);

  @override
  update(Synergie value, {notify = true}) {
    value = value.copyWith(modifiedAt: DateTime.now().toString());
    super.update(value, notify: notify);
  }

  late final nom = Field<String?>(
    label: 'désignation',
    validator: MaxLengthValidator(
      128,
      errorText: 'le nom doit faire moins de 128 caractères.',
    ),
    get: () => value.nom,
    update: (fieldValue) => update(value.copyWith(nom: fieldValue ?? '')),
  );

  late final commentaire = Field<String?>(
    label: 'commentaire',
    validator: MaxLengthValidator(
      5120,
      errorText: 'Le commentaire doit faire moins de 5120 caractères.',
    ),
    get: () => value.commentaire,
    update: (fieldValue) =>
        update(value.copyWith(commentaire: fieldValue ?? '')),
  );

  void updateStatut(SynergieStatut statut) =>
      update(value.copyWith(statut: statut));

  void updateType(SynergieType type) => update(value.copyWith(type: type));

  void updateFluxIds(List<String> ids) => update(value.copyWith(fluxIds: ids));

  late final dateCommentaire = Field<DateTime?>(
    label: 'date commentaire',
    validator: DateTimeValidator(),
    get: () => value.commentaireDate == null
        ? null
        : DateTime.parse(value.commentaireDate!),
    update: (fieldValue) =>
        update(value.copyWith(commentaireDate: fieldValue?.toString())),
  );
}

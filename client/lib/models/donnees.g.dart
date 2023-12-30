// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donnees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonneImpl _$$PersonneImplFromJson(Map<String, dynamic> json) =>
    _$PersonneImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      nom: json['nom'] as String? ?? '',
      prenom: json['prenom'] as String? ?? '',
      email: json['email'] as String? ?? '',
      telephone: json['telephone'] as String? ?? '',
      limited: json['limited'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$PersonneImplToJson(_$PersonneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'email': instance.email,
      'telephone': instance.telephone,
      'limited': instance.limited,
      'deleted': instance.deleted,
    };

_$AdministrateurImpl _$$AdministrateurImplFromJson(Map<String, dynamic> json) =>
    _$AdministrateurImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      personneId: json['personne_id'] as String? ?? '',
    );

Map<String, dynamic> _$$AdministrateurImplToJson(
        _$AdministrateurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'personne_id': instance.personneId,
    };

_$AnimateurImpl _$$AnimateurImplFromJson(Map<String, dynamic> json) =>
    _$AnimateurImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      demarcheId: json['demarche_id'] as String,
      personneId: json['personne_id'] as String? ?? '',
    );

Map<String, dynamic> _$$AnimateurImplToJson(_$AnimateurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'demarche_id': instance.demarcheId,
      'personne_id': instance.personneId,
    };

_$CoAnimateurImpl _$$CoAnimateurImplFromJson(Map<String, dynamic> json) =>
    _$CoAnimateurImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      demarcheId: json['demarche_id'] as String,
      personneId: json['personne_id'] as String? ?? '',
    );

Map<String, dynamic> _$$CoAnimateurImplToJson(_$CoAnimateurImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'demarche_id': instance.demarcheId,
      'personne_id': instance.personneId,
    };

_$DemarcheImpl _$$DemarcheImplFromJson(Map<String, dynamic> json) =>
    _$DemarcheImpl(
      id: json['id'] as String,
      denomination: json['denomination'] as String? ?? '',
      champLibre: json['champ_libre'] as String? ?? '',
    );

Map<String, dynamic> _$$DemarcheImplToJson(_$DemarcheImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'denomination': instance.denomination,
      'champ_libre': instance.champLibre,
    };

_$AtelierImpl _$$AtelierImplFromJson(Map<String, dynamic> json) =>
    _$AtelierImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      animateurIds: (json['animateur_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coAnimateurIds: (json['co_animateur_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lieu: json['lieu'] as String? ?? '',
      organisateur: json['organisateur'] as String? ?? '',
      dateMs: json['date_ms'] as num? ?? 0,
    );

Map<String, dynamic> _$$AtelierImplToJson(_$AtelierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'animateur_ids': instance.animateurIds,
      'co_animateur_ids': instance.coAnimateurIds,
      'lieu': instance.lieu,
      'organisateur': instance.organisateur,
      'date_ms': instance.dateMs,
    };

_$ParticipantMetaImpl _$$ParticipantMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantMetaImpl(
      atelierId: json['atelier_id'] as String,
      contactId: json['contact_id'] as String,
      demarcheId: json['demarche_id'] as String,
      thematiqueIds: (json['thematique_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      champLibre: json['champ_libre'] as String? ?? '',
    );

Map<String, dynamic> _$$ParticipantMetaImplToJson(
        _$ParticipantMetaImpl instance) =>
    <String, dynamic>{
      'atelier_id': instance.atelierId,
      'contact_id': instance.contactId,
      'demarche_id': instance.demarcheId,
      'thematique_ids': instance.thematiqueIds,
      'champ_libre': instance.champLibre,
    };

_$FicheImpl _$$FicheImplFromJson(Map<String, dynamic> json) => _$FicheImpl(
      id: json['id'] as String,
      atelierId: json['atelier_id'] as String,
      contactId: json['contact_id'] as String,
      demarcheId: json['demarche_id'] as String,
      fluxId: json['flux_id'] as String,
      designation: json['designation'] as String? ?? '',
      commentaire: json['commentaire'] as String? ?? '',
      thematiqueIds: (json['thematique_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FicheImplToJson(_$FicheImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'atelier_id': instance.atelierId,
      'contact_id': instance.contactId,
      'demarche_id': instance.demarcheId,
      'flux_id': instance.fluxId,
      'designation': instance.designation,
      'commentaire': instance.commentaire,
      'thematique_ids': instance.thematiqueIds,
    };

_$ThematiqueImpl _$$ThematiqueImplFromJson(Map<String, dynamic> json) =>
    _$ThematiqueImpl(
      id: json['id'] as String,
      nom: json['nom'] as String,
    );

Map<String, dynamic> _$$ThematiqueImplToJson(_$ThematiqueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
    };

_$EntrepriseImpl _$$EntrepriseImplFromJson(Map<String, dynamic> json) =>
    _$EntrepriseImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      siren: json['siren'] as String? ?? '',
      denomination: json['denomination'] as String? ?? '',
      commentaire: json['commentaire'] as String? ?? '',
    );

Map<String, dynamic> _$$EntrepriseImplToJson(_$EntrepriseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'siren': instance.siren,
      'denomination': instance.denomination,
      'commentaire': instance.commentaire,
    };

_$EtablissementImpl _$$EtablissementImplFromJson(Map<String, dynamic> json) =>
    _$EtablissementImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      entrepriseId: json['entreprise_id'] as String,
      siret: json['siret'] as String? ?? '',
      adresseLigne1: json['adresse_ligne1'] as String? ?? '',
      adresseLigne2: json['adresse_ligne2'] as String? ?? '',
      codePostal: json['code_postal'] as String? ?? '',
      ville: json['ville'] as String? ?? '',
      cedex: json['cedex'] as String? ?? '',
    );

Map<String, dynamic> _$$EtablissementImplToJson(_$EtablissementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'entreprise_id': instance.entrepriseId,
      'siret': instance.siret,
      'adresse_ligne1': instance.adresseLigne1,
      'adresse_ligne2': instance.adresseLigne2,
      'code_postal': instance.codePostal,
      'ville': instance.ville,
      'cedex': instance.cedex,
    };

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      personneId: json['personne_id'] as String,
      etablissementId: json['etablissement_id'] as String,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'personne_id': instance.personneId,
      'etablissement_id': instance.etablissementId,
    };

_$FluxImpl _$$FluxImplFromJson(Map<String, dynamic> json) => _$FluxImpl(
      id: json['id'] as String,
      resourceNom: json['resource_nom'] as String? ?? '',
      resourceDescription: json['resource_description'] as String? ?? '',
      resourceCodeSynapse: json['resource_code_synapse'] as String? ?? '',
      demarcheId: json['demarche_id'] as String,
      contactId: json['contact_id'] as String,
      atelierId: json['atelier_id'] as String,
      etablissementId: json['etablissement_id'] as String,
      designation: json['designation'] as String? ?? '',
      commentaire: json['commentaire'] as String? ?? '',
      quantite: json['quantite'] as num? ?? 0,
      dureeMs: json['duree_ms'] as num? ?? 0,
      unite: json['unite'] as String? ?? '',
      direction:
          $enumDecodeNullable(_$FluxDirectionEnumMap, json['direction']) ??
              FluxDirection.entrant,
      nature: $enumDecodeNullable(_$FluxNatureEnumMap, json['nature']) ??
          FluxNature.ponctuel,
      thematiqueIds: (json['thematique_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      animateurIds: (json['animateur_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coAnimateurIds: (json['co_animateur_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FluxImplToJson(_$FluxImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resource_nom': instance.resourceNom,
      'resource_description': instance.resourceDescription,
      'resource_code_synapse': instance.resourceCodeSynapse,
      'demarche_id': instance.demarcheId,
      'contact_id': instance.contactId,
      'atelier_id': instance.atelierId,
      'etablissement_id': instance.etablissementId,
      'designation': instance.designation,
      'commentaire': instance.commentaire,
      'quantite': instance.quantite,
      'duree_ms': instance.dureeMs,
      'unite': instance.unite,
      'direction': _$FluxDirectionEnumMap[instance.direction]!,
      'nature': _$FluxNatureEnumMap[instance.nature]!,
      'thematique_ids': instance.thematiqueIds,
      'animateur_ids': instance.animateurIds,
      'co_animateur_ids': instance.coAnimateurIds,
    };

const _$FluxDirectionEnumMap = {
  FluxDirection.entrant: 'entrant',
  FluxDirection.sortant: 'sortant',
};

const _$FluxNatureEnumMap = {
  FluxNature.continu: 'continu',
  FluxNature.ponctuel: 'ponctuel',
};

_$SynergieImpl _$$SynergieImplFromJson(Map<String, dynamic> json) =>
    _$SynergieImpl(
      id: json['id'] as String,
      demarcheId: json['demarche_id'] as String,
      nom: json['nom'] as String? ?? '',
      commentaire: json['commentaire'] as String? ?? '',
      commentaireDate: json['commentaire_date'] as String? ?? null,
      statut: $enumDecodeNullable(_$SynergieStatutEnumMap, json['statut']) ??
          SynergieStatut.identifiee,
      type: $enumDecodeNullable(_$SynergieTypeEnumMap, json['type']) ??
          SynergieType.mutualisation,
      fluxIds: (json['flux_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: json['created_at'] as String? ?? null,
      modifiedAt: json['modified_at'] as String? ?? null,
    );

Map<String, dynamic> _$$SynergieImplToJson(_$SynergieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'demarche_id': instance.demarcheId,
      'nom': instance.nom,
      'commentaire': instance.commentaire,
      'commentaire_date': instance.commentaireDate,
      'statut': _$SynergieStatutEnumMap[instance.statut]!,
      'type': _$SynergieTypeEnumMap[instance.type]!,
      'flux_ids': instance.fluxIds,
      'created_at': instance.createdAt,
      'modified_at': instance.modifiedAt,
    };

const _$SynergieStatutEnumMap = {
  SynergieStatut.identifiee: 'identifiee',
  SynergieStatut.enCours: 'en_cours',
  SynergieStatut.active: 'active',
  SynergieStatut.abandonnee: 'abandonnee',
};

const _$SynergieTypeEnumMap = {
  SynergieType.mutualisation: 'mutualisation',
  SynergieType.substitution: 'substitution',
  SynergieType.nouvelle: 'nouvelle',
  SynergieType.achat: 'achat',
  SynergieType.cooperation: 'cooperation',
};

_$ClassificationSynapseImpl _$$ClassificationSynapseImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassificationSynapseImpl(
      json['categorie'] as String,
      json['sous_categorie'] as String,
      json['code'] as String,
      json['unite'] as String,
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ClassificationSynapseImplToJson(
        _$ClassificationSynapseImpl instance) =>
    <String, dynamic>{
      'categorie': instance.categorie,
      'sous_categorie': instance.sousCategorie,
      'code': instance.code,
      'unite': instance.unite,
      'tags': instance.tags,
    };

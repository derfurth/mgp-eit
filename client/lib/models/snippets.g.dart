// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntrepriseSnippetImpl _$$EntrepriseSnippetImplFromJson(
        Map<String, dynamic> json) =>
    _$EntrepriseSnippetImpl(
      entreprise:
          Entreprise.fromJson(json['entreprise'] as Map<String, dynamic>),
      etablissements: (json['etablissements'] as List<dynamic>)
          .map((e) => Etablissement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EntrepriseSnippetImplToJson(
        _$EntrepriseSnippetImpl instance) =>
    <String, dynamic>{
      'entreprise': instance.entreprise,
      'etablissements': instance.etablissements,
    };

_$ContactSnippetImpl _$$ContactSnippetImplFromJson(Map<String, dynamic> json) =>
    _$ContactSnippetImpl(
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      personne: Personne.fromJson(json['personne'] as Map<String, dynamic>),
      entreprise: EntrepriseSnippet.fromJson(
          json['entreprise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContactSnippetImplToJson(
        _$ContactSnippetImpl instance) =>
    <String, dynamic>{
      'contact': instance.contact,
      'personne': instance.personne,
      'entreprise': instance.entreprise,
    };

_$AnimateurSnippetImpl _$$AnimateurSnippetImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimateurSnippetImpl(
      animateur: Animateur.fromJson(json['animateur'] as Map<String, dynamic>),
      personne: Personne.fromJson(json['personne'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnimateurSnippetImplToJson(
        _$AnimateurSnippetImpl instance) =>
    <String, dynamic>{
      'animateur': instance.animateur,
      'personne': instance.personne,
    };

_$CoAnimateurSnippetImpl _$$CoAnimateurSnippetImplFromJson(
        Map<String, dynamic> json) =>
    _$CoAnimateurSnippetImpl(
      coAnimateur:
          CoAnimateur.fromJson(json['co_animateur'] as Map<String, dynamic>),
      personne: Personne.fromJson(json['personne'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoAnimateurSnippetImplToJson(
        _$CoAnimateurSnippetImpl instance) =>
    <String, dynamic>{
      'co_animateur': instance.coAnimateur,
      'personne': instance.personne,
    };

_$AtelierSnippetImpl _$$AtelierSnippetImplFromJson(Map<String, dynamic> json) =>
    _$AtelierSnippetImpl(
      atelier: Atelier.fromJson(json['atelier'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ContactSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
      animateurs: (json['animateurs'] as List<dynamic>)
          .map((e) => AnimateurSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
      coAnimateurs: (json['co_animateurs'] as List<dynamic>)
          .map((e) => CoAnimateurSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AtelierSnippetImplToJson(
        _$AtelierSnippetImpl instance) =>
    <String, dynamic>{
      'atelier': instance.atelier,
      'participants': instance.participants,
      'animateurs': instance.animateurs,
      'co_animateurs': instance.coAnimateurs,
    };

_$FicheSnippetImpl _$$FicheSnippetImplFromJson(Map<String, dynamic> json) =>
    _$FicheSnippetImpl(
      fiche: Fiche.fromJson(json['fiche'] as Map<String, dynamic>),
      contact: ContactSnippet.fromJson(json['contact'] as Map<String, dynamic>),
      flux: Flux.fromJson(json['flux'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FicheSnippetImplToJson(_$FicheSnippetImpl instance) =>
    <String, dynamic>{
      'fiche': instance.fiche,
      'contact': instance.contact,
      'flux': instance.flux,
    };

_$FluxSnippetImpl _$$FluxSnippetImplFromJson(Map<String, dynamic> json) =>
    _$FluxSnippetImpl(
      flux: Flux.fromJson(json['flux'] as Map<String, dynamic>),
      contact: ContactSnippet.fromJson(json['contact'] as Map<String, dynamic>),
      animateurs: (json['animateurs'] as List<dynamic>)
          .map((e) => AnimateurSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
      coAnimateurs: (json['co_animateurs'] as List<dynamic>)
          .map((e) => CoAnimateurSnippet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FluxSnippetImplToJson(_$FluxSnippetImpl instance) =>
    <String, dynamic>{
      'flux': instance.flux,
      'contact': instance.contact,
      'animateurs': instance.animateurs,
      'co_animateurs': instance.coAnimateurs,
    };

_$SynergieSnippetImpl _$$SynergieSnippetImplFromJson(
        Map<String, dynamic> json) =>
    _$SynergieSnippetImpl(
      synergie: Synergie.fromJson(json['synergie'] as Map<String, dynamic>),
      flux: (json['flux'] as List<dynamic>)
          .map((e) => Flux.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SynergieSnippetImplToJson(
        _$SynergieSnippetImpl instance) =>
    <String, dynamic>{
      'synergie': instance.synergie,
      'flux': instance.flux,
    };

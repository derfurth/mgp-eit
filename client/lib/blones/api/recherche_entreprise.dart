import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mgp_client/models/donnees.dart';

import '../collection/collection_blone.dart';

class RechercheEntrepriseApi {
  Future<Iterable<MatchingEntreprise>> search(
    String query, {
    String? departement,
  }) async {
    final uri = Uri(
        scheme: 'https',
        host: 'recherche-entreprises.api.gouv.fr',
        path: 'search',
        queryParameters: {
          'page': 1.toString(),
          'per_page': 10.toString(),
          'q': query.trim(),
          if (departement != null && departement.isNotEmpty) 'departement': departement
        });
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final result = RechercheEntreprisesResult.fromJson(jsonResponse);
      return result.entreprises;
    } else {
      throw Exception(response.body);
    }
  }
}

extension RechercheEntreprise on Entreprise {
  static Entreprise newFromApiResult({
    required String demarcheId,
    required MatchingEntreprise entreprise,
  }) {
    return Entreprise(
      id: SupabaseCollection.uuid.v4(),
      demarcheId: demarcheId,
      siren: entreprise.siren,
      denomination: entreprise.nom,
      commentaire: '',
    );
  }
}

extension RechercheEtablissement on Etablissement {
  static Etablissement newFromApiResult({
    required Entreprise entreprise,
    required MatchingEtablissement etablissement,
  }) {
    return Etablissement(
      id: SupabaseCollection.uuid.v4(),
      demarcheId: entreprise.demarcheId,
      entrepriseId: entreprise.id,
      siret: etablissement.siret,
      adresseLigne1: etablissement.adresse,
      codePostal: etablissement.codePostal,
      ville: etablissement.commune,
    );
  }
}

class RechercheEntreprisesResult {
  late final int totalResults;
  late final int page;
  late final int perPage;
  late final int totalPages;
  late final List<MatchingEntreprise> entreprises;

  RechercheEntreprisesResult.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    page = json['page'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    entreprises = <MatchingEntreprise>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        entreprises.add(MatchingEntreprise.fromJson(v));
      });
    }
  }
}

class MatchingEntreprise {
  late final String siren;
  late final String nom;
  late final List<MatchingEtablissement> etablissements;

  MatchingEntreprise.fromJson(Map<String, dynamic> json) {
    siren = json['siren'];
    nom = json['nom_raison_sociale'] ?? json['nom_complet'];
    etablissements = <MatchingEtablissement>[];
    if (json['matching_etablissements'] != null) {
      json['matching_etablissements'].forEach((v) {
        etablissements.add(MatchingEtablissement.fromJson(v));
      });
    }
  }
}

class MatchingEtablissement {
  late final String siret;
  late final String adresse;
  late final String codePostal;
  late final String commune;
  late final bool estSiege;

  MatchingEtablissement.fromJson(Map<String, dynamic> json) {
    siret = json['siret'];
    codePostal = json['code_postal'];
    commune = json['libelle_commune'];
    estSiege = json['est_siege'] == true;
    adresse = (json['adresse'] as String)
        .replaceAll(codePostal, '')
        .replaceAll(commune, '')
        .replaceAll('  ', ' ')
        .trim();
  }
}

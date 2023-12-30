import 'package:flutter/foundation.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

// --------------------------------------------
// Entreprises
// --------------------------------------------

/// Entreprise. Un entreprise est composée d'établissements.
class EntrepriseCollectionBlone extends SupabaseCollection<Entreprise>
    with ChildBlone<AppBlone>, ChangeNotifier {
  Entreprise create({required String demarcheId}) => Entreprise(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
      );

  @override
  final String tableName = 'entreprise';

  @override
  Entreprise elementFromJson(JsonMap json) => Entreprise.fromJson(json);

  @override
  JsonMap elementToJson(Entreprise value) => value.toJson();

  Future<EntrepriseSnippet> getSnippet({required String entrepriseId}) async {
    final data = await client.rpc('entreprise_snippet', params: {
      'entreprise_id': entrepriseId,
    });
    return EntrepriseSnippet.fromJson(data);
  }

  Future<Entreprise> getByEtablissementId(String etablissementId) async {
    final etablissement = await parent.etablissements.getById(etablissementId);
    return getById(etablissement.entrepriseId);
  }

  Future<Iterable<EntrepriseSnippet>> getSnippets({
    required String demarcheId,
  }) async {
    final data = await client.rpc(
      'entreprise_snippets',
      params: {'demarche_id': demarcheId},
    ).select();

    return data.map((e) => EntrepriseSnippet.fromJson(e));
  }

  Future<Iterable<EntrepriseSnippet>> search({
    required String demarcheId,
    required String needle,
  }) async {
    final entreprises = await getSnippets(demarcheId: demarcheId);
    needle = needle.trim().toLowerCase();

    if (needle.isEmpty) return entreprises;

    return entreprises.where((entreprise) =>
        entreprise.entreprise.denomination.toLowerCase().contains(needle));
  }
}

/// Établissement. Un établissement appartient à une entreprise.
class EtablissementCollectionBlone extends SupabaseCollection<Etablissement>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'etablissement';

  @override
  Etablissement elementFromJson(JsonMap json) => Etablissement.fromJson(json);

  @override
  JsonMap elementToJson(Etablissement value) => value.toJson();

  Etablissement create({
    required String demarcheId,
    required String entrepriseId,
  }) =>
      Etablissement(
        id: SupabaseCollection.uuid.v4(),
        entrepriseId: entrepriseId,
        demarcheId: demarcheId,
      );

  Future<Iterable<Etablissement>> getOrCreateByEntrepriseId({
    required String demarcheId,
    required String entrepriseId,
  }) async {
    final data =
        await fromTable.select().eq('entreprise_id', entrepriseId).select();

    if (data.isEmpty) {
      final etablissement = create(
        demarcheId: demarcheId,
        entrepriseId: entrepriseId,
      );
      return [etablissement];
    }

    final etablissements = data.map((e) => elementFromJson(e));
    return etablissements;
  }
}

class ContactCollectionBlone extends SupabaseCollection<Contact>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'contact';

  @override
  Contact elementFromJson(JsonMap json) => Contact.fromJson(json);

  @override
  JsonMap elementToJson(Contact value) => value.toJson();

  Contact create({
    required String personneId,
    required demarcheId,
    required etablissementId,
  }) =>
      Contact(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
        personneId: personneId,
        etablissementId: etablissementId,
      );

  Future<Iterable<ContactSnippet>> getSnippets({
    required demarcheId,
  }) async {
    final data = await client.rpc('contact_snippets', params: {
      'demarche_id': demarcheId,
    }).select();

    return data.map((e) => ContactSnippet.fromJson(e));
  }

  Future<Iterable<ContactSnippet>> getSnippetsForEtablissement({
    required etablissementId,
  }) async {
    final data = await client.rpc('etablissement_contact_snippets', params: {
      'etablissement_id': etablissementId,
    }).select();

    return data.map((e) => ContactSnippet.fromJson(e));
  }

  /// Returns a list of snippets matching [needle]
  Future<Iterable<ContactSnippet>> search({
    required demarcheId,
    required String needle,
  }) async {
    final snippets = await getSnippets(demarcheId: demarcheId);
    needle = needle.trim().toLowerCase();

    if (needle.isEmpty) return snippets;

    return snippets.where((snippet) =>
        snippet.personne.displayName.toLowerCase().contains(needle) ||
        snippet.entreprise.entreprise.denomination
            .toLowerCase()
            .contains(needle));
  }

  Future<ContactSnippet> getSnippet({
    required String contactId,
  }) async {
    final data = await client.rpc('contact_snippet', params: {
      'contact_id': contactId,
    }).single();
    return ContactSnippet.fromJson(data);
  }

  Future<ContactSnippet> createSnippet({
    required String demarcheId,
    required String etablissementId,
  }) async {
    final personne = parent.personnes.create(
      demarcheId: demarcheId,
    );

    final contact = create(
      personneId: personne.id,
      demarcheId: demarcheId,
      etablissementId: etablissementId,
    );

    final entreprise =
        await parent.entreprises.getByEtablissementId(etablissementId);

    final entrepriseSnippet =
        await parent.entreprises.getSnippet(entrepriseId: entreprise.id);

    return ContactSnippet(
        contact: contact, personne: personne, entreprise: entrepriseSnippet);
  }
}

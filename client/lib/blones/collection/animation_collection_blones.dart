import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

import '../../models/donnees.dart';
import '../../models/snippets.dart';
import '../app_blone.dart';
import '../blone.dart';
import 'collection_blone.dart';

// --------------------------------------------
// Animation
// --------------------------------------------

/// Animateurs
class AnimateurCollectionBlone extends SupabaseCollection<Animateur>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'animateur';

  @override
  Animateur elementFromJson(JsonMap json) => Animateur.fromJson(json);

  @override
  JsonMap elementToJson(Animateur value) => value.toJson();

  Animateur create({
    required String demarcheId,
  }) =>
      Animateur(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
      );

  Future<AnimateurSnippet> getSnippet(String id) async {
    final animateur = await getById(id);
    return AnimateurSnippet(
      animateur: animateur,
      personne: await parent.personnes.getById(animateur.personneId),
    );
  }

  Future<Iterable<AnimateurSnippet>> search({
    required String demarcheId,
    String needle = '',
  }) async {
    final animateurs = await getSnippets(demarcheId: demarcheId);
    if (needle.isEmpty) return animateurs;
    return animateurs.where((a) => a.personne.displayName.contains(needle));
  }

  Future<Iterable<AnimateurSnippet>> getSnippets({
    required String demarcheId,
  }) async {
    final data = await client.rpc('animateur_snippets', params: {
      'demarche_id': demarcheId,
    }).select();
    return data.map((e) => AnimateurSnippet.fromJson(e));
  }

  Future<bool> claim({required String animateurId}) async {
    try {
      await client.rpc('claim_animateur', params: {
        'animateur_id': animateurId,
      });
    } on PostgrestException catch (_) {
      return false;
    }

    return true;
  }
}

/// Co Animateurs
class CoAnimateurCollectionBlone extends SupabaseCollection<CoAnimateur>
    with ChildBlone<AppBlone>, ChangeNotifier {
  @override
  final String tableName = 'co_animateur';

  @override
  CoAnimateur elementFromJson(JsonMap json) => CoAnimateur.fromJson(json);

  @override
  JsonMap elementToJson(CoAnimateur value) => value.toJson();

  CoAnimateur create({
    required String demarcheId,
  }) =>
      CoAnimateur(
        id: SupabaseCollection.uuid.v4(),
        demarcheId: demarcheId,
      );

  Future<CoAnimateurSnippet> getSnippet(String id) async {
    final coAnimateur = await getById(id);
    return CoAnimateurSnippet(
      coAnimateur: coAnimateur,
      personne: await parent.personnes.getById(coAnimateur.personneId),
    );
  }

  Future<Iterable<CoAnimateurSnippet>> search({
    required String demarcheId,
    String needle = '',
  }) async {
    final coAnimateurs = await getSnippets(demarcheId: demarcheId);
    if (needle.isEmpty) return coAnimateurs;
    return coAnimateurs.where((a) => a.personne.displayName.contains(needle));
  }

  Future<Iterable<CoAnimateurSnippet>> getSnippets({
    required String demarcheId,
  }) async {
    final data = await client.rpc('co_animateur_snippets', params: {
      'demarche_id': demarcheId,
    }).select();
    return data.map((e) => CoAnimateurSnippet.fromJson(e));
  }

  Future<bool> claim({required String coAnimateurId}) async {
    try {
      await client.rpc('claim_co_animateur', params: {
        'co_animateur_id': coAnimateurId,
      });
    } on PostgrestException catch (_) {
      return false;
    }
    return true;
  }
}

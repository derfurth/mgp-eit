import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase/supabase.dart';

import '../models/ui_message.dart';
import 'auth_blone.dart';
import 'blone.dart';
import 'collection/animation_collection_blones.dart';
import 'collection/atelier_collection_blones.dart';
import 'collection/demarche_collection_blone.dart';
import 'collection/entreprise_collection_blones.dart';
import 'collection/fiche_collection_blone.dart';
import 'collection/flux_collection_blone.dart';
import 'collection/personne_collection_blone.dart';
import 'collection/synergie_collection_blone.dart';
import 'navigation_blone.dart';
import 'rapport_blone.dart';

/// Provide services.
class AppBlone extends ChangeNotifier with ParentBlone {
  // Auth
  final AuthBlone auth = SupabaseAuthBlone();

  // Navigation
  final navigation = NavigationBlone();

  // DCPs
  final personnes = PersonneCollectionBlone();

  // Animation
  final demarches = DemarcheCollectionBlone();
  final animateurs = AnimateurCollectionBlone();
  final coAnimateurs = CoAnimateurCollectionBlone();
  final ateliers = AtelierCollectionBlone();
  final participantMeta = ParticipantMetaCollectionBlone();
  final fiches = FicheCollectionBlone();

  // Entreprises
  final entreprises = EntrepriseCollectionBlone();
  final etablissements = EtablissementCollectionBlone();
  final contacts = ContactCollectionBlone();

  // Synergies
  final flux = FluxCollectionBlone();
  final synergies = SynergieCollectionBlone();

  // Download
  final rapport = RapportBlone();

  // Show message function
  final void Function(UIMessage message) showMessage;

  // Supabase client
  SupabaseClient supabaseClient;

  AppBlone({required this.showMessage, required this.supabaseClient})
      : super() {
    init();
  }

  void init() {
    initialize([
      personnes,
      demarches,
      animateurs,
      coAnimateurs,
      ateliers,
      participantMeta,
      fiches,
      entreprises,
      etablissements,
      contacts,
      flux,
      synergies,
      auth,
      navigation,
      rapport,
    ]);
  }

  /// Mounting
  bool _mounted = false;

  @override
  Future<void> mount() async {
    if (_mounted) return;
    _mounted = true;
    try {
      super.mount();
    } catch (error) {
      readyCompleter.complete(false);
      rethrow;
    }
  }

  final readyCompleter = Completer<bool>();

  Future<bool> get ready => readyCompleter.future;
}

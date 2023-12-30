import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

import 'donnees.dart';

class BuildIn {
  static Future<Thematiques> get thematiques async {
    String jsonText = await rootBundle.loadString('data/flux_types.json');
    List parsed = json.decode(jsonText);
    return UnmodifiableListView([
      for (final t in parsed) Thematique.fromJson(t),
    ]);
  }

  static Future<Synapse> get synapse async {
    String jsonText = await rootBundle.loadString('data/synapse.json');
    List parsed = json.decode(jsonText);
    return UnmodifiableListView([
      for (final t in parsed) ClassificationSynapse.fromJson(t),
    ]);
  }
}

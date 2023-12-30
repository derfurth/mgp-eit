import 'package:flutter/foundation.dart';
import 'package:mgp_client/models/snippets.dart';

import 'donnees.dart';

/// Used for search
typedef Needle = ValueNotifier<String>;

/// Used for picker and lists
typedef Contacts = ValueNotifier<List<ContactSnippet>>;
typedef Fluxes = ValueNotifier<List<Flux>>;
typedef Animateurs = ValueNotifier<List<AnimateurSnippet>>;
typedef CoAnimateurs = ValueNotifier<List<CoAnimateurSnippet>>;

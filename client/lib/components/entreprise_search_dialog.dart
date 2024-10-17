import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mgp_client/blones/collection/entreprise_collection_blones.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:tuple/tuple.dart';

import '../../blones/api/recherche_entreprise.dart';
import '../blones/collection/collection_blone.dart';
import '../chauffeur/chauffeur.dart';
import '../commands/show_message_command.dart';
import '../models/ui_message.dart';

/// Shows a dialog that allows the user to search for an entreprise
/// to create an Entreprise before editing.
void showEntrepriseSearchDialog(BuildContext context,
    {required String demarcheId}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      EntrepriseEtablissement? userSelection;
      final EntrepriseCollectionBlone entreprises = context.read();
      final EtablissementCollectionBlone etablissements = context.read();

      return AlertDialog(
        title: const Text('Saisie rapide'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recherche d'établissement"),
            EntrepriseSearch(
              onSelected: (selection) => userSelection = selection,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              chauffeur.createEntreprise(demarcheId);
            },
            child: const Text('Saisie manuelle'),
          ),
          TextButton(
            onPressed: () async {
              if (userSelection == null) {
                Navigator.of(context).pop();
                chauffeur.createEntreprise(demarcheId);
              } else {
                Navigator.of(context).pop();

                final entreprise = Entreprise(
                  id: SupabaseCollection.uuid.v4(),
                  demarcheId: demarcheId,
                  siren: userSelection!.item1.siren,
                  denomination: userSelection!.item1.nom,
                );
                final etablissement = Etablissement(
                  id: SupabaseCollection.uuid.v4(),
                  demarcheId: demarcheId,
                  entrepriseId: entreprise.id,
                  siret: userSelection!.item2.siret,
                  adresseLigne1: userSelection!.item2.adresse,
                  ville: userSelection!.item2.commune,
                  codePostal: userSelection!.item2.codePostal,
                );

                await entreprises.save(entreprise);
                await etablissements.save(etablissement);

                ShowMessageCommand().execute(
                    const UIMessage.save('Entreprise enregistrée'));

                chauffeur.editEntreprise(demarcheId, entreprise.id);
              }
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

const Duration debounceDuration = Duration(milliseconds: 250);

/// The search field, uses Autocomplete to suggest matches.
class EntrepriseSearch extends StatefulWidget {
  const EntrepriseSearch({super.key, required this.onSelected});

  final void Function(EntrepriseEtablissement selection) onSelected;

  @override
  State<EntrepriseSearch> createState() => _EntrepriseSearchState();
}

typedef EntrepriseEtablissement
    = Tuple2<MatchingEntreprise, MatchingEtablissement>;

class _EntrepriseSearchState extends State<EntrepriseSearch> {
  final RechercheEntrepriseApi _api = RechercheEntrepriseApi();
  String? _currentQuery;
  String? departement;
  late Iterable<EntrepriseEtablissement> _lastOptions =
      <EntrepriseEtablissement>[];

  late final _Debounceable<Iterable<EntrepriseEtablissement>?, String>
      _debouncedSearch;

  Future<Iterable<EntrepriseEtablissement>?> _search(String query) async {
    _currentQuery = query;

    try {
      final Iterable<MatchingEntreprise> results =
          await _api.search(query, departement: departement);
      if (_currentQuery != query) {
        return null;
      }
      _currentQuery = null;
      final tuples = <EntrepriseEtablissement>[];

      for (final entreprise in results) {
        for (final etablissement in entreprise.etablissements) {
          tuples.add(Tuple2(entreprise, etablissement));
        }
      }

      return tuples;
    } catch (_) {
      return null; // Handle search errors if necessary
    }
  }

  @override
  void initState() {
    super.initState();
    _debouncedSearch =
        _debounce<Iterable<EntrepriseEtablissement>?, String>(_search);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: "N département",
          ),
          onChanged: (value) {
            setState(() {
              departement = value;
            });
          },
        ).flexible(),
        const SizedBox(width: 16),
        Autocomplete<EntrepriseEtablissement>(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text.isEmpty) {
              return const <EntrepriseEtablissement>[];
            }
            final Iterable<EntrepriseEtablissement>? options =
                await _debouncedSearch(textEditingValue.text);
            if (options == null) {
              return _lastOptions;
            }
            _lastOptions = options;
            return options;
          },
          displayStringForOption: (EntrepriseEtablissement option) =>
              option.item1.nom,
          optionsViewBuilder: (context, onSelected, options) {
            return _AutocompleteOptions(
              onSelected: onSelected,
              options: options,
            );
          },
          onSelected: widget.onSelected,
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              decoration: const InputDecoration(
                hintText: "Nom de l'établissement",
              ),
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
        ).flexible(flex: 2),
      ],
    );
  }
}

typedef _Debounceable<S, T> = Future<S?> Function(T parameter);

_Debounceable<S, T> _debounce<S, T>(_Debounceable<S?, T> function) {
  _DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = _DebounceTimer();
    try {
      await debounceTimer!.future;
    } catch (error) {
      if (error is _CancelException) {
        return null;
      }
      rethrow;
    }
    return function(parameter);
  };
}

class _DebounceTimer {
  _DebounceTimer() {
    _timer = Timer(debounceDuration, _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

class _CancelException implements Exception {
  const _CancelException();
}

class _AutocompleteOptions<T extends EntrepriseEtablissement>
    extends StatelessWidget {
  const _AutocompleteOptions({
    super.key,
    required this.onSelected,
    required this.options,
  });

  final AutocompleteOnSelected<T> onSelected;
  final Iterable<T> options;

  @override
  Widget build(BuildContext context) {
    const optionsAlignment = AlignmentDirectional.topStart;
    return Align(
      alignment: optionsAlignment,
      child: Material(
        elevation: 4.0,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            final T option = options.elementAt(index);
            return InkWell(
              onTap: () {
                onSelected(option);
              },
              child: Builder(builder: (BuildContext context) {
                final bool highlight =
                    AutocompleteHighlightedOption.of(context) == index;
                if (highlight) {
                  SchedulerBinding.instance.addPostFrameCallback(
                      (Duration timeStamp) {
                    Scrollable.ensureVisible(context, alignment: 0.5);
                  }, debugLabel: 'AutocompleteOptions.ensureVisible');
                }
                return Container(
                  color: highlight ? Theme.of(context).focusColor : null,
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text('${option.item1.nom} ${option.item2.siret}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option.item2.adresse),
                        Text(
                            '${option.item2.codePostal} ${option.item2.commune}'),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

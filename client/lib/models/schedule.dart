import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mgp_client/models/donnees.dart';

/// The configuration for the schedule.
///
/// Participants will meet around tables and will change table at each turn, the
/// schedule have a maximum of [turnCount].
///
/// The number of available tables is [tableCount] and the maximum of participants
/// per table is [tableSeatCount].
class ScheduleConfiguration {
  final int turnCount;
  final int tableCount;
  final int tableSeatCount;

  ScheduleConfiguration({
    required this.turnCount,
    required this.tableCount,
    required this.tableSeatCount,
  });

  @override
  String toString() =>
      'Configuration: tours: $turnCount, tables: $tableCount, sièges: $tableSeatCount';
}

/// A simplified card, with the necessary information to build a schedule.
///
/// It represent the interest of a [participant] for a given [ressource].
/// [offre] means the [participant] is offering the [ressource], while [besoin]
/// means the [participant] needs the [ressource].
///
/// [lien] is an optional unique id, where a card is filled, other participant
/// may add a the same [lien] to their card if they want to be on the table.
class ScheduleCard {
  final String ficheId;
  final String participant;
  final String ressource;
  final bool offre;

  bool get besoin => !offre;

  ScheduleCard({
    required this.ficheId,
    required this.participant,
    required this.ressource,
    required this.offre,
  });

  String toString() =>
      '$participant ${offre ? 'offre' : 'a besoin de'} $ressource';
}

/// The table where [participants] will gather to talk about [ressources].
///
/// Usually only one ressource will be the subject of conversation, but in
/// the case of [Card]s with lien, [ressources] may contain more than one
/// element.
class Table {
  final Set<String> participants;
  final Set<String> ressources;

  Table({required this.participants, required this.ressources});

  @override
  String toString() =>
      '${participants.length} participants au sujet de ${ressources.join(
          ', ')}: ${participants.join(', ')}';
}

/// The turn is a list of [tables] where [participants] will discuss.
///
/// A participant can only be at one table at a time.
class Turn {
  final tables = <Table>[];

  @override
  String toString() => '${tables.length} tables:\n${tables.join('\n')}';
}

/// The schedule, provides list of [turns] after [compute] have been run.
///
/// Takes a [configuration] and [cards], computes [tables] and [turns]
class Schedule {
  final ScheduleConfiguration configuration;
  final List<ScheduleCard> cards;
  final List<LienFiche> liens;
  late final List<String> participants;
  late final List<String> ressources;

  final tables = <Table>[];
  final turns = <Turn>[];

  Schedule({
    required this.configuration,
    required this.cards,
    required this.liens,
  }) {
    participants = cards.map((s) => s.participant).toSet().toList();
    ressources = cards.map((s) => s.ressource).toSet().toList();
  }

  /// Get a table by turn and table index, useful for grid display.
  Table? getBy(int turnIndex, int tableIndex) {
    final turn = turns.elementAtOrNull(turnIndex);
    if (turn == null) return null;
    return turn.tables.elementAtOrNull(tableIndex);
  }

  /// Compute the [tables] and [turns] given the current [configuration].
  Future<List<Turn>> compute() async {
    tables.clear();
    turns.clear();

    final grouped = cards.groupListsBy((card) => card.ressource);
    for (var ressource in grouped.keys) {
      final cards = grouped[ressource];
      print('---\n$ressource\n${cards!.map((card) => card.participant).join(' / ')}\n\n');
    }

    makeTables();
    mergeDuplicateTables();
    removeSoloTables();
    makeTurns();

    // Keep the turns with the most tables.
    return turns.take(configuration.turnCount).toList();
  }

  /// Compute the participants distribution over tables.
  void makeTables() {
    // The maximum number of participants around a table
    final seats = configuration.tableSeatCount;
    if (seats < 2) return;

    // For a stable table layout.
    final random = Random(seats);

    // Keep track of assigned tables to avoid duplicates.
    final assigned = <ScheduleCard>{};

    // First pass: group participant by liens.
    for (final lien in liens) {
      final relatedCards = LienFiche.getRelatedFicheIds(
        [lien.ficheAId, if (lien.ficheBId != null) lien.ficheBId!],
        liens,
      )
          .map((id) => cards.firstWhereOrNull((card) => card.ficheId == id))
          .whereNotNull()
          .toSet();
      print('-------');
      print('${relatedCards.length} related: ${relatedCards.toString()}');

      final offers = relatedCards.where((card) => card.offre).toList();
      final needs = relatedCards.where((card) => card.besoin).toList();
      final needsPerOffer = max(1, needs.length / ~offers.length).toInt();
      print('offers ${offers}, needs ${needs}');

      final lienTables = <Table>[];

      while (needs.isNotEmpty || offers.isNotEmpty) {
        final tableOffers = needs.isEmpty
        // no needs, take max offers
            ? offers.sample(seats, random)
        // there are matching needs, take a single offer
            : offers.sample(1, random);
        final tableNeeds = offers.isEmpty
        // no offer, take max needs
            ? needs.sample(seats, random)
        // there is at least a matching offer
            : needs.sample(min(seats - 1, needsPerOffer), random);

        needs.removeWhere((card) => tableNeeds.contains(card));
        offers.removeWhere((card) => tableOffers.contains(card));
        final tableCards = [...tableOffers, ...tableNeeds];

        if (tableCards.length == 1) {
          final remaining = tableCards.first;
          tableCards.add(
            relatedCards.firstWhere(
                  (card) => card.offre != remaining.offre,
              orElse: () =>
                  relatedCards
                      .firstWhere((card) => card.ficheId != remaining.ficheId),
            ),
          );
        }

        lienTables.add(
          Table(
            participants: tableCards.map((card) => card.participant).toSet(),
            ressources: tableCards.map((card) => card.ressource).toSet(),
          ),
        );

        assigned.addAll(tableCards);
      }
      tables.addAll(lienTables);
    }

    // Second pass: group participants by resource.
    for (final ressource in ressources) {
      final ressourceCards = cards
          .where(
              (card) => card.ressource == ressource && !assigned.contains(card))
          .toSet();

      final offers = ressourceCards.where((card) => card.offre).toList();
      final needs = ressourceCards.where((card) => card.besoin).toList();

      // we cannot form a couple of participants over ressources.
      if (needs.isEmpty || offers.isEmpty) continue;

      // Our ressources tables.
      final ressourceTables = <Table>[];
      final needsPerOffer = max(1, needs.length / ~offers.length).toInt();

      while (needs.isNotEmpty && offers.isNotEmpty) {
        if (offers.isEmpty) {
          offers.add(ressourceCards
              .where((card) => card.offre)
              .sample(1, random)
              .first);
        }
        if (needs.isEmpty) {
          needs.addAll(ressourceCards
              .where((card) => card.besoin)
              .sample(min(seats - 1, needsPerOffer), random));
        }
        final tableOffers = offers.sample(1, random);
        final tableNeeds = needs.sample(min(seats - 1, needsPerOffer), random);

        needs.removeWhere((card) => tableNeeds.contains(card));
        offers.removeWhere((card) => tableOffers.contains(card));

        ressourceTables.add(
          Table(
              participants: [
                ...tableOffers,
                ...tableNeeds,
              ].map((card) => card.participant).toSet(),
              ressources: {ressource}),
        );
      }

      tables.addAll(ressourceTables);
    }
  }

  /// Merge tables with the same participants.
  void mergeDuplicateTables() {
    final merged = <Table>[];
    final dupes = <Table>[];
    for (final table in tables) {
      if (merged.contains(table)) continue;
      if (dupes.contains(table)) continue;
      final sameParticipants = tables.where((other) =>
      table != other &&
          table.participants.length == other.participants.length &&
          table.participants.containsAll(other.participants));
      if (sameParticipants.isNotEmpty) merged.add(table);
      for (final duplicate in sameParticipants) {
        table.ressources.addAll(duplicate.ressources);
        dupes.add(duplicate);
      }
    }
    tables.removeWhere((table) => dupes.contains(table));
  }

  /// Remove tables with only one participant.
  void removeSoloTables() {
    tables.removeWhere((table) => table.participants.length < 2);
  }

  void makeTurns() {
    // Sort tables by the number of participants in descending order.
    tables
        .sort((a, b) => b.participants.length.compareTo(a.participants.length));

    // Build as many turns as tables.
    final turns = [for (var i = 0; i < tables.length; i++) Turn()];

    for (final table in tables) {
      // Find a turn to add the table
      turns
          .firstWhere((turn) =>
      // - where all tables are not assigned
      turn.tables.length < configuration.tableCount &&
          // - no tables have a participant from our table
          !turn.tables.any((other) =>
          other.participants
              .intersection(table.participants)
              .isNotEmpty))
          .tables
          .add(table);
      // sort turns to keep empty turns at the end.
      turns.sort((a, b) => b.tables.length.compareTo(a.tables.length));
    }

    // Keep the turns with the most tables.
    this.turns
      ..clear()
      ..addAll(turns.take(configuration.turnCount));
  }

  @override
  String toString() => '${turns.length} tours:\n${turns.join('\n\n')}';
}

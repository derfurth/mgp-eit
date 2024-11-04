import 'package:collection/collection.dart';

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
  final String participant;
  final String ressource;
  final bool offre;
  final String? lien;

  bool get besoin => !offre;

  ScheduleCard({
    required this.participant,
    required this.ressource,
    required this.offre,
    this.lien,
  });
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
      '${participants.length} participants au sujet de ${ressources.join(', ')}: ${participants.join(', ')}';
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
  late final List<String> participants;
  late final List<String> ressources;

  final tables = <Table>[];
  final turns = <Turn>[];

  Schedule({required this.configuration, required this.cards}) {
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
    // Group participants by resource.
    for (final ressource in ressources) {
      final participants = cards
          .where((card) => card.ressource == ressource)
          .map((card) => card.participant)
          .toSet();

      // A table should have at least one participant.
      if (participants.length <= 1) {
        continue;
      }
      // Our participants can all fit around a table.
      else if (participants.length <= configuration.tableSeatCount) {
        tables.add(Table(participants: participants, ressources: {ressource}));
      }
      // They do not fit around a table so we need to split them around.
      else {
        int seatCount = configuration.tableSeatCount;
        while (participants.length % seatCount == 1 && seatCount > 1) {
          seatCount--;
        }
        tables
            .addAll(participants.slices(seatCount).map((participants) => Table(
                  participants: participants.toSet(),
                  ressources: {ressource},
                )));
      }
    }

    // Merge tables with the same participants.
    for (final table in tables) {
      final duplicates = tables.where((other) =>
          other != table && other.participants == table.participants);
      for (final duplicate in duplicates) {
        table.ressources.addAll(duplicate.ressources);
        tables.remove(duplicate);
      }
    }

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
              !turn.tables.any((other) => other.participants
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
    return this.turns;
  }

  @override
  String toString() => '${turns.length} tours:\n${turns.join('\n\n')}';
}

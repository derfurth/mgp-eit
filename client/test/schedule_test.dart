import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_client/models/faked.dart';
import 'package:mgp_client/models/schedule.dart';

Future<void> main() async {
  test('Compute a simple schedule', () async {
    final schedule = Schedule(
      cards: [
        ScheduleCard(
            ficheId: 'a',
            participant: 'Alice',
            ressource: 'Stone',
            offre: true),
        ScheduleCard(
            ficheId: 'b', participant: 'Alice', ressource: 'Wood', offre: true),
        ScheduleCard(
            ficheId: 'c', participant: 'Bob', ressource: 'Wood', offre: false),
        ScheduleCard(
            ficheId: 'd',
            participant: 'Clara',
            ressource: 'Stone',
            offre: false),
      ],
      configuration:
          ScheduleConfiguration(turnCount: 2, tableCount: 2, tableSeatCount: 2),
      liens: [],
    );
    await schedule.compute();
    expect(schedule.turns, isNotEmpty);
    print(schedule);
  });

  test('Compute a random schedule', () async {
    final faker = Faker();
    final ressources = ['Stone', 'Wood', 'Iron', 'Gold'];
    final participants = List.generate(20, (_) => faker.person.name());
    final cards = List.generate(
        40,
        (_) => ScheduleCard(
              ficheId: faker.guid.guid(),
              participant: participants.random(),
              ressource: ressources.random(),
              offre: faker.randomGenerator.boolean(),
            ));

    final schedule = Schedule(
      cards: cards, // Generates 10 random ScheduleCards
      configuration: ScheduleConfiguration(
        turnCount: 4,
        tableCount: 4,
        tableSeatCount: 6,
      ),
      liens: [],
    );
    await schedule.compute();
    expect(schedule.turns, isNotEmpty);
    print(schedule);
  });
}

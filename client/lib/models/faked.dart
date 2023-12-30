import 'dart:math';

import 'package:faker/faker.dart';
import 'package:mgp_client/models/donnees.dart';


// ---------------------------------------------------------
// Build fake data for testing behaviors and building views.
// ---------------------------------------------------------

extension RandomPick<T> on List<T> {
  T random() => this[Random().nextInt(length)];
}

final _faker = Faker();
final _random = RandomGenerator();
final fakeId = _faker.guid.guid;

_fakeSiren() => _random.numberOfLength(9).toString();

_fakeSiret() => _random.numberOfLength(14).toString();

_fakeCodePostal() => _random.fromPattern(['#####']);

class FakeUser {
  final String email;
  final String password;
  final String id;

  const FakeUser(this.email, this.password, this.id);
}

const yolododo = FakeUser(
    'yolo@dodo.com', 'yolododo', 'f6bdc697-919b-43c9-8e8a-aa428f45f3f3');

const yulududu = FakeUser(
    'yulu@dudu.com', 'yulududu', '298235a0-60e7-4ceb-9172-0a991cce0386');

const yilididi = FakeUser(
    'yili@didi.com', 'yilididi', '3f407fc6-3634-45ff-a988-301e9088096a');

const yaladada = FakeUser(
    'yala@dada.com', 'yaladada', '4ecc7d3a-7484-4a1c-8ac8-930cdacd2561');

const builtInThematiqueIds = ['dechets', 'eau', 'matieres', 'mobilite'];

class FakedPersonne {
  late Personne personne;

  FakedPersonne({String? id, String? demarcheId}) {
    personne = Personne(
      id: id ?? fakeId(),
      demarcheId: demarcheId ?? fakeId(),
      nom: _faker.person.lastName(),
      prenom: _faker.person.firstName(),
      email: _faker.internet.email(),
      telephone: _faker.phoneNumber.us(),
    );
  }
}

class FakedEtablissement {
  late final Etablissement etablissement;
  final List<Personne> personnes = [];
  final List<Contact> contacts = [];

  FakedEtablissement({
    String? id,
    String? demarcheId,
    String? entrepriseId,
    int contactCount = 0,
  }) {
    id ??= fakeId();
    demarcheId ??= fakeId();
    entrepriseId ??= fakeId();
    for (final _ in Iterable<int>.generate(contactCount)) {
      final faked = FakedContact(demarcheId: demarcheId, etablissementId: id);
      contacts.add(faked.contact);
      personnes.add(faked.personne);
    }
    etablissement = Etablissement(
      id: id,
      demarcheId: demarcheId,
      entrepriseId: entrepriseId,
      siret: _fakeSiret(),
      adresseLigne1: _faker.address.streetName(),
      codePostal: _fakeCodePostal(),
      ville: _faker.address.city(),
    );
  }
}

class FakedEntreprise {
  late final Entreprise entreprise;
  final List<Etablissement> etablissements = [];
  final List<Contact> contacts = [];
  final List<Personne> personnes = [];

  FakedEntreprise({
    String? id,
    String? demarcheId,
    int etablissementCount = 0,
    int contactPerEtablissementCount = 0,
  }) {
    id ??= fakeId();
    demarcheId ??= fakeId();
    for (int i = 0; i < etablissementCount; i++) {
      final fakedEtablissement = FakedEtablissement(
        demarcheId: demarcheId,
        contactCount: contactPerEtablissementCount,
        entrepriseId: id,
      );
      etablissements.add(fakedEtablissement.etablissement);
      contacts.addAll(fakedEtablissement.contacts);
      personnes.addAll(fakedEtablissement.personnes);
    }

    entreprise = Entreprise(
      id: id,
      demarcheId: demarcheId,
      siren: _fakeSiren(),
      denomination: _faker.company.name(),
    );
  }
}

class FakedContact {
  late Contact contact;
  late Personne personne;

  FakedContact({
    String? id,
    String? demarcheId,
    String? etablissementId,
  }) {
    demarcheId ??= fakeId();
    contact = Contact(
      id: id ?? fakeId(),
      demarcheId: demarcheId,
      personneId: fakeId(),
      etablissementId: etablissementId ?? fakeId(),
    );
    personne = FakedPersonne(
      id: contact.personneId,
      demarcheId: demarcheId,
    ).personne;
  }
}

class FakedAnimateur {
  late Animateur animateur;
  late Personne personne;

  FakedAnimateur({
    String? id,
    String? demarcheId,
    String? userId,
  }) {
    demarcheId ??= fakeId();
    animateur = Animateur(
      id: id ?? fakeId(),
      personneId: fakeId(),
      demarcheId: demarcheId,
      userId: userId,
    );
    personne = FakedPersonne(
      id: animateur.personneId,
      demarcheId: demarcheId,
    ).personne;
  }
}

class FakedCoAnimateur {
  late CoAnimateur coAnimateur;
  late Personne personne;

  FakedCoAnimateur({
    String? id,
    String? demarcheId,
    String? userId,
  }) {
    demarcheId ??= fakeId();
    coAnimateur = CoAnimateur(
      id: id ?? fakeId(),
      demarcheId: demarcheId,
      personneId: fakeId(),
      userId: userId,
    );
    personne = FakedPersonne(
      id: coAnimateur.personneId,
      demarcheId: demarcheId,
    ).personne;
  }
}

class FakedAtelier {
  late Atelier atelier;

  FakedAtelier({String? id}) {
    atelier = Atelier(
      id: id ?? fakeId(),
      demarcheId: fakeId(),
      animateurIds: [fakeId()],
      coAnimateurIds: [fakeId()],
      lieu: _faker.address.streetAddress(),
      organisateur: _faker.company.name(),
    );
  }
}

class FakedFiche {
  late final Fiche fiche;
  late final Flux flux;

  FakedFiche({
    String? id,
    String? demarcheId,
    String? atelierId,
    String? contactId,
    String? etablissementId,
    List<String>? thematiqueIds,
  }) {
    demarcheId ??= fakeId();
    atelierId ??= fakeId();
    contactId ??= fakeId();
    thematiqueIds ??= [builtInThematiqueIds.random()];
    flux = FakedFlux(
      demarcheId: demarcheId,
      atelierId: atelierId,
      contactId: contactId,
      etablissementId: etablissementId,
      thematiqueIds: thematiqueIds,
    ).flux;
    fiche = Fiche(
      id: id ?? fakeId(),
      demarcheId: demarcheId,
      atelierId: atelierId,
      contactId: contactId,
      thematiqueIds: thematiqueIds,
      fluxId: flux.id,
      commentaire: _faker.lorem.sentence(),
    );
  }
}

class FakedParticipantMeta {
  late ParticipantMeta participantMeta;

  FakedParticipantMeta({
    String? id,
    String? demarcheId,
    List<String>? thematiqueIds,
  }) {
    demarcheId ??= fakeId();
    thematiqueIds ??= [builtInThematiqueIds.random()];
    participantMeta = ParticipantMeta(
      atelierId: fakeId(),
      contactId: fakeId(),
      demarcheId: demarcheId,
      thematiqueIds: thematiqueIds,
      champLibre: _faker.lorem.sentence(),
    );
  }
}

class FakedFlux {
  late Flux flux;

  FakedFlux({
    String? id,
    String? demarcheId,
    String? atelierId,
    String? contactId,
    String? etablissementId,
    List<String>? thematiqueIds,
  }) {
    thematiqueIds ??= [builtInThematiqueIds.random()];
    flux = Flux(
      id: id ?? fakeId(),
      demarcheId: demarcheId ?? fakeId(),
      atelierId: atelierId ?? fakeId(),
      contactId: contactId ?? fakeId(),
      etablissementId: etablissementId ?? fakeId(),
      designation: faker.food.dish(),
      thematiqueIds: thematiqueIds,
      resourceNom: faker.food.dish(),
      resourceDescription: faker.food.restaurant(),
    );
  }
}

/// Build a fake demarche with fake animateurs and the corresponding
/// faked personnes.
class FakedDemarche {
  late Demarche demarche;
  final List<Animateur> animateurs = [];
  final List<Personne> personnes = [];

  FakedDemarche({
    String? id,
    int animateurCount = 0,
  }) {
    id ??= fakeId();
    for (int i = 0; i < animateurCount; i++) {
      final faked = FakedAnimateur(demarcheId: id);
      animateurs.add(faked.animateur);
      personnes.add(faked.personne);
    }
    demarche = Demarche(
      id: id,
      denomination: _faker.address.city(),
      champLibre: _faker.lorem.sentence(),
    );
  }
}

class FakedSynergie {
  late Synergie synergie;

  FakedSynergie({
    String? id,
    String? demarcheId,
    List<String>? fluxIds,
  }) {
    synergie = Synergie(
      id: id ?? fakeId(),
      demarcheId: demarcheId ?? fakeId(),
      nom: _faker.food.restaurant(),
      commentaire: _faker.lorem.sentence(),
      commentaireDate:
          _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
      statut: SynergieStatut.values.random(),
      type: SynergieType.values.random(),
      fluxIds: fluxIds ?? [],
    );
  }
}

/// Build a fake db with coherent contents.
class FakedDB {
  final demarches = <Demarche>[];
  final personnes = <Personne>[];
  final contacts = <Contact>[];
  final etablissements = <Etablissement>[];
  final entreprises = <Entreprise>[];
  final animateurs = <Animateur>[];
  final coAnimateurs = <CoAnimateur>[];
  final ateliers = <Atelier>[];
  final participantMetas = <ParticipantMeta>[];
  final fiches = <Fiche>[];
  final fluxes = <Flux>[];
  final synergies = <Synergie>[];

  /// Fill the database by imitating the data flow, from building demarches,
  /// ateliers down to synergies.
  void fill({
    demarcheCount = 2,
    animateurCount = 10,
    coAnimateurCount = 10,
    entrepriseCount = 10,
    atelierCount = 10,
    synergieCount = 10,
  }) {
    for (int i = 0; i < demarcheCount; i++) {
      final personnes = <Personne>[];
      final contacts = <Contact>[];
      final etablissements = <Etablissement>[];
      final entreprises = <Entreprise>[];
      final animateurs = <Animateur>[];
      final coAnimateurs = <CoAnimateur>[];
      final ateliers = <Atelier>[];
      final participantMetas = <ParticipantMeta>[];
      final fiches = <Fiche>[];
      final fluxes = <Flux>[];
      final synergies = <Synergie>[];

      // Fake demarche data, personnes, animateurs, entreprises...
      final fakedDemarche =
          FakedDemarche(animateurCount: animateurCount - animateurs.length);
      final demarche = fakedDemarche.demarche;

      // animateur profiles for our test users
      [
        if (animateurCount > 0) yolododo,
        if (animateurCount > 1) yilididi,
      ]
          .map((user) => FakedAnimateur(
                userId: user.id,
                demarcheId: demarche.id,
              ))
          .forEach((faked) {
        animateurs.add(faked.animateur);
        personnes.add(faked.personne);
      });

      personnes.addAll(fakedDemarche.personnes);
      animateurs.addAll(fakedDemarche.animateurs);

      this.animateurs.addAll(animateurs);
      demarches.add(demarche);

      for (int i = 0; i < coAnimateurCount; i++) {
        final fakedCoAnimateur = FakedCoAnimateur(
          demarcheId: demarche.id,
        );
        personnes.add(fakedCoAnimateur.personne);
        coAnimateurs.add(fakedCoAnimateur.coAnimateur);
      }
      this.coAnimateurs.addAll(coAnimateurs);

      for (int i = 0; i < entrepriseCount; i++) {
        final fakedEntreprise = FakedEntreprise(
          demarcheId: demarche.id,
          etablissementCount: 1,
          contactPerEtablissementCount: 1,
        );
        entreprises.add(fakedEntreprise.entreprise);
        etablissements.addAll(fakedEntreprise.etablissements);
        personnes.addAll(fakedEntreprise.personnes);
        contacts.addAll(fakedEntreprise.contacts);
      }
      this.entreprises.addAll(entreprises);
      this.etablissements.addAll(etablissements);
      this.contacts.addAll(contacts);
      this.personnes.addAll(personnes);

      // Fake ateliers
      for (int i = 0; i < atelierCount; i++) {
        final atelier = Atelier(
          id: fakeId(),
          demarcheId: demarche.id,
          animateurIds: [animateurs.random().id],
          coAnimateurIds: [coAnimateurs.random().id],
          lieu: _faker.address.streetAddress(),
          organisateur: _faker.company.name(),
        );
        final participants = {
          contacts.random().id,
          contacts.random().id,
          contacts.random().id,
          contacts.random().id
        };

        // Create a fiches for each participant.
        for (final participantId in participants) {
          final thematiques = {
            builtInThematiqueIds.random(),
            builtInThematiqueIds.random(),
            builtInThematiqueIds.random(),
          }.toList();

          final participantMeta = ParticipantMeta(
            demarcheId: demarche.id,
            atelierId: atelier.id,
            contactId: participantId,
            thematiqueIds: thematiques,
            champLibre: _faker.lorem.sentence(),
          );
          participantMetas.add(participantMeta);

          final participant = contacts.firstWhere((c) => c.id == participantId);
          final etablissement = etablissements
              .firstWhere((e) => e.id == participant.etablissementId);

          for (final thematiqueId in thematiques) {
            final fakedFiche = FakedFiche(
              demarcheId: demarche.id,
              atelierId: atelier.id,
              contactId: participantId,
              thematiqueIds: [thematiqueId],
              etablissementId: etablissement.id,
            );
            fiches.add(fakedFiche.fiche);
            fluxes.add(fakedFiche.flux);
          }
        }

        ateliers.add(atelier);
      }
      this.ateliers.addAll(ateliers);
      this.participantMetas.addAll(participantMetas);
      this.fiches.addAll(fiches);
      this.fluxes.addAll(fluxes);

      // Fake building synergies.
      for (int i = 0; i < synergieCount; i++) {
        final thematiqueId = builtInThematiqueIds.random();
        final matchingFluxes = fluxes
            .where((f) => f.thematiqueIds.contains(thematiqueId))
            .toList();
        matchingFluxes.shuffle();
        final synergie = FakedSynergie(
          demarcheId: demarche.id,
          fluxIds: [
            matchingFluxes.random().id,
            matchingFluxes.random().id,
          ],
        ).synergie;
        synergies.add(synergie);
      }
      this.synergies.addAll(synergies);
    }
  }
}

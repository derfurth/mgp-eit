// ignore_for_file: avoid_print

import 'dart:io';

import 'package:async/async.dart';
import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/blones/app_blone.dart';
import 'package:mgp_client/environment.dart';
import 'package:mgp_client/models/donnees.dart';
import 'package:mgp_client/models/faked.dart';
import 'package:supabase/supabase.dart';

/// Beware tests are *order-dependent* as we populate supabase
/// with the fake contents and then run queries against it.
void main() {
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);

  final client = SupabaseClient(
    Environment.supabaseUrl,
    Environment.supabaseKey,
    authOptions: const AuthClientOptions(
      authFlowType: AuthFlowType.implicit,
    ),
  );
  final app = AppBlone(
    showMessage: (m) => print(m),
    supabaseClient: client,
  );

  group('initialization', () {
    test('configure app', () async {
      expect(client, isNotNull);
      HttpOverrides.global = null;

      print(HttpOverrides.current);
      final message = await client.rest.rpc('brew_coffee');
      print(message);
    });
  });

  group('client authentication', () {
    test('authenticate yolo@dodo.com', () async {
      final fail = await app.auth.signInWithPassword(
        'yolo@dodo.com',
        'yolodada',
      );
      expect(fail, isFalse);

      final sucess = await app.auth.signInWithPassword(
        'yolo@dodo.com',
        'yolododo',
      );
      expect(sucess, isTrue);
    });
  });

  // beware shared between tests.
  final db = FakedDB();
  db.fill();

  group('Insert all faked db data using blones', () {
    test('demarche', () async {
      final blone = app.demarches;
      await blone.insert(db.demarches);

      final demarche = await blone.getById(db.demarches.first.id);
      expect(demarche, isA<Demarche>());
    });

    test('personne', () async {
      final blone = app.personnes;
      await blone.insert(db.personnes);

      final personne = await blone.getById(db.personnes.first.id);
      expect(personne, isA<Personne>());
    });

    test('animateur', () async {
      final blone = app.animateurs;
      await blone.insert(db.animateurs);

      final animateur = await blone.getById(db.animateurs.first.id);
      expect(animateur, isA<Animateur>());
    });

    test('coAnimateur', () async {
      final blone = app.coAnimateurs;
      await blone.insert(db.coAnimateurs);

      final coAnimateur = await blone.getById(db.coAnimateurs.first.id);
      expect(coAnimateur, isA<CoAnimateur>());
    });

    test('entreprise', () async {
      final blone = app.entreprises;
      await blone.insert(db.entreprises);

      final entreprise = await blone.getById(db.entreprises.first.id);
      expect(entreprise, isA<Entreprise>());
    });

    test('etablissement', () async {
      final blone = app.etablissements;
      await blone.insert(db.etablissements);

      final etablissement = await blone.getById(db.etablissements.first.id);
      expect(etablissement, isA<Etablissement>());
    });

    test('contact', () async {
      final blone = app.contacts;
      await blone.insert(db.contacts);

      final contact = await blone.getById(db.contacts.first.id);
      expect(contact, isA<Contact>());
    });

    test('atelier', () async {
      final blone = app.ateliers;
      await blone.insert(db.ateliers);

      final atelier = await blone.getById(db.ateliers.first.id);
      expect(atelier, isA<Atelier>());
    });

    test('participantMeta', () async {
      final blone = app.participantMeta;
      await blone.insert(db.participantMetas);
    });

    test('flux', () async {
      final blone = app.flux;
      await blone.insert(db.fluxes);

      final flux = await blone.getById(db.fluxes.first.id);
      expect(flux, isA<Flux>());
    });

    test('fiche', () async {
      final blone = app.fiches;
      await blone.insert(db.fiches);

      final fiche = await blone.getById(db.fiches.first.id);
      expect(fiche, isA<Fiche>());
    });

    test('synergie', () async {
      final blone = app.synergies;
      await blone.insert(db.synergies);

      final synergie = await blone.getById(db.synergies.first.id);
      expect(synergie, isA<Synergie>());
    });
  });

  group('Collection blones', () {
    final app = AppBlone(showMessage: (m) => print(m), supabaseClient: client);

    group('demarche', () {
      test('my demarches', () async {
        final demarches = await app.demarches.getMine();
        expect(demarches, isNotEmpty);
      });
    });

    group('animation', () {
      test('animateur single snippet', () async {
        final animateur = db.animateurs.first;
        final snippet = await app.animateurs.getSnippet(animateur.id);
        expect(snippet, isNotNull);
        expect(snippet.animateur, animateur);
      });

      test('animateur snippet list and search', () async {
        final demarche = db.demarches.first;
        final snippets =
            await app.animateurs.getSnippets(demarcheId: demarche.id);
        expect(snippets, isNotEmpty);

        final snippet = snippets.first;
        final search = await app.animateurs.search(
          demarcheId: demarche.id,
          needle: snippet.personne.prenom,
        );
        expect(search, contains(snippet));
      });

      test('co-animateur single snippet', () async {
        final coAnimateur = db.coAnimateurs.first;
        final snippet = await app.coAnimateurs.getSnippet(coAnimateur.id);
        expect(snippet, isNotNull);
        expect(snippet.coAnimateur, coAnimateur);
      });

      test('co-animateur snippets and search', () async {
        final demarche = db.demarches.first;
        final snippets =
            await app.coAnimateurs.getSnippets(demarcheId: demarche.id);
        expect(snippets, isNotEmpty);

        final snippet = snippets.first;
        final search = await app.coAnimateurs.search(
          demarcheId: demarche.id,
          needle: snippet.personne.prenom,
        );
        expect(search, contains(snippet));
      });
    });

    group('entreprise', () {
      test('entreprise snippet list', () async {
        final snippets = await app.entreprises
            .getSnippets(demarcheId: db.demarches.first.id);
        expect(snippets, isNotEmpty);
      });

      test('entreprise single snippet', () async {
        final entreprise = db.entreprises.first;
        final snippet =
            await app.entreprises.getSnippet(entrepriseId: entreprise.id);
        expect(snippet, isNotNull);
        expect(snippet.entreprise.id, entreprise.id);
        expect(snippet.etablissements, isNotEmpty);
      });

      test('contact single snippet', () async {
        final contact = db.contacts.first;
        final snippet = await app.contacts.getSnippet(contactId: contact.id);
        expect(snippet, isNotNull);
        expect(snippet.contact.id, contact.id);
      });

      test('contact snippet list', () async {
        final snippets =
            await app.contacts.getSnippets(demarcheId: db.demarches.first.id);
        expect(snippets, isNotEmpty);
      });
    });

    group('atelier', () {
      test('single snippet', () async {
        final atelier = db.ateliers.first;
        final snippet = await app.ateliers.getSnippet(atelierId: atelier.id);
        expect(snippet, isNotNull);
        expect(snippet.atelier.id, atelier.id);
      });

      test('list', () async {
        final ateliers =
            await app.ateliers.getAll(demarcheId: db.demarches.first.id);
        expect(ateliers, isNotEmpty);
      });

      test('create and subscribe to a snippet', () async {
        final stream =
            app.ateliers.createSnippet(demarcheId: db.demarches.first.id);
        final queue = StreamQueue(stream);

        // first snippet
        final snippet = await queue.next;
        final atelier = snippet.atelier;
        expect(atelier.demarcheId, db.demarches.first.id);

        // update atelier
        final updated = atelier.copyWith(lieu: 'noir');
        await app.ateliers.save(updated);

        // second snippet
        final retrieved = await queue.next;
        expect(retrieved.atelier, updated);
      });

      test('subscribe to a snippet', () async {
        final atelier = db.ateliers.first;
        final stream = app.ateliers.subscribeToSnippet(atelier.id);
        final queue = StreamQueue(stream);

        // first snippet
        final snippet = await queue.next;
        expect(snippet, isNotNull);
        expect(snippet.atelier.id, atelier.id);

        // update atelier
        final updated = atelier.copyWith(lieu: 'inconnu');
        await app.ateliers.save(updated);

        // second snippet
        final retrieved = await queue.next;
        expect(retrieved.atelier, updated);
      });

      group('participant meta', () {
        test('create then edit then retrieve', () async {
          final meta = await app.participantMeta.fetchOrCreate(
            demarcheId: db.demarches.first.id,
            atelierId: db.ateliers.first.id,
            contactId: db.contacts.first.id,
          );
          expect(meta, isNotNull);

          final edited = meta.copyWith(champLibre: 'such testing! wow!');
          await app.participantMeta.save(edited);

          final retrieved = await app.participantMeta.getByAtelierAndContact(
            atelierId: meta.atelierId,
            contactId: meta.contactId,
          );

          expect(retrieved, edited);
        });

        test('subscribe and create', () async {
          final demarche = db.demarches.first;
          final atelier = db.ateliers.first;
          final contact = db.contacts.first;
          final stream =
              app.participantMeta.subscribeByAtelier(atelierId: atelier.id);

          final queue = StreamQueue(stream);
          // final empty = await queue.next;
          // expect(empty, isEmpty);

          final metas = await queue.next;
          expect(metas, isNotEmpty);

          final edited = app.participantMeta
              .create(
                demarcheId: demarche.id,
                atelierId: atelier.id,
                contactId: contact.id,
              )
              .copyWith(champLibre: 'Hello, see you later in the stream');
          app.participantMeta.save(edited);

          var retrieved = await queue.next;
          retrieved = await queue.next;
          retrieved = await queue.next;
          expect(retrieved, contains(edited));
        });
      });
    });

    group('fiche', () {
      test('single snippet', () async {
        final fiche = db.fiches.first;
        final snippet = await app.fiches.getSnippet(ficheId: fiche.id);
        expect(snippet.fiche, fiche);
      });

      test('create and subscribe to a snippet', () async {
        final stream = app.fiches.createSnippet(
          demarcheId: db.demarches.first.id,
          atelierId: db.ateliers.first.id,
          contactId: db.contacts.first.id,
          etablissementId: db.contacts.first.etablissementId,
        );
        final queue = StreamQueue(stream);

        // first snippet
        final snippet = await queue.next;
        final fiche = snippet.fiche;
        expect(fiche.atelierId, db.ateliers.first.id);

        // update fiche
        final updated = fiche.copyWith(commentaire: 'tellement inspiré');
        await app.fiches.save(updated);

        // second snippet
        final retrieved = await queue.next;
        expect(retrieved.fiche, updated);
      });
    });

    group('fiche and meta streaming', () {
      test('meta stream should emit when a champ libre is changed', () async {
        final demarche = db.demarches.first;
        final atelier = db.ateliers.first;
        final contact = db.contacts.first;
        final stream =
            app.participantMeta.subscribeByAtelier(atelierId: atelier.id);
        final queue = StreamQueue(stream);
        var metas = await queue.next;

        final meta = app.participantMeta
            .create(
              demarcheId: demarche.id,
              atelierId: atelier.id,
              contactId: contact.id,
            )
            .copyWith(champLibre: 'Hello dodo');
        app.participantMeta.save(meta);

        metas = await queue.next;
        metas = await queue.next;
        expect(metas.where((m) => m.champLibre == 'Hello dodo'), isNotEmpty);

        final updated = meta.copyWith(champLibre: 'Yolo dodo');
        app.participantMeta.save(updated);
        metas = await queue.next;
        expect(metas.where((m) => m.champLibre == 'Yolo dodo'), isNotEmpty);
      });
    });

    group('flux', () {
      test('single snippet', () async {
        final flux = db.fluxes.first;
        final snippet = await app.flux.getSnippet(fluxId: flux.id);
        expect(snippet, isNotNull);
        expect(snippet.flux, flux);
      });

      test('list', () async {
        final snippets =
            await app.flux.getAll(demarcheId: db.demarches.first.id);
        expect(snippets, isNotEmpty);
      });
    });

    group('synergie', () {
      test('single snippet', () async {
        final synergie = db.synergies.first;
        final snippet = await app.synergies.getSnippet(fluxId: synergie.id);
        expect(snippet, isNotNull);

        // partial compare since modified at / created at will be different.
        expect(snippet.synergie.nom, synergie.nom);
        expect(snippet.synergie.commentaire, synergie.commentaire);
      });

      test('list', () async {
        final snippets =
            await app.synergies.getAll(demarcheId: db.demarches.first.id);
        expect(snippets, isNotEmpty);
      });

      test('create and subscribe to a snippet', () async {
        final stream = app.synergies.createSnippet(
          demarcheId: db.demarches.first.id,
        );
        final queue = StreamQueue(stream);

        // first snippet
        final snippet = await queue.next;
        final synergie = snippet.synergie;
        expect(synergie.statut, SynergieStatut.identifiee);

        // update synergie
        final updated = synergie.copyWith(nom: 'fraise des bois');
        await app.synergies.save(updated);

        // second snippet
        final retrieved = await queue.next;
        expect(retrieved.synergie.nom, updated.nom);
        expect(retrieved.synergie.createdAt, updated.createdAt);
      });
    });
  });

  group('Invitation test', () {
    final app = AppBlone(showMessage: (m) => print(m), supabaseClient: client);

    test('animateur "invitation" claim', () async {
      await app.auth.signInWithPassword(yolododo.email, yolododo.password);

      final demarche = db.demarches.first;
      final snippets =
          await app.animateurs.getSnippets(demarcheId: demarche.id);
      final unclaimed = snippets.firstWhere(
        (u) => u.animateur.userId == null,
        orElse: () => throw StateError('No unclaimed animateur found.'),
      );

      await app.auth.signInWithPassword(yulududu.email, yulududu.password);
      await app.animateurs.claim(animateurId: unclaimed.animateur.id);

      final animateur = await app.animateurs.getById(unclaimed.animateur.id);
      expect(animateur.userId, isNotNull);
      expect(animateur.demarcheId, isNotNull);

      final demarches = await app.demarches.getMine();
      expect(demarches.any((d) => d.id == animateur.demarcheId), isTrue);
    });

    test('co-animateur "invitation" claim', () async {
      await app.auth.signInWithPassword(yolododo.email, yolododo.password);

      final demarche = db.demarches.first;
      final snippets =
          await app.coAnimateurs.getSnippets(demarcheId: demarche.id);
      final unclaimed = snippets.firstWhere(
        (u) => u.coAnimateur.userId == null,
        orElse: () => throw StateError('No unclaimed co-animateur found.'),
      );

      await app.auth.signInWithPassword(yaladada.email, yaladada.password);
      final success =
          await app.coAnimateurs.claim(coAnimateurId: unclaimed.coAnimateur.id);
      expect(success, isTrue);
      final coAnimateur =
          await app.coAnimateurs.getById(unclaimed.coAnimateur.id);
      expect(coAnimateur.userId, isNotNull);
      expect(coAnimateur.demarcheId, isNotNull);

      final demarches = await app.demarches.getMine();
      expect(demarches.any((d) => d.id == coAnimateur.demarcheId), isTrue);
    });
  });
}

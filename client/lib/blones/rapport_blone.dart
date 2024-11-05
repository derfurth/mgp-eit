import 'package:collection/collection.dart';

import '../commands/download_command.dart';
import '../models/donnees.dart';
import '../models/snippets.dart';
import 'app_blone.dart';
import 'blone.dart';

class RapportBlone with ChildBlone<AppBlone> {
  Future<CSV> fiche(String ficheId) async {
    final fiche = await parent.fiches.getSnippet(ficheId: ficheId);
    return [fiche.getCsvRow];
  }

  Future<CSV> fiches(String demarcheId, String atelierId) async {
    final fiches = await _fiches(atelierId);
    final liens = await parent.liensFiches
        .getForAtelier(demarcheId: demarcheId, atelierId: atelierId);
    final rows = <List>[];

    for (final fiche in fiches) {
      final ficheId = fiche.fiche.id;
      final relatedFicheIds = LienFiche.getRelatedFicheIds(ficheId, liens);
      final fichesLiees =
          fiches.where((fiche) => relatedFicheIds.contains(fiche.fiche.id));

      final row = [
        fiche.contact.entreprise.entreprise.denomination,
        fiche.contact.entreprise.etablissements
            .firstWhere((e) => e.id == fiche.contact.contact.etablissementId)
            .siret,
        fiche.flux.direction.nom,
        fiche.flux.designation,
        fiche.fiche.commentaire,
        fiche.flux.resourceNom,
        fiche.flux.resourceDescription,
        fiche.flux.quantite.toString(),
        fiche.flux.unite,
      ];

      for (final ficheLiee in fichesLiees) {
        var cell =
            '${ficheLiee.flux.direction.nom}: ${ficheLiee.contact.entreprise.entreprise.denomination}';
        if (ficheLiee.flux.quantite > 0) {
          cell += ' ${ficheLiee.flux.quantite} ${ficheLiee.flux.unite}';
        }
        row.add(cell);
      }

      rows.add(row);
    }

    final maxLength =
        rows.fold<int>(0, (max, row) => row.length > max ? row.length : max);
    for (final row in rows) {
      while (row.length < maxLength) {
        row.add('');
      }
    }

    return rows;
  }

  Future<CSV> thematiques(String atelierId, String thematiqueId) async {
    final fiches = await _fiches(atelierId);
    return fiches
        .where((f) => f.fiche.thematiqueIds.contains(thematiqueId))
        .map((f) => f.getCsvRow)
        .toList();
  }

  Future<CSV> fichesByParticipant(
      String atelierId, String participantId) async {
    final fiches = await _fiches(atelierId);
    return fiches
        .where((f) => f.fiche.contactId == participantId)
        .map((f) => f.getCsvRow)
        .toList();
  }

  Future<Iterable<FicheSnippet>> _fiches(String atelierId) async {
    return parent.fiches.getSnippetsForAtelier(atelierId: atelierId);
  }

  Future<CSV> fluxes({
    required String demarcheId,
    required String needle,
  }) async {
    final results =
        await parent.flux.search(demarcheId: demarcheId, needle: needle);
    return results.map((f) => f.getCsvRow).toList();
  }

  Future<CSV> synergies({
    required String demarcheId,
    required String needle,
  }) async {
    final results =
        await parent.synergies.search(demarcheId: demarcheId, needle: needle);
    return results.map((s) => s.getCsvRow).toList();
  }

  Future<CSV> participants(String demarcheId, String atelierId) async {
    final fiches = await _fiches(atelierId);
    final contacts = fiches
        .map((fiche) => fiche.contact)
        .groupFoldBy(
          (c) => c.contact.id,
          (_, c) => c,
        )
        .values;
    return [
      for (final contact in contacts)
        [
          contact.entreprise.entreprise.denomination,
          contact.entreprise.etablissements
              .firstWhere((e) => e.id == contact.contact.etablissementId)
              .siret,
          contact.personne.displayName,
          contact.personne.email,
        ]
    ];
  }
}

extension CSVSynergie on Synergie {
  List<String> get getCsvRow => [
        nom,
        commentaire,
        statut.nom,
        type.nom,
        commentaire,
        '${fluxIds.length} flux'
      ];
}

extension CSVFiche on FicheSnippet {
  List<String> get getCsvRow => [
        contact.entreprise.entreprise.denomination,
        contact.entreprise.etablissements
            .firstWhere((e) => e.id == contact.contact.etablissementId)
            .siret,
        contact.personne.displayName,
        contact.personne.email,
        fiche.thematiqueIds.join(' '),
        flux.direction.name,
        flux.designation,
        fiche.commentaire,
        flux.resourceNom,
        flux.resourceDescription,
        flux.quantite.toString(),
        flux.unite,
      ];
}

extension CSVFlux on Flux {
  List<String> get getCsvRow => [
        thematiqueIds.join(' '),
        designation,
        resourceNom,
        resourceDescription,
        resourceCodeSynapse,
        quantite.toString(),
        unite,
        commentaire,
      ];
}

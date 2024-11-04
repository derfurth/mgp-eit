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
    final liens = await parent.liensFiches.getForAtelier(
        demarcheId: demarcheId, atelierId: atelierId);
    final rows = <List>[];

    void fillFichesLiees(String ficheId, Set<String> visited, List<FicheSnippet> fichesLiees) {
      if (visited.contains(ficheId)) return; // To prevent cycles
      visited.add(ficheId);

      for (final lien in liens) {
        final otherId = lien.ficheBId == ficheId ? lien.ficheAId : lien.ficheAId == ficheId ? lien.ficheBId : null;
        if (otherId != null) {
          final ficheSnippet = fiches.firstWhere((f) => f.fiche.id == otherId);
          fichesLiees.add(ficheSnippet);
          fillFichesLiees(otherId, visited, fichesLiees); // Recursive call
        }
      }
    }

    for (final fiche in fiches) {
      final ficheId = fiche.fiche.id;
      final fichesLiees = <FicheSnippet>[];
      fillFichesLiees(ficheId, <String>{}, fichesLiees);

      final row = [
        fiche.contact.entreprise.entreprise.denomination,
        fiche.contact.entreprise.etablissements
            .firstWhere((e) => e.id == fiche.contact.contact.etablissementId)
            .siret,
        fiche.contact.personne.displayName,
        fiche.contact.personne.email,
        fiche.fiche.thematiqueIds.join(' '),
        fiche.flux.direction.name,
        fiche.flux.designation,
        fiche.fiche.commentaire,
        fiche.flux.resourceNom,
        fiche.flux.resourceDescription,
        fiche.flux.quantite.toString(),
        fiche.flux.unite,
      ];

      for (final ficheLiee in fichesLiees) {
        row.add('lien');
        row.add(ficheLiee.contact.entreprise.entreprise.denomination);
        row.add(ficheLiee.flux.direction.name);
      }

      rows.add(row);
    }

    final maxLength = rows.fold<int>(0, (max, row) => row.length > max ? row.length : max);
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

  Future<CSV> participant(String atelierId, String participantId) async {
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

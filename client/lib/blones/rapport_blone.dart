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

  Future<CSV> fiches(String atelierId) async {
    final fiches = await _fiches(atelierId);
    return fiches.map((f) => f.getCsvRow).toList();
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
    final fiches = await parent.fiches.getByAtelier(atelierId: atelierId);
    return Future.wait(
        fiches.map((f) => parent.fiches.getSnippet(ficheId: f.id)));
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

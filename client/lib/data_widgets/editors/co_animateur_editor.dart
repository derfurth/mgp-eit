import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../app_theme.dart';
import '../../blones/collection/animation_collection_blones.dart';
import '../../blones/collection/personne_collection_blone.dart';
import '../../chauffeur/chauffeur.dart';
import '../../chauffeur/places.dart';
import '../../commands/show_message_command.dart';
import '../../components/layout.dart';
import '../../environment.dart';
import '../../models/donnees.dart';
import '../../models/editables.dart';
import '../../models/editor_mode.dart';
import '../../models/ui_message.dart';
import '../../styled_widgets/heading.dart';
import '../../styled_widgets/leading.dart';
import '../../styled_widgets/padded_single_child_scrollable.dart';
import 'personne_editor.dart';

/// The coAnimateur editor is a composite of
///
/// - Personne editor
/// - Démarche selector
class CoAnimateurEditor extends StatelessWidget {
  final String? coAnimateurId;

  const CoAnimateurEditor({super.key, this.coAnimateurId});

  @override
  Widget build(BuildContext context) {
    final mode = coAnimateurId != null ? EditorMode.update : EditorMode.create;
    final AppTheme theme = context.watch();

    final PersonneCollectionBlone personnes = context.read();
    final CoAnimateurCollectionBlone coAnimateurs = context.read();

    // todo the blone layer should do this
    Future<Tuple2<CoAnimateur, Personne>> getData() async {
      late final CoAnimateur coAnimateur;
      late final Personne personne;
      if (mode == EditorMode.create) {
        final Demarche demarche = context.read();
        personne = personnes.create(demarcheId: demarche.id);
        coAnimateur = coAnimateurs
            .create(demarcheId: demarche.id)
            .copyWith(personneId: personne.id);
      } else {
        coAnimateur = await coAnimateurs.getById(coAnimateurId!);
        personne = await personnes.getById(coAnimateur.personneId);
      }
      return Tuple2(coAnimateur, personne);
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(mode == EditorMode.create
            ? 'Nouveau co-animateur'
            : 'Co-animateur'),
      ),
      child: PaddedSingleChildScrollable(
        child: FutureBuilder<Tuple2<CoAnimateur, Personne>>(
          future: getData(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) return const CircularProgressIndicator();
            return CoAnimateurForm(
              personne: data.item2,
              coAnimateur: data.item1,
            );
          },
        ),
      ),
    );
  }
}

/// CoAnimateur form with access to
///
/// - personne
class CoAnimateurForm extends StatelessWidget {
  final Personne personne;
  final CoAnimateur coAnimateur;

  const CoAnimateurForm({
    super.key,
    required this.personne,
    required this.coAnimateur,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EditablePersonne(personne)),
        ChangeNotifierProvider(create: (_) => EditableCoAnimateur(coAnimateur)),
      ],
      child: Column(
        children: [
          const PersonneForm(),
          Leading.vMedium(),
          if (coAnimateur.userId == null) _CoAnimateurInvitation(),
          _CoAnimateurSaveBar(),
        ],
      ),
    );
  }
}

class _CoAnimateurInvitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableCoAnimateur coAnimateur = context.watch();
    final Demarche demarche = context.watch();

    final fullPath = Environment.webUrl +
        invitationCoAnimateurPlace.path
            .replaceAll(':demarcheId', demarche.id)
            .replaceAll(':coAnimateurId', coAnimateur.value.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(fullPath),
        ButtonBar(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Copier le lien'),
              onPressed: () => Clipboard.setData(ClipboardData(text: fullPath)),
            ),
            if (Environment.showSpikes)
              TextButton(
                onPressed: () => chauffeur.openCoAnimateurInvitation(
                  demarche.id,
                  coAnimateur.value.id,
                ),
                child: const Text('tester'),
              ),
          ],
        ),
      ],
    );
  }
}

class _CoAnimateurSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditablePersonne personne = context.watch();
    final EditableCoAnimateur coAnimateur = context.watch();
    final PersonneCollectionBlone personnes = context.watch();
    final CoAnimateurCollectionBlone coAnimateurs = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            await personnes.save(personne.value);
            await coAnimateurs.save(coAnimateur.value);
            ShowMessageCommand()
                .execute(const UIMessage.save('Co-animateur enregistré'));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

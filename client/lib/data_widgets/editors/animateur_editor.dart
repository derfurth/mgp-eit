import 'package:flutter/foundation.dart';
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

/// The animateur editor is a composite of
///
/// - Personne editor
/// - Démarche selector
class AnimateurEditor extends StatelessWidget {
  final String? animateurId;

  const AnimateurEditor({super.key, this.animateurId});

  @override
  Widget build(BuildContext context) {
    final mode = animateurId != null ? EditorMode.update : EditorMode.create;
    final AppTheme theme = context.watch();

    final PersonneCollectionBlone personnes = context.read();
    final AnimateurCollectionBlone animateurs = context.read();

    // todo the blone layer should do this
    Future<Tuple2<Animateur, Personne>> getData() async {
      late final Animateur animateur;
      late final Personne personne;
      if (mode == EditorMode.create) {
        final Demarche demarche = context.read();
        personne = personnes.create(demarcheId: demarche.id);
        animateur = animateurs
            .create(demarcheId: demarche.id)
            .copyWith(personneId: personne.id);
      } else {
        animateur = await animateurs.getById(animateurId!);
        personne = await personnes.getById(animateur.personneId);
      }
      return Tuple2(animateur, personne);
    }

    return Body(
      header: Padding(
        padding: EdgeInsets.only(
          bottom: theme.grid * 4,
          right: theme.grid,
        ),
        child: Heading.h3(
            mode == EditorMode.create ? 'Nouvel animateur' : 'Animateur'),
      ),
      child: PaddedSingleChildScrollable(
        child: FutureBuilder<Tuple2<Animateur, Personne>>(
          future: getData(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) return const CircularProgressIndicator();
            return AnimateurForm(
              personne: data.item2,
              animateur: data.item1,
            );
          },
        ),
      ),
    );
  }
}

/// Animateur form with access to
///
/// - personne
class AnimateurForm extends StatelessWidget {
  final Personne personne;
  final Animateur animateur;

  const AnimateurForm({
    super.key,
    required this.personne,
    required this.animateur,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EditablePersonne(personne)),
        ChangeNotifierProvider(create: (_) => EditableAnimateur(animateur)),
      ],
      child: Column(
        children: [
          const PersonneForm(),
          Leading.vMedium(),
          if (animateur.userId == null) _AnimateurInvitation(),
          _AnimateurSaveBar(),
        ],
      ),
    );
  }
}

class _AnimateurInvitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditableAnimateur animateur = context.watch();
    final Demarche demarche = context.watch();

    final fullPath = (kIsWeb ? Environment.webUrl : 'not-web') +
        invitationAnimateurPlace.path
            .replaceAll(':demarcheId', demarche.id)
            .replaceAll(':animateurId', animateur.value.id);

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
                onPressed: () => chauffeur.openAnimateurInvitation(
                  demarche.id,
                  animateur.value.id,
                ),
                child: const Text('tester'),
              ),
          ],
        ),
      ],
    );
  }
}

class _AnimateurSaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditablePersonne personne = context.watch();
    final EditableAnimateur animateur = context.watch();
    final PersonneCollectionBlone personnes = context.watch();
    final AnimateurCollectionBlone animateurs = context.watch();

    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            await personnes.save(personne.value);
            await animateurs.save(animateur.value);
            ShowMessageCommand()
                .execute(const UIMessage.save('Animateur enregistré'));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

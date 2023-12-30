import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/animation_collection_blones.dart';
import '../../models/donnees.dart';
import '../../models/provided.dart';
import '../../models/snippets.dart';
import 'add_box.dart';

class AnimateurAddBox extends StatefulWidget {
  final List<AnimateurSnippet> initialSelection;
  final void Function(List<AnimateurSnippet> selection) onSelected;

  const AnimateurAddBox({
    super.key,
    required this.initialSelection,
    required this.onSelected,
  });

  @override
  State<AnimateurAddBox> createState() => _AnimateurAddBoxState();
}

class _AnimateurAddBoxState extends State<AnimateurAddBox> {
  late Animateurs animateurs;

  @override
  void initState() {
    super.initState();
    animateurs = Animateurs(widget.initialSelection);
    animateurs.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    animateurs.removeListener(listener);
  }

  void listener() {
    widget.onSelected(animateurs.value);
  }

  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.watch();
    final AnimateurCollectionBlone blone = context.watch();

    return ChangeNotifierProvider.value(
      value: animateurs,
      child: ChipAddBox<AnimateurSnippet>(
        search: (needle) => blone.search(
          demarcheId: demarche.id,
          needle: needle,
        ),
        title: const Text('Animateurs'),
        chipText: (snippet) => Text(snippet.personne.displayName),
        itemBuilder: (snippet) =>
            SelectableAnimateurItem(animateur: snippet, animateurs: animateurs),
      ),
    );
  }
}

class SelectableAnimateurItem extends StatefulWidget {
  final AnimateurSnippet animateur;
  final Animateurs animateurs;

  const SelectableAnimateurItem({
    super.key,
    required this.animateur,
    required this.animateurs,
  });

  @override
  State<SelectableAnimateurItem> createState() =>
      _SelectableAnimateurItemState();
}

class _SelectableAnimateurItemState extends State<SelectableAnimateurItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.animateurs.value.contains(widget.animateur),
          onChanged: (selected) {
            setState(() {
              if (selected == true) {
                widget.animateurs.value = widget.animateurs.value.toList()
                  ..add(widget.animateur);
              } else {
                widget.animateurs.value = widget.animateurs.value.toList()
                  ..remove(widget.animateur);
              }
            });
          },
        ).padding(horizontal: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.animateur.personne.displayName),
          ],
        ),
      ],
    );
  }
}

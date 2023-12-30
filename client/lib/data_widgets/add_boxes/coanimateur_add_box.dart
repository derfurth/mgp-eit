import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/animation_collection_blones.dart';
import '../../models/donnees.dart';
import '../../models/provided.dart';
import '../../models/snippets.dart';
import 'add_box.dart';

class CoAnimateurAddBox extends StatefulWidget {
  final List<CoAnimateurSnippet> initialSelection;
  final void Function(List<CoAnimateurSnippet> selection) onSelected;

  const CoAnimateurAddBox({
    super.key,
    required this.initialSelection,
    required this.onSelected,
  });

  @override
  State<CoAnimateurAddBox> createState() => _CoAnimateurAddBoxState();
}

class _CoAnimateurAddBoxState extends State<CoAnimateurAddBox> {
  late CoAnimateurs coAnimateurs;

  @override
  void initState() {
    super.initState();
    coAnimateurs = CoAnimateurs(widget.initialSelection);
    coAnimateurs.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    coAnimateurs.removeListener(listener);
  }

  void listener() {
    widget.onSelected(coAnimateurs.value);
  }

  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.watch();
    final CoAnimateurCollectionBlone blone = context.watch();

    return ChangeNotifierProvider.value(
      value: coAnimateurs,
      child: ChipAddBox<CoAnimateurSnippet>(
        search: (needle) => blone.search(
          demarcheId: demarche.id,
          needle: needle,
        ),
        title: const Text('CoAnimateurs'),
        chipText: (snippet) => Text(snippet.personne.displayName),
        itemBuilder: (snippet) => SelectableCoAnimateurItem(
            coAnimateur: snippet, coAnimateurs: coAnimateurs),
      ),
    );
  }
}

class SelectableCoAnimateurItem extends StatefulWidget {
  final CoAnimateurSnippet coAnimateur;
  final CoAnimateurs coAnimateurs;

  const SelectableCoAnimateurItem({
    super.key,
    required this.coAnimateur,
    required this.coAnimateurs,
  });

  @override
  State<SelectableCoAnimateurItem> createState() =>
      _SelectableCoAnimateurItemState();
}

class _SelectableCoAnimateurItemState extends State<SelectableCoAnimateurItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.coAnimateurs.value.contains(widget.coAnimateur),
          onChanged: (selected) {
            setState(() {
              if (selected == true) {
                widget.coAnimateurs.value = widget.coAnimateurs.value.toList()
                  ..add(widget.coAnimateur);
              } else {
                widget.coAnimateurs.value = widget.coAnimateurs.value.toList()
                  ..remove(widget.coAnimateur);
              }
            });
          },
        ).padding(horizontal: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.coAnimateur.personne.displayName),
          ],
        ),
      ],
    );
  }
}

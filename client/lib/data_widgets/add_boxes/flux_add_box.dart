import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../blones/collection/atelier_collection_blones.dart';
import '../../blones/collection/flux_collection_blone.dart';
import '../../models/donnees.dart';
import '../../models/provided.dart';
import '../items/flux_item.dart';
import 'add_box.dart';

class FluxAddBox extends StatefulWidget {
  final Widget title;
  final List<Flux> initialSelection;
  final void Function(List<Flux> selection) onSelected;

  const FluxAddBox({
    super.key,
    this.title = const Text('Flux'),
    required this.initialSelection,
    required this.onSelected,
  });

  @override
  State<FluxAddBox> createState() => _FluxAddBoxState();
}

class _FluxAddBoxState extends State<FluxAddBox> {
  late Fluxes fluxes;

  @override
  void initState() {
    super.initState();
    fluxes = Fluxes(widget.initialSelection);
    fluxes.addListener(listener);
  }

  @override
  void dispose() {
    super.dispose();
    fluxes.removeListener(listener);
  }

  void listener() {
    widget.onSelected(fluxes.value);
  }

  @override
  Widget build(BuildContext context) {
    final FluxCollectionBlone blone = context.watch();
    final Demarche demarche = context.watch();
    final Thematiques thematiques = context.watch();
    final AtelierCollectionBlone ateliers = context.watch();

    return ChangeNotifierProvider.value(
      value: fluxes,
      child: CardAddBox<Flux>(
        search: (String needle) => blone.search(
          demarcheId: demarche.id,
          needle: needle,
        ),
        title: widget.title,
        selectedtemBuilder: (flux) => FluxItem(
          flux: flux,
          demarcheId: demarche.id,
        ),
        selectableItemBuilder: (flux) {
          return MultiProvider(
            providers: [
              Provider<Demarche>.value(value: demarche),
              Provider<Thematiques>.value(value: thematiques),
              ChangeNotifierProvider<AtelierCollectionBlone>.value(
                value: ateliers,
              ),
            ],
            child: SelectableFluxItem(
              flux: flux,
              fluxes: fluxes,
            ),
          );
        },
      ),
    );
  }
}

class SelectableFluxItem extends StatefulWidget {
  final Flux flux;
  final Fluxes fluxes;

  const SelectableFluxItem({
    super.key,
    required this.flux,
    required this.fluxes,
  });

  @override
  State<SelectableFluxItem> createState() => _SelectableFluxItemState();
}

class _SelectableFluxItemState extends State<SelectableFluxItem> {
  @override
  Widget build(BuildContext context) {
    final Demarche demarche = context.watch();
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(
            value: widget.fluxes.value.contains(widget.flux),
            onChanged: (selected) {
              setState(() {
                if (selected == true) {
                  widget.fluxes.value = widget.fluxes.value.toList()
                    ..add(widget.flux);
                } else {
                  widget.fluxes.value = widget.fluxes.value.toList()
                    ..remove(widget.flux);
                }
              });
            },
          ).padding(horizontal: 4),
          Expanded(
            child: FluxItem(
              flux: widget.flux,
              demarcheId: demarche.id,
              navigateOnTap: false,
            ),
          ),
        ],
      ),
    );
  }
}

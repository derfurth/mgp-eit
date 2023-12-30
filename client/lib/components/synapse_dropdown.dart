import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../models/donnees.dart';

class SynapseDropdown extends StatelessWidget {
  final ClassificationSynapse? selected;

  const SynapseDropdown({
    super.key,
    required this.onSelected,
    this.selected,
  });

  final void Function(ClassificationSynapse?) onSelected;

  @override
  Widget build(BuildContext context) {
    final Synapse synapse = context.watch();

    return DropdownSearch<ClassificationSynapse>(
      // remove 'hint' and 'label' properties, use 'dropdownSearchDecoration' instead
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration:
            InputDecoration(labelText: "Classification Synapse"),
      ),
      popupProps: const PopupProps.dialog(
        showSearchBox: true,
      ),
      // onFind: (String? filter) async =>
      //     synapse.where((c) => c.sousCategorie.contains(filter ?? '')).toList(),
      // emptyBuilder: (context, filter) => Center(
      //   child: Text(
      //     filter == null
      //         ? ''
      //         : 'Pas de classification synapse trouvée pour "$filter"',
      //   ),
      // ),
      items: synapse.toList(),
      itemAsString: (ClassificationSynapse? c) => c == null
          ? '...'
          : '${c.code}: ${c.categorie} - ${c.sousCategorie} (${c.unite})',
      onChanged: onSelected,
      selectedItem: selected,
    );
  }
}

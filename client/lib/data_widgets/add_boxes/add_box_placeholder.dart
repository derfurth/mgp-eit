import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/leading.dart';

@Deprecated("Fake component")
class AddBoxPlaceholder extends StatelessWidget {
  final Widget title;

  const AddBoxPlaceholder({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headline4 ?? const TextStyle(),
          child: title,
        ),
        Leading.vSmall(),
        Wrap(
          children: [
            InputChip(
              label: const Text('element'),
              deleteIcon: const Icon(Icons.remove_circle),
              onDeleted: () {},
            ),
          ],
        ),
        ButtonBar(
          children: [
            TextButton.icon(
              onPressed: () {},
              label: const Text('Ajouter'),
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}

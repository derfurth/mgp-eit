import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/leading.dart';
import 'package:mgp_client/styled_widgets/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

typedef ListNotifier<T> = ValueNotifier<List<T>>;
typedef ToLabel<T> = Widget Function(T value);
typedef Needle = ValueNotifier<String>;
typedef Search<T> = Future<Iterable<T>> Function(String search);
typedef ListItemBuilder<T> = Widget Function(T snippet);

typedef SelectionCallback<T> = void Function(List<T> selected);

/// A widget that displays a list of snippets and allows selection.
class ChipAddBox<T> extends AddBox<T> {
  /// Expect a Text widget, it is used
  /// in the chips showing the selected snippets
  final ToLabel<T> chipText;

  const ChipAddBox({
    required super.title,
    required super.search,
    required ListItemBuilder<T> itemBuilder,
    required this.chipText,
    super.key,
  }) : super(
          selectableItemBuilder: itemBuilder,
        );

  @override
  Widget build(BuildContext context) {
    final ListNotifier<T> list = context.watch();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall ?? const TextStyle(),
          child: title,
        ),
        Leading.vSmall(),
        Wrapper(
          size: 0.5,
          children: list.value
              .map(
                (contact) => InputChip(
                  label: chipText(contact),
                  deleteIcon: const Icon(Icons.remove_circle),
                  onDeleted: () => list.value =
                      list.value.where((c) => c != contact).toList(),
                ),
              )
              .toList(),
        ),
        ButtonBar(
          children: [
            TextButton.icon(
              label: const Text('Ajouter'),
              icon: const Icon(Icons.add),
              onPressed: () => openPicker(context),
            ),
          ],
        )
      ],
    );
  }
}

/// A widget that displays a list of snippets and allows selection.
class CardAddBox<T> extends AddBox<T> {
  /// The list item builder
  /// Have access to [selection] as a provided ListNotifier<T>.
  final ListItemBuilder<T> selectedtemBuilder;

  const CardAddBox({
    required super.title,
    required super.search,
    required super.selectableItemBuilder,
    required this.selectedtemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ListNotifier<T> list = context.watch();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall ?? const TextStyle(),
          child: title,
        ),
        Leading.vSmall(),
        Wrapper(
          size: 0.5,
          children: [
            for (final selected in list.value)
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    selectedtemBuilder(selected),
                    ButtonBar(
                      children: [
                        TextButton.icon(
                          onPressed: () => list.value =
                              list.value.where((c) => c != selected).toList(),
                          icon: const Icon(Icons.remove),
                          label: const Text('Retirer'),
                        )
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
        ButtonBar(
          children: [
            TextButton.icon(
              label: const Text('Ajouter'),
              icon: const Icon(Icons.add),
              onPressed: () => openPicker(context),
            ),
          ],
        )
      ],
    );
  }
}

/// A widget that displays a list of snippets and allows selection.
abstract class AddBox<T> extends StatelessWidget {
  /// The search function.
  final Search<T> search;

  /// The title of this widget, shown above the chips..
  final Widget title;

  /// The list item builder
  /// Have access to [selection] as a provided ListNotifier<T>.
  final ListItemBuilder<T> selectableItemBuilder;

  const AddBox({
    required this.title,
    required this.search,
    required this.selectableItemBuilder,
    super.key,
  });

  Future<void> openPicker(BuildContext context) async {
    await showDialog<List<T>>(
      context: context,
      builder: (BuildContext context) {
        final snippetList = _SearchableItemList<T>(
          search: search,
          itemBuilder: selectableItemBuilder,
        );

        return Dialog(
          child: SizedBox(
            width: 600,
            child: snippetList.padding(all: 10),
          ),
        );
      },
    );
  }
}

/// The list of snippets used by the adder
class _SearchableItemList<T> extends StatefulWidget {
  /// Expose the selection to outer builder.
  final Search<T> search;
  final ListItemBuilder<T> itemBuilder;

  const _SearchableItemList({
    super.key,
    required this.search,
    required this.itemBuilder,
  });

  @override
  _SearchableListState<T> createState() => _SearchableListState<T>();
}

class _SearchableListState<T> extends State<_SearchableItemList<T>> {
  final Needle needle = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onSubmitted: (text) => needle.value = text,
          decoration: const InputDecoration(
            labelText: 'Rechercher',
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        Leading.vSmall(),
        MultiProvider(
          providers: [
            ChangeNotifierProvider<Needle>.value(value: needle),
          ],
          child: _FilteredList<T>(
            search: widget.search,
            itemBuilder: widget.itemBuilder,
          ),
        ),
      ],
    );
  }
}

class _FilteredList<T> extends StatefulWidget {
  final Search<T> search;
  final ListItemBuilder<T> itemBuilder;

  const _FilteredList(
      {super.key, required this.search, required this.itemBuilder});

  @override
  State<_FilteredList<T>> createState() => _FilteredListState<T>();
}

class _FilteredListState<T> extends State<_FilteredList<T>> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Needle needle = context.watch();

    return FutureBuilder<Iterable<T>>(
      future: widget.search(needle.value),
      initialData: const [],
      builder: (context, snapshot) {
        final snippets = snapshot.data;
        if (snippets == null) return const CircularProgressIndicator();
        final list = snippets.toList();
        final height = MediaQuery.of(context).size.height * 0.9 - 200;

        return SizedBox(
          height: height,
          child: Scrollbar(
            thumbVisibility: kIsWeb,
            controller: controller,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (_, index) => widget.itemBuilder(list[index]),
            ),
          ),
        );
      },
    );
  }
}

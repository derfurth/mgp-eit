import 'package:flutter/material.dart';
import 'package:mgp_client/styled_widgets/padded_single_child_scrollable.dart';

import 'future_loader.dart';

class FutureScrollableList<T> extends StatelessWidget {
  final Future<Iterable<T>> future;
  final ItemBuilder<T> builder;

  const FutureScrollableList({
    super.key,
    required this.future,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureLoader<Iterable<T>>(
      future: future,
      builder: (context, snapshot) {
        final items = snapshot.data;
        return PaddedSingleChildScrollable(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (final item in items) builder(context, item),
            ],
          ),
        );
      },
    );
  }
}

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);

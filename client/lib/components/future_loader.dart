import 'package:flutter/material.dart';

class FutureLoader<T> extends StatelessWidget {
  final Future<T> future;

  final AsyncWidgetBuilderWithData<T> builder;

  const FutureLoader({
    super.key,
    required this.future,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, AsyncSnapshotWithData<T>(snapshot));
        }
        return loader(context, snapshot);
      },
    );
  }

  Widget loader(BuildContext context, AsyncSnapshot<T> snapshot) {
    return const Center(child: CircularProgressIndicator());
  }
}

class AsyncSnapshotWithData<T> {
  final AsyncSnapshot asyncSnapshot;

  AsyncSnapshotWithData(this.asyncSnapshot) {
    assert(asyncSnapshot.data != null);
  }
  T get data => asyncSnapshot.data!;
}

typedef AsyncWidgetBuilderWithData<T> = Widget Function(
    BuildContext context, AsyncSnapshotWithData<T> snapshot);

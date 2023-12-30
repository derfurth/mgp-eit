import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:provider/provider.dart';

/// Wrapper provides [Wrap]
class Wrapper extends StatelessWidget {
  final List<Widget> children;
  final double size;

  const Wrapper({
    this.size = 2,
    this.children = const <Widget>[],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return Wrap(
      runSpacing: theme.grid * size,
      spacing: theme.grid * size,
      children: children,
    );
  }

  factory Wrapper.form({
    children = const <Widget>[],
  }) =>
      Wrapper(size: 2, children: children);
}

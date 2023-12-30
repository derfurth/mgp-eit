import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class BottomFab extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const BottomFab({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
    ).alignment(AlignmentDirectional.bottomEnd).padding(all: theme.grid * 2);
  }
}

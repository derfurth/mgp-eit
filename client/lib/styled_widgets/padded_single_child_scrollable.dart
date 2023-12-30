import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:provider/provider.dart';

class PaddedSingleChildScrollable extends StatefulWidget {
  final Widget child;

  const PaddedSingleChildScrollable({
    super.key,
    required this.child,
  });

  @override
  State<PaddedSingleChildScrollable> createState() =>
      _PaddedSingleChildScrollableState();
}

class _PaddedSingleChildScrollableState
    extends State<PaddedSingleChildScrollable> {
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
    final AppTheme theme = context.watch();

    return Scrollbar(
      thumbVisibility: kIsWeb,
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: EdgeInsets.all(theme.grid * 2),
          child: widget.child,
        ),
      ),
    );
  }
}

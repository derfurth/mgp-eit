import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TestScaffold extends StatelessWidget {
  final Widget? child;
  final List<SingleChildWidget> providers;

  const TestScaffold({super.key, this.child, required this.providers});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: appTheme),
          ...providers,
        ],
        child: Scaffold(
          body: child,
        ),
      ),
    );
  }
}

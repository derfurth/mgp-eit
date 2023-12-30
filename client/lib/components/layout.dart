import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sized_context/sized_context.dart';

import '../app_size.dart';
import '../app_theme.dart';
import '../styled_widgets/leading.dart';
import 'navigation.dart';

/// Our main app layout
///
/// Uses [Navigation] as a default for  [navigation].
class Layout extends StatelessWidget {
  final Widget body;
  final Widget? navigation;

  const Layout({
    required this.body,
    this.navigation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: SizedBox.expand(
        child: Row(
          children: [
            SizedBox(
              width: appSize(context.widthPx) == AppSize.large
                  ? theme.grid * 25
                  : theme.grid * 20,
              child: navigation ?? const Navigation(),
            ),
            Expanded(
              child: ColoredBox(
                color: theme.accent1,
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Widget header;
  final Widget child;

  const Body({
    super.key,
    required this.header,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: SizedBox(
          width: theme.grid * 120,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appSize(context.widthPx) == AppSize.large
                  ? theme.grid * 4
                  : theme.grid * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Leading.vMedium(),
                header,
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.surface,
                      borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(theme.grid),
                      ),
                    ),
                    child: child,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

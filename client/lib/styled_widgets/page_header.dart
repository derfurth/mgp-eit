import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import 'heading.dart';

class PageHeader extends StatelessWidget {
  final List<Widget>? tabs;
  final String title;

  const PageHeader({super.key, this.tabs, required this.title});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: theme.grid * 4,
            right: theme.grid,
          ),
          child: Heading.h3(title),
        ),
        SizedBox(
          height: theme.grid * 5,
          child: tabs == null
              ? null
              : TabBar(
                  labelColor: theme.txt,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.black87),
                  ),
                  tabs: tabs!,
                ),
        ),
      ],
    );
  }
}

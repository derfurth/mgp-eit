import 'package:flutter/material.dart';

class MissingWidget extends StatelessWidget {
  final Widget title;
  final double fallbackHeight;

  const MissingWidget({
    super.key,
    required this.title,
    this.fallbackHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Placeholder(fallbackHeight: fallbackHeight),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall ?? const TextStyle(),
          child: title,
        ),
      ],
    );
  }
}

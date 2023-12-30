import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Provides various headers through factory constructors.
class Heading extends StatelessWidget {
  final String title;
  final TitleStyle style;

  const Heading(
    this.title,
    this.style, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    late final TextStyle? textStyle;

    switch (style) {
      case TitleStyle.h1:
        textStyle = textTheme.displayLarge;
        break;
      case TitleStyle.h2:
        textStyle = textTheme.displayMedium;
        break;
      case TitleStyle.h3:
        textStyle = textTheme.displaySmall;
        break;
      case TitleStyle.h4:
        textStyle = textTheme.headlineMedium;
        break;
      case TitleStyle.h5:
        textStyle = textTheme.headlineSmall;
        break;
      case TitleStyle.h6:
        textStyle = textTheme.titleLarge;
        break;
      case TitleStyle.page:
        textStyle = textTheme.displaySmall;
        break;
      case TitleStyle.section:
        textStyle = textTheme.titleLarge;
        break;
    }

    return kIsWeb
        ? SelectableText(title, style: textStyle)
        : Text(title, style: textStyle);
  }

  factory Heading.h1(String title) => Heading(title, TitleStyle.h1);
  factory Heading.h2(String title) => Heading(title, TitleStyle.h2);
  factory Heading.h3(String title) => Heading(title, TitleStyle.h3);
  factory Heading.h4(String title) => Heading(title, TitleStyle.h4);
  factory Heading.h5(String title) => Heading(title, TitleStyle.h5);
  factory Heading.h6(String title) => Heading(title, TitleStyle.h6);
  factory Heading.page(String title) => Heading(title, TitleStyle.page);
  factory Heading.section(String title) => Heading(title, TitleStyle.section);
}

enum TitleStyle {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  page,
  section,
}

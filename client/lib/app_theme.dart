import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/color_utils.dart';

enum ThemeFlavor {
  admin,
  atelier,
  synergies,
  flux,
  entreprise,
}

/// Provide colors and build ThemeData.
class AppTheme extends ChangeNotifier {
  // Our palette colors
  final Color _admin = const Color.fromRGBO(113, 0, 161, 1);
  final Color _a = const Color.fromRGBO(29, 186, 137, 1);
  final Color _b = const Color.fromRGBO(33, 146, 218, 1);

  // Our actual theme color, made from flavor and palette
  Color get accent1 {
    switch (flavor) {
      case ThemeFlavor.admin:
        return _admin;
      case ThemeFlavor.atelier:
        return _a;
      case ThemeFlavor.flux:
        return Color.alphaBlend(_a.withOpacity(.75), _b);
      case ThemeFlavor.synergies:
        return Color.alphaBlend(_a.withOpacity(.25), _b);
      case ThemeFlavor.entreprise:
        return _b;
    }
  }

  Color get accent2 {
    switch (flavor) {
      case ThemeFlavor.admin:
        return _b;
      case ThemeFlavor.atelier:
        return _b;
      case ThemeFlavor.flux:
        return Color.alphaBlend(_b.withOpacity(.75), _a);
      case ThemeFlavor.synergies:
        return Color.alphaBlend(_b.withOpacity(.25), _a);
      case ThemeFlavor.entreprise:
        return _a;
    }
  }

  // Flavor
  ThemeFlavor _flavor = ThemeFlavor.atelier;

  set flavor(ThemeFlavor flavor) {
    if (_flavor == flavor) return;
    _flavor = flavor;
    Future.delayed(const Duration(milliseconds: 200), notifyListeners);
  }

  ThemeFlavor get flavor => _flavor;

  // Color that don't change.
  final Color background = Colors.white;
  final Color surface = Colors.white;
  final Color error = const Color.fromRGBO(218, 63, 33, 1);
  final Color txt = Colors.black;
  final Color accentTxt = Colors.white;
  final double grid = 8.0;

  TextStyle get displayTextStyle => GoogleFonts.literata(
        fontWeight: FontWeight.bold,
        color: txt.withOpacity(.7),
      );

  TextStyle get navigationTextStyle => GoogleFonts.literata(
        fontWeight: FontWeight.bold,
        color: txt.withOpacity(.7),
      );

  ThemeData get themeData {
    final textTheme = GoogleFonts.robotoTextTheme().copyWith(
      displayLarge: GoogleFonts.roboto(fontWeight: FontWeight.bold),
      displayMedium: displayTextStyle,
      displaySmall: displayTextStyle,
      headlineMedium: displayTextStyle,
      headlineSmall: displayTextStyle,
    );

    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: accent1,
      secondary: accent2,
      background: background,
      surface: surface,
      onBackground: txt,
      onSurface: txt,
      onError: txt,
      onPrimary: accentTxt,
      onSecondary: accentTxt,
      error: error,
    );

    return ThemeData.from(
      textTheme: textTheme,
      colorScheme: colorScheme,
    ).copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      dividerColor: Colors.black87,
      indicatorColor: Colors.black87,
    );
  }

  Color shift(Color c, double d) => ColorUtils.shiftHsl(c, d);
}

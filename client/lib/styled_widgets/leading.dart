import 'package:flutter/material.dart';
import 'package:mgp_client/app_theme.dart';
import 'package:provider/provider.dart';

/// Leading provides vertical and horizontal spacer
class Leading extends StatelessWidget {
  final Axis direction;
  final double? grid;
  final double size;

  const Leading({
    this.direction = Axis.vertical,
    this.size = 2,
    this.grid,
    super.key,
  });

  factory Leading.vHair() => const Leading(size: 1);
  factory Leading.vSmall() => const Leading(size: 2);
  factory Leading.vMedium() => const Leading(size: 4);
  factory Leading.vLarge() => const Leading(size: 8);

  factory Leading.hHair() => const Leading(direction: Axis.horizontal, size: 1);
  factory Leading.hSmall() =>
      const Leading(direction: Axis.horizontal, size: 2);
  factory Leading.hMedium() =>
      const Leading(direction: Axis.horizontal, size: 4);
  factory Leading.hLarge() =>
      const Leading(direction: Axis.horizontal, size: 8);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();

    final dp = (grid ?? theme.grid) * size;
    return direction == Axis.vertical
        ? SizedBox(height: dp)
        : SizedBox(width: dp);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

typedef Places = List<Place>;

class Place {
  /// used in [routes]
  final String path;

  /// used in [DemoPage] nav drawer
  final IconData? iconData;

  /// [routes] wraps the resulting widget in a MaterialPage.
  final Widget Function(RouteData info) builder;

  Place({
    required this.path,
    required this.builder,
    this.iconData,
  });
}

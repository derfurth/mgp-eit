import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/commands/commands.dart';
import 'package:mgp_client/pages/unknown_page.dart';
import 'package:routemaster/routemaster.dart';

import 'places.dart';
import 'places_demos.dart';

/// The global router.
final routeMaster = RoutemasterDelegate(
  transitionDelegate: NoAnimationTransitionDelegate(),
  routesBuilder: (context) => routes,
);

final routes = RouteMap(
  onUnknownRoute: (path) {
    return MaterialPage(
      child: UnknownPage(path: path),
    );
  },
  routes: {
    if (kDebugMode)
      for (final demo in demos)
        demo.path: (info) => MaterialPage(child: demo.builder(info)),
    for (final place in places)
      place.path: (info) => MaterialPage(
            child: Builder(
              builder: (context) {
                logMessage(
                  'building place: "${place.path}" '
                  'path: "${info.fullPath}" '
                  'replacement: "${info.isReplacement}"',
                );
                setContext(context);
                return place.builder(info);
              },
            ),
          )
  },
);

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord>
        locationToExitingPageRoute,
    Map<RouteTransitionRecord?, List<RouteTransitionRecord>>?
        pageRouteToPagelessRoutes,
  }) {
    final results = <RouteTransitionRecord>[];

    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);
    }

    for (final exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final pagelessRoutes = pageRouteToPagelessRoutes![exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }

      results.add(exitingPageRoute);
    }
    return results;
  }
}

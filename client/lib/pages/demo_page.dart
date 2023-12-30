import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:mgp_client/chauffeur/places_demos.dart';
import 'package:mgp_client/components/layout.dart';
import 'package:routemaster/routemaster.dart';

class DemoPage extends StatelessWidget {
  final List<Widget> children;

  const DemoPage({
    super.key,
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Layout(
      navigation: const DemoNavigation(),
      body: Scrollbar(
        thumbVisibility: kIsWeb,
        child: ListView(
          children: children
              .map(
                (child) => Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 700,
                    child: child,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class DemoNavigation extends StatelessWidget {
  const DemoNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = appSize(context.widthPx);

    return ListView(
      children: [
        const DrawerHeader(
          child: Text('Test menu'),
        ),
        ...demos.map(
          (place) => ListTile(
            leading: Icon(place.iconData),
            title: Text(place.path),
            onTap: () {
              logMessage('Navigating to ${place.path}');
              Routemaster.of(context).push(place.path);
            },
          ),
        ),
      ],
    );
  }
}

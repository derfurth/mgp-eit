import 'package:flutter/material.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:provider/provider.dart';

import '../blones/app_blone.dart';

BuildContext? _mainContext;
late AppBlone _appBlone;

/// Someone needs to call this so our Commands can access models and services. Usually main_view.dart
void setContext(BuildContext c) {
  logMessage('setting context $c');
  _mainContext = c;
}

void setAppBlone(AppBlone meu) {
  _appBlone = meu;
}

class AppCommand {
  /// Provide quick lookups for the main Models and Services in the App.
  T getProvided<T>() {
    assert(
      _mainContext != null,
      "You must call setContext(BuildContext) method before calling Commands.",
    );
    return mainContext.read<T>();
  }

  BuildContext get mainContext => _mainContext!;
  AppBlone get meu => _appBlone;
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mgp_client/blones/app_blone.dart';
import 'package:mgp_client/commands/show_message_command.dart';
import 'package:mgp_client/main.dart';
import 'package:mgp_client/supabase/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final client = SupabaseClient(
      supabaseUrl,
      supabaseAnnonKey,
    );
    final app = AppBlone(
      supabaseClient: client,
      showMessage: ShowMessageCommand().execute,
    );
    await tester.pumpWidget(MainApp(app));

    // Verify that our home screen shows the app name.
    expect(find.text('EDGAR'), findsOneWidget);
  });
}

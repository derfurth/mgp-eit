import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

import '../models/authentication.dart';
import '../models/ui_message.dart';
import 'app_blone.dart';
import 'blone.dart';

abstract class AuthBlone extends ChangeNotifier with ChildBlone<AppBlone> {
  User _user = User.disconnected();

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  User get user => _user;

  Future<bool> signInWithPassword(String email, String password);

  Future<bool> signUpWithPassword(String email, String password);

  Future<bool> signOut();

  bool get isAdministrateur => user.maybeMap(
        connected: (user) => user.isAdministrateur,
        orElse: () => false,
      );
}

class SupabaseAuthBlone extends AuthBlone {
  SupabaseClient get client => parent.supabaseClient;

  @override
  Future<bool> signInWithPassword(String email, String password) async {
    try {
      final response = await client.auth
          .signInWithPassword(email: email, password: password);
      parent.showMessage(const UIMessage.auth('Vous êtes connecté'));
      restoreSession(response.session);
      logMessage('connected as "${response.user?.id}"');
      return true;
    } on AuthException catch (_) {
      user = User.disconnected();
      parent.showMessage(const UIMessage.auth("Erreur d'authentification"));
      return false;
    }
  }

  @override
  Future<bool> signUpWithPassword(String email, String password) async {
    try {
      final response =
          await client.auth.signUp(email: email, password: password);
      restoreSession(response.session);
      parent.showMessage(const UIMessage.auth('Vous êtes connecté'));
      logMessage('connected as "${response.user?.id}"');
      return true;
    } on AuthException catch (_) {
      user = User.disconnected();
      parent.showMessage(const UIMessage.auth("Erreur d'authentification"));
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    await client.auth.signOut();
    user = User.disconnected();
    parent.showMessage(const UIMessage.auth('Vous êtes déconnecté'));
    return true;
  }

  @override
  Future<void> mount() async {
    final session = client.auth.currentSession;
    restoreSession(session);
    client.auth.onAuthStateChange.listen(handleStateChange);
  }

  void handleStateChange(AuthState state) {
    restoreSession(state.session);
  }

  void restoreSession(Session? session) async {
    if (session == null) {
      user = User.disconnected();
      return;
    }
    final supabaseUser = session.user;
    user = User.connected(
      email: supabaseUser.email ?? '',
      isAdministrateur: await _isAdministrateur(),
      animateurIds: await _myAnimateurIds(),
      coAnimateurIds: await _myCoAnimateurIds(),
    );
    logMessage(user.toString());
  }

  Future<Iterable<String>> _myAnimateurIds() async {
    final data = await client.rpc('my_animateur_ids');
    return [for (var id in data) id.toString()];
  }

  Future<Iterable<String>> _myCoAnimateurIds() async {
    final data = await client.rpc('my_co_animateur_ids');
    return [for (var id in data) id.toString()];
  }

  Future<bool> _isAdministrateur() async {
    final data = await client.rpc('is_administrateur');
    return data as bool;
  }
}

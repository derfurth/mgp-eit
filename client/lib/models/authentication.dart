import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication.freezed.dart';

/// Current user
@freezed
class User with _$User {
  factory User.connected({
    required bool isAdministrateur,
    required bool isSuperAdministrateur,
    required String email,
    required Iterable<String> animateurIds,
    required Iterable<String> coAnimateurIds,
  }) = Connected;
  factory User.disconnected() = Disconnected;
  factory User.connecting() = Connecting;
  factory User.unknown() = Unknown;
}

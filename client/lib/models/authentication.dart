import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication.freezed.dart';

/// Current user
@freezed
class User with _$User {
  factory User.connected({
    required bool isAdministrateur,
    required String email,
    required Iterable<String> animateurIds,
    required Iterable<String> coAnimateurIds,
  }) = Connected;
  factory User.disconnected() = Disconnected;
  factory User.connecting() = Connecting;
  factory User.unknown() = Unknown;
}

/// Une invitation à une démarche pour un animateur ou un co-animateur.
@freezed
class Invitation with _$Invitation {
  factory Invitation.animateur({
    required String animateurId,
    required String demarcheId,
  }) = Animateur;

  factory Invitation.coAnimateur({
    required String coAnimateurId,
    required String demarcheId,
  }) = CoAnimateur;
}

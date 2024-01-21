sealed class Invitation {}

sealed class DemarcheInvitation extends Invitation {
  late final String demarcheId;
}

class AnimateurInvitation extends DemarcheInvitation {
  late final String animateurId;
}

class CoAnimateurInvitation extends DemarcheInvitation {
  late final String coAnimateurId;
}

class AdministrateurInvitation extends Invitation {
  late final String administrateurId;
}

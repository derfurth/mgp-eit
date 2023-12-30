-------------------------------------------------
------------------- Objects ---------------------
-------------------------------------------------
create type flux_direction as enum ('entrant', 'sortant');
create type flux_nature as enum ('continu', 'ponctuel');
create type synergie_statut as enum ('identifiee', 'en_cours', 'active', 'abandonnee');
create type synergie_type as enum ('mutualisation', 'substitution', 'nouvelle', 'achat', 'cooperation');

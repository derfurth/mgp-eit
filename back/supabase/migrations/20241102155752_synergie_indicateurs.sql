alter table synergie
    add column reduction_totale_de_la_consommation_matiere int not null default 0;
comment on column synergie.reduction_totale_de_la_consommation_matiere is 'Réduction totale de la consommation matière';

alter table synergie
    add column reduction_de_la_consommation_matiere_hors_inerte int not null default 0;
comment on column synergie.reduction_de_la_consommation_matiere_hors_inerte is 'Réduction de la consommation matière hors inerte';

alter table synergie
    add column reduction_totale_des_dechets int not null default 0;
comment on column synergie.reduction_totale_des_dechets is 'Réduction totale des déchets';

alter table synergie
    add column reduction_des_dechets_non_inertes int not null default 0;
comment on column synergie.reduction_des_dechets_non_inertes is 'Réduction des déchets non inertes';

alter table synergie
    add column amelioration_de_la_valorisation_des_dechets int not null default 0;
comment on column synergie.amelioration_de_la_valorisation_des_dechets is 'Amélioration de la valorisation des déchets';

alter table synergie
    add column reduction_des_consommations_d_energie int not null default 0;
comment on column synergie.reduction_des_consommations_d_energie is 'Réduction des consommations d’énergie';

alter table synergie
    add column production_d_energie_renouvelable int not null default 0;
comment on column synergie.production_d_energie_renouvelable is 'Production d’énergie renouvelable';

alter table synergie
    add column reduction_des_consommations_d_eau int not null default 0;
comment on column synergie.reduction_des_consommations_d_eau is 'Réduction des consommations d’eau';

alter table synergie
    add column reduction_des_emissions_de_ges int not null default 0;
comment on column synergie.reduction_des_emissions_de_ges is 'Réduction des émissions de GES';

alter table synergie
    add column realisation_d_economies_financieres int not null default 0;
comment on column synergie.realisation_d_economies_financieres is 'Réalisation d’économies financières';

alter table synergie
    add column chiffre_d_affaires_genere int not null default 0;
comment on column synergie.chiffre_d_affaires_genere is 'Chiffre d''affaires généré';

alter table synergie
    add column investissements_realises int not null default 0;
comment on column synergie.investissements_realises is 'Investissements réalisés';

alter table synergie
    add column developpement_de_nouvelles_activites_et_entreprises int not null default 0;
comment on column synergie.developpement_de_nouvelles_activites_et_entreprises is 'Développement de nouvelles activités et entreprises';

alter table synergie
    add column creation_d_emplois int not null default 0;
comment on column synergie.creation_d_emplois is 'Création d''emplois';

alter table synergie
    add column maintien_de_l_emploi int not null default 0;
comment on column synergie.maintien_de_l_emploi is 'Maintien de l''emploi';
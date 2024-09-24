drop table if exists lien_fiche;

create table lien_fiche
(
    id               uuid generated always as (md5(fiche_a_id::text || fiche_b_id::text)::uuid) stored,
    demarche_id      uuid              not null references demarche on delete cascade,
    atelier_id       uuid              not null references atelier on delete cascade,
    nature           text              not null,


    fiche_a_id       uuid              not null references fiche (id) on delete cascade,
    contact_a_id     uuid              not null references contact (id) on delete cascade,
    flux_direction_a flux_direction    not null,
    quantite_a       numeric default 0 not null,

    fiche_b_id       uuid              not null references fiche (id) on delete cascade,
    contact_b_id     uuid              not null references contact (id) on delete cascade,
    flux_direction_b flux_direction    not null,
    quantite_b       numeric default 0 not null,

    unique (fiche_a_id, fiche_b_id)
);
comment on table lien_fiche is
    'Le lien entre deux fiches, permet de lier des besoins et des demandes complémentaires.';


--- Administrateurs
create policy "Enable all for administrateurs"
    on lien_fiche
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on lien_fiche
    for all
    using (is_animateur_of(lien_fiche.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on lien_fiche
    for all
    using (is_co_animateur_of_demarche(lien_fiche.demarche_id));
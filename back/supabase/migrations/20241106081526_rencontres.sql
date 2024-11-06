create table atelier_rencontres
(
    atelier_id               uuid   not null,
    demarche_id              uuid   not null,
    excluded_participant_ids uuid[] not null,

    -- schedule configuration
    turn_count               int    not null default 10,
    table_count              int    not null default 10,
    table_seat_count         int    not null default 2,

    unique (atelier_id, demarche_id)
);

alter table atelier_rencontres
    enable row level security;

create policy "Enable all for administrateurs"
    on atelier_rencontres
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on atelier_rencontres
    for all
    using (is_animateur_of(atelier_rencontres.demarche_id));
--- Co-animateurs
create policy "Enable all for co-animateurs of demarche"
    on atelier_rencontres
    for all
    using (is_co_animateur_of_demarche(atelier_rencontres.demarche_id));

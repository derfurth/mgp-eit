create table synergie
(
    id               uuid primary key,
    created_at       timestamp       default now()           not null,
    modified_at      timestamp       default now()           not null,

    demarche_id      uuid references demarche                not null,
    nom              text            default ''              not null,
    date_ms          bigint          default 0               not null,
    statut           synergie_statut default 'identifiee'    not null,
    type             synergie_type   default 'mutualisation' not null,
    flux_ids         uuid[]                                  not null,

    commentaire      text            default ''              not null,
    commentaire_date timestamp       default now()
);

create trigger set_modified_at_before_synergie_update
    before update
    on
        synergie
    for each row
execute procedure update_modified_at();

create trigger set_modified_at_before_synergie_insert
    before insert
    on
        synergie
    for each row
execute procedure update_modified_at();

create trigger set_created_at_before_synergie_insert
    before insert
    on
        synergie
    for each row
execute procedure initialize_created_at();

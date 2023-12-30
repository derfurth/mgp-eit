create table atelier
(
    id               uuid not null,
    created_at       timestamp default now(),
    demarche_id      uuid,
    animateur_ids    uuid[],
    co_animateur_ids uuid[],
    lieu             text      default '',
    organisateur     text      default '',
    date_ms          bigint    default 0,

    primary key (id)
);

create table participant_meta
(
    created_at     timestamp default now(),
    modified_at    timestamp default now(),
    atelier_id     uuid references atelier on delete cascade,
    contact_id     uuid references contact,
    demarche_id    uuid references demarche,
    thematique_ids text[],
    champ_libre    text      default '',

    primary key (atelier_id, contact_id)
);

create trigger set_modified_at_before_meta_update
    before update
    on
        participant_meta
    for each row
execute procedure update_modified_at();

create table flux
(
    id                    uuid   not null,
    created_at            timestamp      default now(),
    modified_at           timestamp      default now(),

    -- Resources fields
    resource_nom          text           default '',
    resource_description  text           default '',
    resource_code_synapse text           default '',

    -- Flux
    demarche_id           uuid references demarche,
    contact_id            uuid references contact,
    atelier_id            uuid references atelier,

    designation           text           default '',
    commentaire           text           default '',

    quantite              numeric        default 0,
    duree_ms              numeric        default 0,

    unite                 text           default '',
    direction             flux_direction default 'entrant',
    nature                flux_nature    default 'continu',

    etablissement_id      uuid references etablissement,

    thematique_ids        text[] not null,
    animateur_ids         uuid[] not null,
    co_animateur_ids      uuid[] not null,

    primary key (id)
);

create trigger set_modified_at_before_flux_update
    before update
    on
        flux
    for each row
execute procedure update_modified_at();


create table fiche
(
    id             uuid   not null,
    created_at     timestamp default now(),
    modified_at    timestamp default now(),
    atelier_id     uuid references atelier,
    contact_id     uuid references contact,
    demarche_id    uuid references demarche,
    flux_id        uuid references flux,
    designation    text      default '',
    commentaire    text      default '',
    thematique_ids text[] not null,

    primary key (id)
);

create trigger set_modified_at_before_fiche_update
    before update
    on
        fiche
    for each row
execute procedure update_modified_at();


create or replace function
    fiche_contact_snippet(
    fiche_id uuid,
    out contact contact,
    out personne personne,
    out entreprise record
)
as
$$
select c as contact, p as personne, entreprise_snippet(entr.id)
from fiche f
         join contact c on f.contact_id = c.id
         join personne p on c.personne_id = p.id
         join etablissement etab on c.etablissement_id = etab.id
         join entreprise entr on etab.entreprise_id = entr.id
where f.id = fiche_id
group by c.id, p.id, entr.id;
$$ language sql stable;
comment on function fiche_contact_snippet is
    'Returns contact snippets of a given fiche id.';


create or replace function
    fiche_snippet(
    fiche_id uuid,
    out fiche fiche,
    out contact record,
    out flux flux
)
as
$$
select f                                     as fiche,
       fiche_contact_snippet(fiche_id::uuid) as contact,
       x                                     as flux
from fiche f
         join flux x on f.flux_id = x.id
where f.id = fiche_id
$$ language sql stable;
comment on function fiche_snippet is
    'Returns fiche snippet of a given fiche id.';



create or replace function
    is_co_animateur_of(atelier_id uuid)
    returns boolean
as
$$
select count(*) > 0
from atelier
         join my_co_animateur_ids() ids on array [ids] && atelier.co_animateur_ids
where atelier.id = atelier_id;
$$ language sql;


create or replace function
    atelier_snippet(
    atelier_id uuid,
    out atelier atelier,
    out participants record[],
    out animateurs record[],
    out co_animateurs record[]
)
as
$$
select p       as atelier,
       c.list  as participants,
       a.list  as animateurs,
       co.list as co_animateurs
from atelier p
         join lateral ( select coalesce(array_agg(contact_snippet(id)), '{}') as list
                        from contact
                        where id in (select contact_id from participant_meta where participant_meta.atelier_id = p.id) ) c on true
         join lateral ( select coalesce(array_agg(animateur_snippet(id)), '{}') as list
                        from animateur
                        where id = any (p.animateur_ids) ) a on true
         join lateral ( select coalesce(array_agg(co_animateur_snippet(id)), '{}') as list
                        from co_animateur
                        where id = any (p.co_animateur_ids) ) co on true
where p.id = atelier_id;
$$ language sql stable;
comment on function atelier_snippet is
    'Returns atelier snippet of a given atelier id.';

create or replace function
    flux_snippet(
    flux_id uuid,
    out flux flux,
    out contact record,
    out animateurs record[],
    out co_animateurs record[]
)
as
$$
select x                             as flux,
       contact_snippet(x.contact_id) as contact,
       coalesce(a.list, '{}')        as animateurs,
       coalesce(co.list, '{}')       as co_animateurs
from flux x
         join lateral (
    select array_agg(animateur_snippet(n)) as list
    from unnest(x.animateur_ids) as n
    ) as a on true

         join lateral (
    select array_agg(co_animateur_snippet(n)) as list
    from unnest(x.co_animateur_ids) as n
    ) as co on true

where x.id = flux_id
$$ language sql stable;
comment on function flux_snippet is
    'Returns flux snippet of a given fiche id.';




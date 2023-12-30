create table demarche
(
    id           uuid primary key,
    created_at   timestamp default now(),
    denomination text      default '',
    champ_libre  text      default ''
);

-- Roles
create table if not exists administrateur
(
    id          uuid not null,
    created_at  timestamp default now(),
    user_id     uuid references auth.users,
    personne_id uuid references personne,

    primary key (id)
);

create table if not exists animateur
(
    id          uuid not null,
    created_at  timestamp default now(),
    user_id     uuid references auth.users,
    personne_id uuid references personne,
    demarche_id uuid references demarche,

    primary key (id)
);

create table if not exists co_animateur
(
    id          uuid not null,
    created_at  timestamp default now(),
    user_id     uuid references auth.users,
    personne_id uuid references personne,
    demarche_id uuid references demarche,

    primary key (id)
);


-- RPC
create or replace function
    my_animateur_ids()
    returns setof uuid
as
$$
select id
from animateur
where animateur.user_id = auth.uid()
$$ language sql security definer;
comment on function my_animateur_ids is
    'Returns current user animateur ids if any.';

create or replace function
    my_co_animateur_ids()
    returns uuid[]
as
$$
select coalesce( array_agg(id), '{}')
from co_animateur
where co_animateur.user_id = auth.uid()
$$ language sql security definer;
comment on function my_co_animateur_ids is
    'Returns current user co-animateur ids if any.';


create or replace function
    is_animateur_of(demarche_id uuid)
    returns boolean
as
$$
select count(*) > 0
from animateur
where animateur.user_id = auth.uid()
  and animateur.demarche_id = is_animateur_of.demarche_id
$$ language sql security definer;


create or replace function
    is_co_animateur_of_demarche(demarche_id uuid)
    returns boolean
as
$$
select count(*) > 0
from co_animateur
where co_animateur.user_id = auth.uid()
  and co_animateur.demarche_id = is_co_animateur_of_demarche.demarche_id
$$ language sql;

-- animateurs
create or replace function
    animateurs(demarche_id uuid)
    returns setof animateur
as
$$
select animateur
from animateur
where animateur.demarche_id = animateurs.demarche_id;
$$ language sql;
comment on function animateurs is
    'Returns animateur list of a given demarche id';

create or replace function
    animateur_snippet(
    animateur_id uuid,
    out animateur animateur,
    out personne personne
)
as
$$
select a as animateur, p as personne
from animateur a
         join personne p on a.personne_id = p.id
where a.id = animateur_id;
$$ language sql stable;
comment on function animateur_snippet is
    'Returns animateur snippet of a given animateur id.';

create or replace function
    animateur_snippets(demarche_id uuid)
    returns table
            (
                animateur animateur,
                personne  personne
            )
as
$$
select animateur_snippet(co.id)
from animateurs(demarche_id) co;
$$ language sql stable;
comment on function animateur_snippets is
    'Returns animateur snippets of a given demarche id.';


-- co animateurs
create or replace function
    co_animateurs(demarche_id uuid)
    returns setof co_animateur
as
$$
select co_animateur
from co_animateur
where co_animateur.demarche_id = co_animateurs.demarche_id;

$$ language sql;
comment on function co_animateurs is
    'Returns co-animateur list of a given demarche id';


create or replace function
    co_animateur_snippet(
    co_animateur_id uuid,
    out co_animateur co_animateur,
    out personne personne
)
as
$$
select co as co_animateur, p as personne
from co_animateur co
         join personne p on co.personne_id = p.id
where co.id = co_animateur_id;
$$ language sql stable;
comment on function co_animateur_snippet is
    'Returns co-animateur snippet of a given co-animateur id.';


create or replace function
    co_animateur_snippets(demarche_id uuid)
    returns table
            (
                co_animateur co_animateur,
                personne     personne
            )
as
$$
select co_animateur_snippet(co.id)
from co_animateurs(demarche_id) co;
$$ language sql stable;
comment on function co_animateur_snippets is
    'Returns animateur snippets of a given demarche id.';


-- my demarches
create or replace function
    my_demarches()
    returns setof demarche
as
$$
select demarche
from demarche
where is_administrateur() or is_animateur_of(id) or is_co_animateur_of_demarche(id);
$$ language sql;


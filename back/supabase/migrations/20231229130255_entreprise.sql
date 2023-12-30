create table entreprise
(
    id           uuid not null,
    created_at   timestamp default now(),
    demarche_id  uuid references demarche,
    siren        text      default '',
    denomination text      default '',
    commentaire  text      default '',

    primary key (id)
);


create table etablissement
(
    id             uuid not null,
    created_at     timestamp default now(),
    demarche_id    uuid references demarche,
    entreprise_id  uuid references entreprise,
    siret          text      default '',
    adresse_ligne1 text      default '',
    adresse_ligne2 text      default '',
    code_postal    text      default '',
    ville          text      default '',
    cedex          text      default '',

    primary key (id)
);


create table contact
(
    id               uuid not null,
    created_at       timestamp default now(),
    demarche_id      uuid references demarche,
    personne_id      uuid references personne,
    etablissement_id uuid references etablissement,

    primary key (id)
);


create or replace function
    entreprise_snippet(entreprise_id uuid, out entreprise entreprise, out etablissements etablissement[])
as
$$
select entr as entreprise, array_agg(etab) as etablissement
from entreprise as entr
         join etablissement etab on entr.id = etab.entreprise_id
where entr.id = entreprise_snippet.entreprise_id
group by entr.id;
$$ language sql stable;
comment on function entreprise_snippet is
    'Returns the entreprise snippet of a given entreprise id.';


create or replace function
    entreprise_snippets(demarche_id uuid)
    returns table
            (
                entreprise     entreprise,
                etablissements etablissement[]
            )
as
$$
select entr as entreprise, array_agg(etab) as etablissement
from entreprise as entr
         join etablissement etab on entr.id = etab.entreprise_id
where entr.demarche_id = entreprise_snippets.demarche_id
group by entr.id;
$$ language sql stable;
comment on function entreprise_snippets is
    'Returns entreprise snippets of a given demarche id.';



create or replace function
    contact_snippet(
    contact_id uuid,
    out contact contact,
    out personne personne,
    out entreprise record
)
as
$$
select c as contact, p as personne, entreprise_snippet(entr.id)
from contact c
         join personne p on c.personne_id = p.id
         join etablissement etab on c.etablissement_id = etab.id
         join entreprise entr on etab.entreprise_id = entr.id
where c.id = contact_id
group by c.id, p.id, entr.id;
$$ language sql stable;
comment on function contact_snippet is
    'Contact snippet of a given contact id.';


create or replace function
    contact_snippets(demarche_id uuid)
    returns table
            (
                contact    contact,
                personne   personne,
                entreprise record
            )
as
$$
select c as contact, p as personne, entreprise_snippet(entr.id)
from contact c
         join personne p on c.personne_id = p.id
         join etablissement etab on c.etablissement_id = etab.id
         join entreprise entr on etab.entreprise_id = entr.id
where c.demarche_id = contact_snippets.demarche_id
group by c.id, p.id, entr.id;
$$ language sql stable;
comment on function contact_snippets is
    'Returns contact snippets of a given demarche id.';



create or replace function
    etablissement_contact_snippets(etablissement_id uuid)
    returns table
            (
                contact    contact,
                personne   personne,
                entreprise record
            )
as
$$
select c as contact, p as personne, entreprise_snippet(entr.id)
from contact c
         join personne p on c.personne_id = p.id
         join etablissement etab on c.etablissement_id = etab.id
         join entreprise entr on etab.entreprise_id = entr.id
where c.etablissement_id = etablissement_contact_snippets.etablissement_id
group by c.id, p.id, entr.id;
$$ language sql stable;
comment on function etablissement_contact_snippets is
    'Returns contact snippets of a given etablissement id.';


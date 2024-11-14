alter table entreprise
    add deleted bool default false not null;

create or replace function prevent_entreprise_delete()
    returns trigger as
$$
begin
    update entreprise set deleted = true where id = old.id;
    return null;
end;
$$ language plpgsql security invoker;

create trigger prevent_entreprise_deletion
    before delete
    on entreprise
    for each row
execute function prevent_entreprise_delete();

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
  and not entr.deleted
group by entr.id;
$$ language sql stable;


alter table contact
    add deleted bool default false not null;

create or replace function prevent_contact_delete()
    returns trigger as
$$
begin
    update contact set deleted = true where id = old.id;
    return null;
end;
$$ language plpgsql security invoker;

create trigger prevent_contact_deletion
    before delete
    on contact
    for each row
execute function prevent_contact_delete();


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
  and not c.deleted
group by c.id, p.id, entr.id;
$$ language sql stable;


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
  and not c.deleted
group by c.id, p.id, entr.id;
$$ language sql stable;
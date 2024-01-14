begin;

drop function atelier_snippet(uuid);
create function
    atelier_snippet(
    atelier_id uuid,
    out atelier atelier,
    out participants record[],
    out participants_with_fiche record[],
    out animateurs record[],
    out co_animateurs record[]
)
as
$$
select p       as atelier,
       c.list  as participants,
       cf.list as participants_with_fiche,
       a.list  as animateurs,
       co.list as co_animateurs
from atelier p
         join lateral ( select coalesce(array_agg(contact_snippet(contact.id)), '{}') as list
                        from contact
                        where contact.id in
                              (select contact_id from participant_meta where participant_meta.atelier_id = p.id) ) c
              on true
         join lateral ( select coalesce(array_agg(contact_snippet(contact.id)), '{}') as list
                        from contact
                        where contact.id in
                              (select f.contact_id
                               from participant_meta meta
                                        join fiche f
                                             on f.contact_id = meta.contact_id
                                                 and f.atelier_id = meta.atelier_id
                               where meta.atelier_id = p.id) ) cf
              on true
         join lateral ( select coalesce(array_agg(animateur_snippet(animateur.id)), '{}') as list
                        from animateur
                        where animateur.id = any (p.animateur_ids) ) a on true
         join lateral ( select coalesce(array_agg(co_animateur_snippet(co_animateur.id)), '{}') as list
                        from co_animateur
                        where co_animateur.id = any (p.co_animateur_ids) ) co on true
where p.id = atelier_id;
$$ language sql stable;

create or replace function
    on_participant_meta_delete()
    returns trigger
as
$$
begin
    if exists(select *
              from fiche f
              where f.atelier_id = old.atelier_id
                and f.contact_id = old.contact_id)
    then
        return null;
    else
        return old;
    end if;
end;
$$ language plpgsql;

create trigger participant_meta_delete
    before delete
    on participant_meta
    for each row
execute procedure on_participant_meta_delete();


create or replace function
    set_atelier_participants(demarche_id uuid, atelier_id uuid, new_participants uuid[])
    returns setof participant_meta
    language plpgsql
as
$$
declare

begin
    insert into participant_meta (demarche_id, atelier_id, contact_id)
    select set_atelier_participants.demarche_id,
           set_atelier_participants.atelier_id,
           participant_id
    from unnest(new_participants) as participant_id
    on conflict do nothing;

    delete
    from participant_meta pm
    where pm.atelier_id = set_atelier_participants.atelier_id
      and pm.demarche_id = set_atelier_participants.demarche_id
      --  pas dans la liste
      and not pm.contact_id = any (new_participants)
      -- et sans fiche
      and not exists(select *
                     from fiche f
                     where f.atelier_id = set_atelier_participants.atelier_id
                       and f.contact_id = any (new_participants));

    return query
        select *
        from participant_meta pm
        where pm.atelier_id = set_atelier_participants.atelier_id
          and pm.demarche_id = set_atelier_participants.demarche_id;
end
$$;

commit;

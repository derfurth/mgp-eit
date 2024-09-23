create or replace function
    atelier_snippet(
    atelier_id uuid,
    out atelier atelier,
    out participants record[],
    out participants_with_fiche record[],
    out animateurs record[],
    out co_animateurs record[]
)
    stable
    language sql
    security definer
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
$$;

create or replace function
    fiche_snippet(
    fiche_id uuid,
    out fiche fiche,
    out contact record,
    out flux flux
)
    stable
    language sql
    security definer
as
$$
select f                                     as fiche,
       fiche_contact_snippet(fiche_id::uuid) as contact,
       x                                     as flux
from fiche f
         join flux x on f.flux_id = x.id
where f.id = fiche_id
$$;

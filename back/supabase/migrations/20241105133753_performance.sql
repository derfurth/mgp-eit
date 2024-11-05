create or replace function
    atelier_fiche_snippets(atelier_id uuid)
    returns table
            (
                fiche   fiche,
                contact record,
                flux    flux
            )
    stable
    language sql
    security definer
as
$$
select f                           as fiche,
       fiche_contact_snippet(f.id) as contact,
       x                           as flux
from fiche f
         join flux x on f.flux_id = x.id
where f.atelier_id = atelier_fiche_snippets.atelier_id;
$$;

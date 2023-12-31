begin;

alter table demarche
    add deleted bool default false not null;

comment on column demarche.deleted is 'Vrai si la démarche est supprimée.';

create or replace function my_demarches() returns setof demarche
    language sql
as
$$
select demarche
from demarche
where not deleted
  and (is_administrateur()
    or is_animateur_of(id)
    or is_co_animateur_of_demarche(id));
$$;

alter table fiche
    drop constraint fiche_flux_id_fkey;

alter table fiche
    add foreign key (flux_id) references flux
        on delete cascade;

alter table fiche add column realtime_contact_filter text generated always as ( demarche_id::text || atelier_id::text || contact_id::text ) stored;
comment on column fiche.realtime_contact_filter is 'Permet de filtrer sur plusieurs critères pour afficher les évolutions des fiches d''un contact en temps réel.';

commit;

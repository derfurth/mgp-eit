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

commit;

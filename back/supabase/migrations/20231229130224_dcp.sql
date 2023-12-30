-- Une personne.
create table personne
(
    id          uuid primary key,
    created_at  timestamp default now() not null,
    demarche_id uuid not null,
    nom         text not null,
    prenom      text not null,
    email       text not null,
    telephone   text not null,
    limited     bool not null,
    deleted     bool not null
);



-------------------------------------------------
--------------------- Views ---------------------
-------------------------------------------------
create or replace view personne_physique
as
select id,
       created_at,
       case when deleted or limited then '' else nom end,
       case when deleted or limited then '' else prenom end,
       case when deleted or limited then '' else email end,
       case when deleted or limited then '' else telephone end,
       limited,
       deleted,
       demarche_id
from personne
where auth.role() = 'authenticated';


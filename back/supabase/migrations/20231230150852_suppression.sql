begin;

alter table demarche
    add deleted bool default false not null;

comment on column demarche.deleted is 'Vrai si la démarche est supprimée.';

commit;

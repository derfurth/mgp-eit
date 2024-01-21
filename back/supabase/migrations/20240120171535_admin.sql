begin;

create or replace function claim_administrateur(
    administrateur_id uuid
) returns json as
$$
declare
    invitee administrateur;
begin
    -- search for invitation and administrateur
    select *
    into invitee
    from administrateur
    where id = administrateur_id;

    if (invitee is null) then
        -- invitation non trouvée
        perform set_config('response.status', '404', true);
        return json_build_object('message', 'L''invitation n''existe pas.');
    elsif (invitee.user_id is not null) then
        -- invitation deja acceptée
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'L''invitation à déjà été acceptée.');
    elsif is_administrateur() then
        -- l'utilisateur à déjà un role
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'Vous ne pouvez pas accepter l''invitation car vous ête déjà administrateur.');
    else
        -- met à jour l'administrateur
        update administrateur
        set user_id = auth.uid()
        where id = invitee.id;
        return json_build_object('message', 'Vous êtes désormais administrateur.');
    end if;
end
$$ language plpgsql security definer;


create or replace function
    administrateur_snippet(
    administrateur_id uuid,
    out administrateur administrateur,
    out personne personne
)
as
$$
select a as administrateur, p as personne
from administrateur a
         join personne p on a.personne_id = p.id
where a.id = administrateur_id;
$$ language sql stable;
comment on function administrateur_snippet is
    'Returns administrateur snippet of a given administrateur id.';

create or replace function
    administrateur_snippets()
    returns table
            (
                administrateur administrateur,
                personne  personne
            )
as
$$
select administrateur_snippet(a.id)
from administrateur a;
$$ language sql stable;
comment on function administrateur_snippets is
    'Returns all administrateur snippets.';

alter table administrateur
    add is_super_admin bool default false not null;

alter table administrateur
    add nom text default '' not null;

alter table administrateur
    add prenom text default '' not null;

alter table administrateur
    drop column personne_id;


create or replace function is_super_administrateur() returns boolean
    security definer
    language plpgsql
as $$
begin
    return exists ((select * from administrateur where is_super_admin and user_id = auth.uid()));
end;
$$;

create or replace function is_administrateur() returns boolean
    security definer
    language plpgsql
as $$
begin
    return exists ((select * from administrateur where user_id = auth.uid()));
end;
$$;

create policy "Enable insert for super-administrateurs" on administrateur
    for insert
    with check (is_super_administrateur());

create policy "Enable update for super-administrateurs" on administrateur
    for update
    using (is_super_administrateur());

-- todo fix all policies
drop policy "Enable all for administrateurs" on animateur;
create policy "Enable all for administrateurs" on animateur
    for all
    using (is_administrateur());


commit;

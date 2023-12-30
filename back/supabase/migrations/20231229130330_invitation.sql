create or replace function claim_animateur(
    animateur_id uuid
) returns json as
$$
declare
    invitee animateur;
begin
    -- search for invitation and animateur
    select *
    into invitee
    from animateur
    where id = animateur_id;

    if (invitee is null) then
        -- invitation non trouvée
        perform set_config('response.status', '404', true);
        return json_build_object('message', 'L''invitation n''existe pas.');
    elsif (invitee.user_id is not null) then
        -- invitation deja acceptée
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'L''invitation à déjà été acceptée.');
    elsif (is_administrateur()
        or is_animateur_of(invitee.demarche_id)
        or is_co_animateur_of_demarche(invitee.demarche_id)) then
        -- l'utilisateur à déjà un role
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'Vous ne pouvez pas accepter l''invitation car vous avez déjà un role.');
    else
        -- met à jour l'animateur
        update animateur
        set user_id = auth.uid()
        where id = invitee.id;
        return json_build_object('message', 'Vous êtes désormais animateur de la démarche.');
    end if;
end
$$ language plpgsql security definer;


create or replace function claim_co_animateur(
    co_animateur_id uuid
) returns json as
$$
declare
    invitee co_animateur;
begin
    -- search for invitation and animateur
    select *
    into invitee
    from co_animateur
    where id = co_animateur_id;

    if (invitee is null) then
        -- invitation non trouvée
        perform set_config('response.status', '404', true);
        return json_build_object('message', 'L''invitation n''existe pas.');
    elsif (invitee.user_id is not null) then
        -- invitation deja acceptée
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'L''invitation à déjà été acceptée.');
    elsif (is_administrateur()
        or is_animateur_of(invitee.demarche_id)
        or is_co_animateur_of_demarche(invitee.demarche_id)) then
        -- l'utilisateur à déjà un role
        perform set_config('response.status', '403', true);
        return json_build_object('message', 'Vous ne pouvez pas accepter l''invitation car vous avez déjà un role.');
    else
        -- met à jour l'animateur
        update co_animateur
        set user_id = auth.uid()
        where id = invitee.id;
        return json_build_object('message', 'Vous êtes désormais co-animateur de la démarche.');
    end if;
end
$$ language plpgsql security definer;

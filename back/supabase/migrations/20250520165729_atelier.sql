create or replace function
    set_atelier_participants(demarche_id uuid, atelier_id uuid, new_participants uuid[])
    returns setof participant_meta
    language plpgsql
as
$$
begin
    -- fix: Only proceed with operations if new_participants is not empty
    if array_length(new_participants, 1) > 0 then
        -- Insert new participants
        insert into participant_meta (demarche_id, atelier_id, contact_id)
        select set_atelier_participants.demarche_id,
               set_atelier_participants.atelier_id,
               participant_id
        from unnest(new_participants) as participant_id
        on conflict do nothing;

        -- Delete participants not in the new list
        delete
        from participant_meta pm
        where pm.atelier_id = set_atelier_participants.atelier_id
          and pm.demarche_id = set_atelier_participants.demarche_id
          and not pm.contact_id = any (new_participants)
          and not exists(select *
                         from fiche f
                         where f.atelier_id = set_atelier_participants.atelier_id
                           and f.contact_id = pm.contact_id);
    end if;

    -- Return current participants regardless
    return query
        select *
        from participant_meta pm
        where pm.atelier_id = set_atelier_participants.atelier_id
          and pm.demarche_id = set_atelier_participants.demarche_id;
end
$$;

create or replace function
    update_atelier_with_participants(
    atelier_data jsonb,
    new_participants uuid[]
)
    returns json
    language plpgsql
as
$$
declare
    v_atelier_id  uuid;
    v_demarche_id uuid;
    result        json;
begin
    -- Extract IDs from atelier data
    v_atelier_id := (atelier_data ->> 'id')::uuid;
    v_demarche_id := (atelier_data ->> 'demarche_id')::uuid;

    -- Update atelier
    update atelier
    set demarche_id      = (atelier_data ->> 'demarche_id')::uuid,
        animateur_ids    = array(select jsonb_array_elements_text(atelier_data -> 'animateur_ids')::uuid),
        co_animateur_ids = array(select jsonb_array_elements_text(atelier_data -> 'co_animateur_ids')::uuid),
        lieu             = atelier_data ->> 'lieu',
        organisateur     = atelier_data ->> 'organisateur',
        date_ms          = (atelier_data ->> 'date_ms')::bigint
    where id = v_atelier_id
    returning to_json(atelier.*) into result;

    -- Only proceed with participant operations if new_participants is not empty
    if array_length(new_participants, 1) > 0 then
        -- Insert new participants
        insert into participant_meta (demarche_id, atelier_id, contact_id)
        select v_demarche_id,
               v_atelier_id,
               participant_id
        from unnest(new_participants) as participant_id
        on conflict do nothing;

        -- Delete participants not in the new list
        delete
        from participant_meta pm
        where pm.atelier_id = v_atelier_id
          and pm.demarche_id = v_demarche_id
          and not pm.contact_id = any (new_participants)
          and not exists(select *
                         from fiche f
                         where f.atelier_id = v_atelier_id
                           and f.contact_id = pm.contact_id);
    end if;

    return result;
end
$$;

create index if not exists idx_participant_meta_atelier_id
    on participant_meta (atelier_id);

create index if not exists idx_fiche_contact_id_atelier_id
    on fiche (contact_id, atelier_id);

create index if not exists idx_atelier_animateur_ids
    on atelier using gin (animateur_ids);

create index if not exists idx_atelier_co_animateur_ids
    on atelier using gin (co_animateur_ids);


create index if not exists idx_flux_animateur_ids on flux using gin (animateur_ids);
create index if not exists idx_flux_co_animateur_ids on flux using gin (co_animateur_ids);
create index if not exists idx_fiche_atelier_id_flux_id on fiche (atelier_id, flux_id);
create index idx_fiche_realtime_contact_filter on fiche (realtime_contact_filter);
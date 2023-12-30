begin;
-- password yolododo
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at,
                        confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at,
                        email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data,
                        raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at,
                        phone_change, phone_change_token, phone_change_sent_at, email_change_token_current,
                        email_change_confirm_status)
values ('00000000-0000-0000-0000-000000000000', 'f6bdc697-919b-43c9-8e8a-aa428f45f3f3', 'authenticated', 'authenticated',
        'yolo@dodo.com', '$2a$10$nN.4fqCEI0EAKaA6C2tWle6qKToQEAt15sIJVUp34nccv3f10u76q',
        '2021-12-03 10:17:09.205161 +00:00', null, '', null, '', null, '', '', null,
        '2021-12-03 10:17:09.209968 +00:00', '{"provider": "email", "providers": ["email"]}', '{}', false, '2021-12-03 10:17:09.201674 +00:00', '2021-12-03 10:17:09.201674 +00:00', null, null, '', '', null,
        '', 0);

insert into administrateur
values ('10000000-f389-4d4f-bfdb-b0c94a1bd0f9',
        default,
        'f6bdc697-919b-43c9-8e8a-aa428f45f3f3');


-- INSERT INTO dcp (user_id, email, prenom, nom) VALUES ('f6bdc697-919b-43c9-8e8a-aa428f45f3f3', 'yolo@dodo.com', 'Yolo', 'Dodo');
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('f6bdc697-919b-43c9-8e8a-aa428f45f3f3', 1, 'referent', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('f6bdc697-919b-43c9-8e8a-aa428f45f3f3', 2, 'agent', TRUE);

-- password yulududu
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at,
                        confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at,
                        email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data,
                        raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at,
                        phone_change, phone_change_token, phone_change_sent_at, email_change_token_current,
                        email_change_confirm_status)
values ('00000000-0000-0000-0000-000000000000', '298235a0-60e7-4ceb-9172-0a991cce0386', 'authenticated', 'authenticated',
        'yulu@dudu.com', '$2a$10$5I3JwT30cDaknKLs/S4lQuVr5vTZg..bFseNFcXXPIVLByu7rYiZi',
        '2021-12-03 10:17:09.295139 +00:00', null, '', null, '', null, '', '', null,
        '2021-12-03 10:17:09.297498 +00:00', '{"provider": "email", "providers": ["email"]}', '{}', false, '2021-12-03 10:17:09.293586 +00:00', '2021-12-03 10:17:09.293586 +00:00', null, null, '', '', null,
        '', 0);
insert into animateur
values ('20000000-f389-4d4f-bfdb-b0c94a1bd0f9',
        default,
        '298235a0-60e7-4ceb-9172-0a991cce0386');

-- INSERT INTO dcp (user_id, email, prenom, nom) VALUES ('298235a0-60e7-4ceb-9172-0a991cce0386', 'yulu@dudu.com', 'Yulu', 'Dudu');

-- password yilididi
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at,
                        confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at,
                        email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data,
                        raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at,
                        phone_change, phone_change_token, phone_change_sent_at, email_change_token_current,
                        email_change_confirm_status)
values ('00000000-0000-0000-0000-000000000000', '3f407fc6-3634-45ff-a988-301e9088096a', 'authenticated', 'authenticated',
        'yili@didi.com', '$2a$10$RknsukXyPKEVvq3CNLbeVe62nSS.p6CGx/qfKBm.HEj5CDgJ.F0vK',
        '2021-12-03 10:17:09.371201 +00:00', null, '', null, '', null, '', '', null,
        '2021-12-03 10:17:09.374051 +00:00', '{"provider": "email", "providers": ["email"]}', '{}', false, '2021-12-03 10:17:09.369858 +00:00', '2021-12-03 10:17:09.369858 +00:00', null, null, '', '', null,
        '', 0);
-- INSERT INTO dcp (user_id, email, prenom, nom) VALUES ('3f407fc6-3634-45ff-a988-301e9088096a', 'yili@didi.com', 'Yili', 'Didi');
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('3f407fc6-3634-45ff-a988-301e9088096a', 1, 'conseiller', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('3f407fc6-3634-45ff-a988-301e9088096a', 2, 'conseiller', TRUE);


--password yaladada
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at,
                        confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at,
                        email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data,
                        raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at,
                        phone_change, phone_change_token, phone_change_sent_at, email_change_token_current,
                        email_change_confirm_status)
values ('00000000-0000-0000-0000-000000000000', '4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 'authenticated', 'authenticated',
        'yala@dada.com', '$2a$10$cIlJzHtN3YbrJ4rZ5mxYNuedLL2P5/Wk28M21FD80e9.cuS3s4OUK',
        '2021-12-03 10:17:09.447445 +00:00', null, '', null, '', null, '', '', null,
        '2021-12-03 10:17:09.449560 +00:00', '{"provider": "email", "providers": ["email"]}', '{}', false, '2021-12-03 10:17:09.446043 +00:00', '2021-12-03 10:17:09.446043 +00:00', null, null, '', '', null,
        '', 0);
-- INSERT INTO dcp (user_id, email, prenom, nom) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 'yala@dada.com', 'Yala', 'Dada');
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 1, 'auditeur', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 2, 'auditeur', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 3, 'auditeur', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 4, 'auditeur', TRUE);
-- INSERT INTO private_utilisateur_droit (user_id, collectivite_id, role_name, active) VALUES ('4ecc7d3a-7484-4a1c-8ac8-930cdacd2561', 5, 'auditeur', TRUE);
commit;

begin;
create schema if not exists test;
commit;

begin;
create or replace function test.create_user(email text)
    returns auth.users
as
$$
insert into auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at,
                        confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at,
                        email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data,
                        raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at,
                        phone_change, phone_change_token, phone_change_sent_at, email_change_token_current,
                        email_change_confirm_status)
values ('00000000-0000-0000-0000-000000000000',
        gen_random_uuid(),
        'authenticated', 'authenticated',
        email, '$2a$10$nN.4fqCEI0EAKaA6C2tWle6qKToQEAt15sIJVUp34nccv3f10u76q',
        now(), null, '', null, '', null, '', '', null,
        now(),
        '{"provider": "email", "providers": ["email"]}',
        '{}',
        false,
        now(), now(), null, null, '', '', null,
        '',
        0)
returning *;
$$ language sql;

create function
    test.identify_as(user_id uuid)
    returns void
as
$$
select set_config('request.jwt.claim.sub', user_id::text, true);
select set_config('request.jwt.claim.role', 'authenticated', true);
$$ language sql;
comment on function test.identify_as(uuid) is
    'Change le résultat de la fonction `auth.uid()` pour les tests pgTAP.';

create function
    test.identify_as(email text)
    returns void
as
$$
select test.identify_as(u.id)
from auth.users u
where u.email = identify_as.email;
$$ language sql;
comment on function test.identify_as(text) is
    'Utilise l''adresse mail d''un utilisateur existant et change le résultat de la fonction `auth.uid()` pour les tests pgTAP.';

create function
    test.identify_as_service_role()
    returns void
as
$$
select set_config('request.jwt.claim.sub', null, true);
select set_config('request.jwt.claim.role', 'service_role', true);
$$ language sql;
comment on function test.identify_as_service_role() is
    'Change le résultat de la fonction `auth.uid()` pour les tests pgTAP.';
commit;

begin;
create or replace function brew_coffee() returns json as
$$
begin
    perform set_config('response.status', '200', true);
    return json_build_object('message', 'The requested entity body is short and stout.',
                             'hint', 'Tip it over and pour it out.');
end;
$$ language plpgsql;
comment on function brew_coffee() is
    'Any attempt to brew coffee with a teapot should result in the error code "418 I''m a teapot".';
commit;

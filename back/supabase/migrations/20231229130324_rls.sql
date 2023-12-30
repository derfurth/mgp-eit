-------------------------------------------------
---------------------- RLS ----------------------
-------------------------------------------------
alter table personne
    enable row level security;
alter table administrateur
    enable row level security;
alter table animateur
    enable row level security;
alter table co_animateur
    enable row level security;
alter table demarche
    enable row level security;
alter table atelier
    enable row level security;
alter table contact
    enable row level security;
alter table participant_meta
    enable row level security;
alter table fiche
    enable row level security;
alter table entreprise
    enable row level security;
alter table etablissement
    enable row level security;
alter table flux
    enable row level security;
alter table synergie
    enable row level security;


-------------------------------------------------
-------------------- Policies -------------------
-------------------------------------------------
-- Policies writen as WHERE clauses
-- https://supabase.io/docs/guides/auth#policies-are-like-where-clauses
-- https://www.postgresql.org/docs/current/sql-createpolicy.html


-- User roles have to be readable -- todo make user invitations possible
create policy "Enable select for authenticated users only"
    on administrateur
    for select
    using (is_authenticated());

--- animateurs
create policy "Enable all for administrateurs"
    on animateur
    for all
    with check (is_administrateur());
create policy "Enable select for authenticated users only"
    on animateur
    for select
    using (is_authenticated());

-- co_animateur
create policy "Enable all for administrateurs"
    on co_animateur
    for all
    with check (is_administrateur());
create policy "Enable all for animateurs of demarche"
    on co_animateur
    for all
    using (is_animateur_of(co_animateur.demarche_id));
create policy "Enable select for authenticated users only"
    on co_animateur
    for select
    using (is_authenticated());


-- Démarches, readable by all writable only by administrateurs.
create policy "Enable select for authenticated users only"
    on demarche
    for select
    using (is_authenticated());
create policy "Enable update for administrateurs"
    on demarche
    for all
    using (is_administrateur());

-- Ateliers
--- Administrateurs
create policy "Enable all for administrateurs"
    on atelier
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on atelier
    for all
    using (is_animateur_of(atelier.demarche_id));
-- Co-animateurs
create policy "Enable update for co-animateurs of an atelier"
    on atelier
    for update
    using (is_co_animateur_of(atelier.id));
create policy "Enable select for co-animateurs of an atelier"
    on atelier
    for select
    using ((select my_co_animateur_ids() && atelier.co_animateur_ids));


-- Contacts
--- Administrateurs
create policy "Enable all for administrateurs"
    on contact
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on contact
    for all
    using (is_animateur_of(contact.demarche_id));
-- Co-animateurs
create policy "Enable all for co-animateurs of demarche"
    on contact
    for all
    using (is_co_animateur_of_demarche(contact.demarche_id));


-- Entreprises same as contacts
--- Administrateurs
create policy "Enable all for administrateurs"
    on entreprise
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on entreprise
    for all
    using (is_animateur_of(entreprise.demarche_id));
--- Co-animateurs
create policy "Enable all for co-animateurs of demarche"
    on entreprise
    for all
    using (is_co_animateur_of_demarche(entreprise.demarche_id));


-- Etablissements
--- Administrateurs
create policy "Enable all for administrateurs"
    on etablissement
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on etablissement
    for all
    using (is_animateur_of(etablissement.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on etablissement
    for all
    using (is_co_animateur_of_demarche(etablissement.demarche_id));


-- Fiches
--- Administrateurs
create policy "Enable all for administrateurs"
    on fiche
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on fiche
    for all
    using (is_animateur_of(fiche.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on fiche
    for all
    using (is_co_animateur_of_demarche(fiche.demarche_id));


-- Fluxes
--- Administrateurs
create policy "Enable all for administrateurs"
    on flux
    for all
    using (is_administrateur());

--- Animateurs
create policy "Enable all for animateurs of demarche"
    on flux
    for all
    using (is_animateur_of(flux.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on flux
    for all
    using (is_co_animateur_of_demarche(flux.demarche_id));


-- Participant metas
--- Administrateurs
create policy "Enable all for administrateurs"
    on participant_meta
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on participant_meta
    for all
    using (is_animateur_of(participant_meta.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on participant_meta
    for all
    using (is_co_animateur_of_demarche(participant_meta.demarche_id));



-- Personnes
--- Administrateurs
create policy "Enable all for administrateurs"
    on personne
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on personne
    for all
    using (is_animateur_of(personne.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on personne
    for all
    using (is_co_animateur_of_demarche(personne.demarche_id));


-- Synergies
--- Administrateurs
create policy "Enable all for administrateurs"
    on synergie
    for all
    using (is_administrateur());
--- Animateurs
create policy "Enable all for animateurs of demarche"
    on synergie
    for all
    using (is_animateur_of(synergie.demarche_id));
--- Co animateurs
create policy "Enable all for co-animateurs of demarche"
    on synergie
    for all
    using (is_co_animateur_of_demarche(synergie.demarche_id));

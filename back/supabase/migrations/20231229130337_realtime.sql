begin;
-- remove the realtime publication
drop publication if exists supabase_realtime;

-- re-create the publication but don't enable it for any tables
create publication supabase_realtime;
commit;

-- add a tables to the publication
alter publication supabase_realtime add table atelier;
alter publication supabase_realtime add table fiche;
alter publication supabase_realtime add table synergie;
alter publication supabase_realtime add table participant_meta;
commit;

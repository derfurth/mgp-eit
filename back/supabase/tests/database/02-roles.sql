begin;
select plan(2);

select isnt(is_administrateur(), true, 'As anonymous I should not be an administrateur');

-- create an admin
select test.create_user('test@dodo.yo');
insert into administrateur
values (gen_random_uuid(), default, (select id from auth.users where email = 'test@dodo.yo'), null);

-- override uid function
create or replace function auth.uid() returns uuid as
$$
select id
from auth.users
where email = 'test@dodo.yo';
$$ language sql;

-- override role function
create or replace function auth.role() returns text as
$$
select 'authenticated';
$$ language sql stable;

select is(is_administrateur(), true, 'As test dodo I should be an administrateur');

select *
from finish();
rollback;

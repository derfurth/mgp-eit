begin;
select plan(2); -- only one statement to run

select has_column(
               'auth',
               'users',
               'id',
               'id should exist'
       );

select has_table('demarche');

select *
from finish();
rollback;

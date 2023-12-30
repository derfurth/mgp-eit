create or replace function
    is_authenticated()
    returns boolean
as
$$
begin
    return auth.role() = 'authenticated';
end;
$$ language plpgsql security definer;
comment on function is_authenticated is
    'Returns true if current user is authenticated.';

create or replace function
    is_administrateur()
    returns boolean
as
$$
begin
    return auth.uid() in (select user_id from administrateur);
end;
$$ language plpgsql security definer;


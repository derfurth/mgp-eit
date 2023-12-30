create function update_modified_at() returns trigger
as
$$
begin
    new.modified_at = now();
    return new;
end;
$$ language plpgsql;

create function initialize_created_at() returns trigger
as
$$
begin
    if new.created_at is null
    then
        new.created_at = now();
    end if;
    return new;
end;
$$ language plpgsql;

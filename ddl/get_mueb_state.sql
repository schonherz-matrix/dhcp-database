create type mueb_state as enum ('OFFLINE', 'ONLINE', 'CONFLICT');

create function get_mueb_state(mueb mueb)
    returns mueb_state
    language plpgsql
as
$$
declare
begin
    if mueb is null then
        return null;
    elsif mueb.ip_conflict = true then
        return 'CONFLICT';
    elsif mueb.heartbeat = true then
        return 'ONLINE';
    elsif mueb.heartbeat = false then
        return 'OFFLINE';
    end if;
end;
$$;

grant execute on function get_mueb_state(mueb mueb) to status, control;
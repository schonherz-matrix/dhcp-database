create view heartbeat as
select m.mueb_id, coalesce(m.ip_override, r.ip_address) as ip_address
from mueb m
         join port using (switch_id, port_id)
         join room r using (room_id)
where m.ip_conflict = false;

grant select on heartbeat to status, control;
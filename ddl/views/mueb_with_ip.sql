create view mueb_with_ip as
select m.mueb_id, coalesce(m.ip_override, r.ip_address) as ip_address, ip_conflict, r.room_id
from mueb m
         join port using (switch_id, port_id)
         join room r using (room_id);

grant select on mueb_with_ip to status, control;
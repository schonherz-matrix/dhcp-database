create view heartbeat as
select r.room_id, coalesce(m.ip_override, r.ip_address) as ip_address
from room r
         join port p using (room_id)
         join mueb m using (port_id, switch_id)
where m.mueb_id is not null
  and m.ip_conflict = false;

grant select on heartbeat to status, control;
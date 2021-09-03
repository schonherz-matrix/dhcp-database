create view room_port_mueb as
select r.room_id, p.port_id, m.mac_address, coalesce(m.ip_override, r.ip_address) as ip_address
from room r
         join port p using (room_id)
         left join mueb m using (port_id, switch_id)
order by room_id, port_id;

grant select on room_port_mueb to control;
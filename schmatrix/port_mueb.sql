create view port_mueb as
select p.port_id, p.room_id, m.mac_address, coalesce(m.ip_override, r.ip_address) as ip_address, m.ip_conflict
from port p
         left join room r using (room_id)
         left join mueb m on p.port_id = m.port_id and p.switch_id = m.switch_id;


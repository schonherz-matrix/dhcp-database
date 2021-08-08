create view schmatrix.detailed as
select p.switch_id,
       p.port_id,
       p.room_id,
       m.mac_address,
       coalesce(m.ip_override, r.ip_address) as ip_address,
       m.ip_conflict
from port p
         join mueb m on p.port_id = m.port_id and p.switch_id = m.switch_id
         join switch s on p.switch_id = s.switch_id
         join room r using (room_id);

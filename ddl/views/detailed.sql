create view detailed as
select r.room_id,
       s.switch_id                           as switch_hostname,
       p.port_id,
       m.mueb_id,
       m.mac_address,
       coalesce(m.ip_override, r.ip_address) as ip_address
from room r
         join port p using (room_id)
         join switch s using (switch_id)
         join mueb m using (port_id, switch_id)
order by room_id, port_id, mac_address;

grant select on detailed to control;
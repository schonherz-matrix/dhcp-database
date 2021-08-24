create view ping as
select r.room_id, coalesce(m.ip_override, r.ip_address) as ip_address
from room r
         join port p using (room_id)
         left join mueb m on p.port_id = m.port_id and p.switch_id = m.switch_id
where m.mueb_id is not null
  and m.ip_conflict = false;


create view room_state as
select r.room_id, get_mueb_state(m) as state
from room r
         join port p using (room_id)
         join mueb m using (port_id, switch_id);

grant select on room_state to status, control;
create table room
(
    room_id    integer
        constraint room_pk
            primary key,
    ip_address inet not null
);

create unique index room_ip_address_uindex
    on room (ip_address);

grant select on room to dhcp;
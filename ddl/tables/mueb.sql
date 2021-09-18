create table mueb
(
    mueb_id     integer generated by default as identity
        constraint mueb_pk
            primary key,
    mac_address macaddr               not null,
    switch_id   text,
    port_id     text,
    ip_override inet,
    ip_conflict boolean default false not null,
    constraint mueb_port_port_id_switch_id_fk
        foreign key (port_id, switch_id) references port,
    constraint port_id_and_switch_id_not_null
        check ((port_id is null and switch_id is null) or
               (port_id is not null and switch_id is not null))
);

create unique index mueb_ip_override_uindex
    on mueb (ip_override);

create unique index mueb_mac_address_uindex
    on mueb (mac_address);

create unique index mueb_port_id_switch_id_uindex
    on mueb (port_id, switch_id);

grant select on mueb to dhcp;

grant insert (mac_address, switch_id, port_id) on mueb to dhcp;

grant update (switch_id, port_id, ip_conflict) on mueb to dhcp;
grant update (ip_override, ip_conflict) on mueb to control;
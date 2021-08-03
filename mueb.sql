create table schmatrix.mueb
(
    mueb_id     integer
        constraint mueb_pk
            primary key,
    mac_address macaddr               not null,
    ip_override inet,
    ip_conflict boolean default false not null,
    port_id     varchar(25),
    switch_id   inet,
    constraint mueb_port_port_id_switch_id_fk
        foreign key (port_id, switch_id) references port,
    constraint port_id_and_switch_id_not_null check ((port_id is null and switch_id is null) or
                                                     (port_id is not null and switch_id is not null))
);

create unique index mueb_ip_override_uindex
    on schmatrix.mueb (ip_override);

create unique index mueb_mac_address_uindex
    on schmatrix.mueb (mac_address);

create unique index mueb_port_id_switch_id_uindex
    on schmatrix.mueb (port_id, switch_id);

grant select, update on schmatrix.mueb to dhcp;
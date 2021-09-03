create table switch
(
    switch_id inet
        constraint switch_pk
            primary key,
    hostname  text
);

grant select on switch to dhcp;
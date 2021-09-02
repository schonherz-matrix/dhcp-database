create table switch
(
    switch_id inet
        constraint switch_pk
            primary key,
    name      text
);

grant select on switch to dhcp;
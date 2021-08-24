create table switch
(
    switch_id inet
        constraint switch_pk
            primary key,
    name      varchar(5)
);

grant select on switch to dhcp;
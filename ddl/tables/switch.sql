create table switch
(
    switch_id text
        constraint switch_pk
            primary key
);

grant select on switch to dhcp;
create table schmatrix.switch
(
    switch_id inet
        constraint switch_pk
            primary key,
    name      varchar(5)
);
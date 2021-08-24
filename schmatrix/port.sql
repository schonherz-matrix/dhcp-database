create table port
(
	port_id varchar(25) not null,
	switch_id inet not null
		constraint port_switch_switch_id_fk
			references switch,
	room_id integer not null
		constraint port_room_room_id_fk
			references room,
	constraint port_pk
		primary key (port_id, switch_id)
);

grant select on port to dhcp;
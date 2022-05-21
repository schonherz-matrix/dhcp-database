-- Create database
create database schmatrix;
\c schmatrix
\i ddl/users.sql

-- Create tables
\i ddl/tables/switch.sql
\i ddl/tables/room.sql
\i ddl/tables/port.sql
\i ddl/tables/mueb.sql

-- Create views
\i ddl/views/detailed.sql
\i ddl/views/mueb_with_ip.sql
\i ddl/views/room_port_mueb.sql

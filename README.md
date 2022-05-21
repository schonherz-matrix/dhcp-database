# dhcp-database

This database contains the tables for DHCP server functionality and debug information.

## Prerequisites

- PostgreSQL **14+**

## How to use

Use the provided init.sql with psql like this:

```bash
sudo -u postgres psql -f init.sql
```

This will create the "schmatrix" database, users, tables and views.

After that the created tables need to be initialized with up to date data.


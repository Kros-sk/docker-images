# MSSQL Base image

This image is based on [mcr.microsoft.com/mssql/server](https://hub.docker.com/_/microsoft-mssql-server) and adds the ability to create databases.

## How to use this Image

In the `docker-compose.yml` file:

```yml
version: '3.7'

services:
  sql-server:
    image: mcr.microsoft.com/mssql/server:2019-latest
    environment:
      - ACCEPT_EULA=Y
      - SA_PASSWORD=str0ngP@ass
      - MSSQL_PID=Developer
    ports:
      - 1434:1433

  sql-db-init:
    image: krossk/mssql-seed
    environment:
      - MSSQL_HOST_NAME=sql-server
      - SA_PASSWORD=str0ngP@ass
      - DATABASES=Users,Projects,Catalogs,Basket,Authorization
    depends_on:
      - sql-server
```

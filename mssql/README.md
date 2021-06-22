# MSSQL Base image

This image is based on [mcr.microsoft.com/mssql/server](https://hub.docker.com/_/microsoft-mssql-server) and adds the ability to create databases.

## How to use this Image

In the `docker-compose.yml` file:

```yml
version: '3.1'

services:
  database:
    image: krossk/mssql
    restart: on-failure
    environment:
    - ACCEPT_EULA=Y
    - SA_PASSWORD=str0ngP@ass
    - MSSQL_PID=Developer
    - DATABASES=database1,database2,database3
    ports:
    - 1433:1433
```

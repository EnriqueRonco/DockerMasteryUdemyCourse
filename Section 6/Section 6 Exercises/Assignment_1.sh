docker volume create psql-data

docker container run -d --name postgresql -e POSTGRES_PASSWORD=secret -v psql-data:/var/lib/postgresql/data postgres:15.1

docker container run -d --name postgresqlUpdate -e POSTGRES_PASSWORD=secret -v psql-data:/var/lib/postgresql/data postgres:15.2
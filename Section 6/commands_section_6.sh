# Crear un volumen
docker volume create $nombre_volumen
# Listar los volúmenes
docker volume ls
# Inspeccionar un volumen
docker volume inspect $nombre_volumen
# Eliminar un volumen
docker volume rm $nombre_volumen

# Crear un volumen para el contenedor con docker container run
docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql
# Bind mount
docker container run -d --name nginx -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html nginx
# Inspeccionar un contenedor
docker container inspect nginx
# Inspeccionar un contenedor y filtrar la información
docker container inspect --format '{{ .Mounts }}' nginx
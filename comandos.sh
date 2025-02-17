## Description: Comandos de Docker
# Ver versión de Docker
docker -v

# Ver versión de Docker más completo (Versión del cliente y del servidor (docker engine))
docker version

# Ver información de Docker
docker info

# Estructura de los comandos de Docker nueva
# docker $command $subcommand $options
# Ejemplo: docker container run --publish 80:80 nginx

# Lanzar un contenedor
docker container run

# Publicar un puerto (por ejemplo nginx en el puerto 80) -> Imagen de nginx con puerto del contenedor (derecha) bindeado a un puerto del host (izquierda)
docker container run --publish 80:80 nginx

# Para que corra en background
docker container run --publish 80:80 --detach nginx or docker container run -p 80:80 -d nginx

# Listar contenedores
docker container ls

# Listar todos los contenedores (incluidos los parados)
docker container ls -a

# Parar un contenedor
docker container stop $container_id

# Arrancar un contenedor ya creado
docker container start

# La diferencia entre run y start, es que run crea un contenedor nuevo y start arranca un contenedor ya creado
# Para poner un nombre al contenedor
docker container run --name $nombre_contenedor -p 80:80 -d nginx

# Ver logs de un contenedor
docker container logs $container_id or docker container logs $nombre_contenedor

# Ver procesos corriendo en un contenedor
docker container top $container_id or docker container top $nombre_contenedor

# Ver detalles de configuración de un contenedor
docker container inspect $container_id or docker container inspect $nombre_contenedor

# Ver detalles de rendimiento de un contenedor (uso de CPU, memoria, etc)
docker container stats $container_id or docker container stats $nombre_contenedor

# Ver todos los subcomandos del comando docker container
docker container --help

# Eliminar un contenedor (primero necesitas parar el contenedor si esta corriendo, si no, añadir un -f al comando)
docker container rm $container_id or docker container rm $nombre_contenedor
docker container rm -f $container_id or docker container rm -f $nombre_contenedor
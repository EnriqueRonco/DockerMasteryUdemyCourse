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
# Si se quiere arrancar un contenedor ya creado que haya finalizado de forma interactiva
docker container start -ai $container_id or docker container start -ai $nombre_contenedor
    -a --attach -> Conectar STDIN/STDOUT
    -i --interactive -> Mantener STDIN abierto aunque no este conectado

# La diferencia entre run y start, es que run crea un contenedor nuevo y start arranca un contenedor ya creado
# Para poner un nombre al contenedor
docker container run --name $nombre_contenedor -p 80:80 -d nginx
#Correr un contenedor de forma interactiva
docker container run -it
    -t --tty -> Asigna una pseudo-TTY (simula una terminal)
    -i --interactive -> Mantener STDIN abierto aunque no este conectado
docker container run -it --name $nombre_contenedor nginx bash/sh
    bash/sh -> Es el comando que se ejecutará en el contenedor (bash o sh son terminales comunes en sistemas Unix)
#Correr un contenedor ya existente de forma interactiva (exec para correr otro proceso en un contenedor ya existente y que este corriendo)
docker container exec -it

# Ver logs de un contenedor
docker container logs $container_id or docker container logs $nombre_contenedor

# Ver procesos corriendo en un contenedor
docker container top $container_id or docker container top $nombre_contenedor

# Ver detalles de configuración de un contenedor
docker container inspect $container_id or docker container inspect $nombre_contenedor

# Con la opcion --format se puede ver un campo específico de la información
docker container inspect --format '{{.NetworkSettings.IPAddress}}' $container_id or docker container inspect --format '{{.NetworkSettings.IPAddress}}' $nombre_contenedor

# Ver detalles de rendimiento de un contenedor (uso de CPU, memoria, etc)
docker container stats $container_id or docker container stats $nombre_contenedor

# Ver todos los subcomandos del comando docker container
docker container --help

# Eliminar un contenedor (primero necesitas parar el contenedor si esta corriendo, si no, añadir un -f al comando)
docker container rm $container_id or docker container rm $nombre_contenedor
docker container rm -f $container_id or docker container rm -f $nombre_contenedor

# Para linkear un contenedor con otro
docker container run --name $nombre_contenedor --link $nombre_contenedor:alias $imagen
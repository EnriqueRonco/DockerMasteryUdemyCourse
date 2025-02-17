# Comprobación rápida d epuertos
docker container port $container_id or docker container port $nombre_contenedor

Todos los contenedores son conectados a una red virtual privada "bridge", que es la red predefinida, la cual es NATeada (Network Address Translation) a la red del host (la red de la máquina donde se está corriendo Docker)
Cada red virtual realiza rutas a traves de un NAT (Network Address Translation) para que los contenedores puedan comunicarse entre ellos y con el host
Todos los contenedores en una red virtual pueden hablar entre ellos sin la necesidad de exponer un puerto con -p (--publish)
Buena práctica: crear una nueva red virtual para cada aplicación
Se puede usar la red del host en vez de una red virtual, utilizano para ello --net=host, lo cual hace que el contenedor no tenga aislamiento de red
Con --network=none, se puede crear un contenedor sin red, lo cual es útil para contenedores que no necesitan acceso a la red, y teniendo solo la interfaz "localhost" en el contenedor

Cuando se abre un puerto, la informacion va a través de esa red virtual de docker, y a continuación, a través de la red del host, así es como viajan los paquetes a través de estas interfaces de red

# Para ver que puertos estan expuestos en un contenedor
docker container port $container_id or docker container port $nombre_contenedor

## CLI (Command Line Interface) Management Commands
# Listar redes
docker network ls
# Inspeccionar una red
docker network inspect $network_id or docker network inspect $nombre_red
# Crear una red
docker network create $nombre_red
# Driver de red (bridge, overlay, macvlan, none), por defecto es bridge, son built-in o se pueden instalar de terceros (plugins) que da a la red virtual sus características
docker network create --driver $driver $nombre_red
    -d -> --driver -> Driver de red

# Conectar a una red, lo cual creará una NIC (Network Interface Controller) en un contenedor y lo conectará a la red
docker network connect $network_id $container_id or docker network connect $network_id $nombre_contenedor
# Desconectar de una red, lo cual eliminará la NIC (Network Interface Controller) en un contenedor y lo desconectará de la red
docker network disconnect $network_id $container_id or docker network disconnect $network_id $nombre_contenedor
# Eliminar una red
docker network rm $network_id or docker network rm $nombre_red
# Eliminar todas las redes sin usar
docker network prune

# Crear un contenedor y conectarlo a una red
docker container run --name $nombre_contenedor --network $network_id $imagen or docker container run --name $nombre_contenedor --network $nombre_red $imagen
# Con la opcion --format se puede ver un campo específico de la información, en este caso, la dirección IP del contenedor
docker container inspect --format '{{.NetworkSettings.IPAddress}}' $container_id or docker container inspect --format '{{.NetworkSettings.IPAddress}}' $nombre_contenedor

# Default security
Crear las aplicaciones de tal forma que el frontend y el backend estén en la misma red de Docker
Que su comunicación interna nunca salga del host
Todos los puertos cerrados
Si se necesita exponer un puerto, hacerlo de forma explícita con --publish

## Docker Networks: DNS (Domain Name System)
Docker (el daemon) tiene un servidor DNS integrado que se utiliza por defecto, que permite a los contenedores comunicarse entre ellos por nombre
Cuando se conecta un contenedor a una red, Docker le asigna un nombre de host que es el nombre del contenedor
Docker también le asigna un nombre de host que es el nombre del contenedor a la red de Docker
No usar las IPs directamente, usar los nombres de host de los contenedores
Se puede establecer un alias para un contenedor, lo cual es útil para cambiar el nombre de un contenedor sin tener que cambiar el nombre en todos los contenedores que se comunican con él
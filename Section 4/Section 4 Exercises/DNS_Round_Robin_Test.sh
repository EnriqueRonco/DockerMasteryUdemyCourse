# 1. Crear una red virtual de Docker
# 2. Crear dos contenedores de elasticsearch:2
# 3. Usar --network-alias search cuando se crea para darle un DNS adicional al cual responderá
# 4. Correr alpine nslookup search with --net para ver los dos contenedores que responden al mismo DNS
# 5. Correr centos curl -s search:9200 con --net para ver que responde con el nombre de los dos contenedores

# El DNS Round Robin Test se refiere a una prueba o verificación del balanceo de carga basado en DNS usando el método de Round Robin. 
# Este mecanismo permite distribuir el tráfico entre múltiples servidores a través de registros DNS del mismo tipo, 
# asignando diferentes direcciones IP a un mismo nombre de dominio.

docker network create dns-net

# Crear elasticsearch
docker run -e "discovery.type=single-node" -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e "xpack.security.enabled=false" --network dns-net -d --network-alias search elasticsearch:8.4.3 (--net-alias también funciona)
docker run --rm -it network dns-net alpine

# nslookup search
docker container run --rm --net dns-net alpine nslookup search

nslookup search

apk add curl
curl search:9200
curl search:9200

docker container rm -f $elasticsearch1 $elasticsearch2
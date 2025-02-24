docker container run --rm --name ubuntu -it ubuntu:14.04 bash
docker container run --rm --name centos -it centos:7 bash (Con --rm, se elimina el contenedor al salir de él)

curl --version
apt-get update && apt-get install curl
yum update curl

exit
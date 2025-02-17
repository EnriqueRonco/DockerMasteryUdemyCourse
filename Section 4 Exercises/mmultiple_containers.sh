docker run --name nginx --publish 80:80 --detach nginx
docker run --name httpd --publish 8080:80 --detach httpd
docker run --name mysql --publish 3306:3306 --env MYSQL_RANDOM_ROOT_PASSWORD=yes --detach mysql

docker container logs mysql

docker container stop mysql
docker container stop nginx
docker container stop httpd
docker container rm mysql
docker container rm nginx
docker container rm httpd
docker container ls
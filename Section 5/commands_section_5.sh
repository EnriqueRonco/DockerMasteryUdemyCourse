# Las imágenes están compuestas por cambios en el file system, que se representan en capas (layers) y metadata
# Un contenedor no es más que una capa de escritura (readable/writable layer) encima de una imagen
# Inspeccionar una imagen
docker image inspect $nombre_imagen
# Muestra los metadatos de la imagen

# Muestra las capas (layers) de cambios que se han hecho en una imagen
docker image history $image_id or docker image history $nombre_imagen
# Cada capa representa un cambio, que puede ser simplemente un cambio que no afecte al tamaño del archivo (not file edit) como un env
# Estas capas se crean a partir de los comandos que se ejecutan en el Dockerfile
# Las capas se pueden reutilizar en otras imágenes, lo que permite que las imágenes sean más pequeñas y rápidas de construir
# Las capas se pueden cachear, lo que permite que las imágenes se construyan más rápido
# Las capas se pueden compartir, lo que permite que las imágenes se distribuyan más rápido
# No hace falta descargar capas que ya tengamos en nuestro sistema

# Poner un tag a una imagen (Si no se especifica un tag, se usará el tag por defecto, "latest", que no signinfica que sea la última versión, si no que normalmente se le asocia la ultima versión estable)
docker image tag $nombre_imagen_origen:$tag $nombre_imagen_destino:$tag

# Para subir una imagen a Docker Hub, primero hay que loguearse con el comando docker login
docker login
# Introducir el usuario y la contraseña de Docker Hub
# Para el logout (Hacer logout en máquinas compartidas, ya que las credenciales se quedan en el sistema, en .docker/config.json)
docker logout
# Para subir una imagen a Docker Hub, primero hay que ponerle un tag con el nombre de usuario de Docker Hub
docker image tag $nombre_imagen $nombre_usuario_docker_hub/$nombre_imagen
# Subir una imagen a Docker Hub (Sube los cambios de capas de una imagen a Docker Hub, ya que este es el repositorio de imágenes por defecto)
docker image push $nombre_imagen
# Para bajar una imagen de Docker Hub, simplemente se hace un pull
docker image pull $nombre_imagen

# Para crear un repositorio privado, primero crear el repositorio en Docker Hub antes de subir ningún cambio

# Para lanzar una imagen (Se debe especificar la ruta donde se encuentra el Dockerfile)
docker image build -t $nombre_imagen $ruta_directorio 
# -t -> Tag de la imagen
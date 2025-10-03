📦 Laboratorio NFS con Docker Compose

Este laboratorio despliega un servidor NFS dentro de un contenedor Docker, ideal para prácticas en entornos de red y sistemas.

✅ Requisitos previos

1 ### Sistema operativo

Linux (Ubuntu, Debian, CentOS, Fedora, etc.)

Windows/Mac (con Docker Desktop habilitado)

2 ### Instalación de Docker Engine y Docker Compose

Instalar Docker Engine

docker --version
docker compose version

3 ### Red Docker tipo ipvlan
Este laboratorio usa una red ipvlan para dar al contenedor una IP dentro de tu LAN.
Debes crear la red antes de iniciar el compose:

docker network create -d ipvlan \
  --subnet=192.168.88.0/24 \
  --gateway=192.168.88.1 \
  -o parent=enp2s8 \
  ipvlan_lab

⚠️ Cambia los valores de subnet, gateway y parent según tu red.

4 ### Carpeta de datos
En la misma ruta donde tengas este archivo docker-compose.yml, crea la carpeta compartida:

mkdir nfs-share


4 ### 🚀 Despliegue del NFS

Levantar el contenedor:
docker-compose -f deploy.nfs.yml up -d

Verificar que está corriendo:
docker ps

En un cliente Linux, montar el recurso NFS:
sudo mount -t nfs 192.168.X.X:/nfs-share /mnt


🛑 Detener y limpiar
docker-compose -f deploy.nfs.yml down










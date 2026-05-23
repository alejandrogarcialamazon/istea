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

5 ### Prerrequisito del módulo del kernel NFS (nfsd)

El contenedor NFS requiere que el módulo del kernel nfsd esté cargado en el host.
Si no está presente, el contenedor fallará con un error como:
	ERROR: nfsd module is not loaded in the Docker host's kernel (try: modprobe nfsd)

Para solucionarlo:
sudo modprobe nfsd

Verifica que se haya cargado correctamente:
lsmod | grep nfsd

Deberías ver una salida similar a:
nfsd                  614400  1

Para hacerlo persistente tras reinicio:
echo nfsd | sudo tee -a /etc/modules


🛑 Detener y limpiar
docker-compose -f deploy.nfs.yml down


🧰 Troubleshooting (Solución de Problemas)
1. El cliente muestra clnt_create: RPC: Program not registered

El contenedor no logró iniciar correctamente el servicio NFS.
Verifica los logs:
docker logs -f nfs-server

Si ves:
ERROR: nfsd module is not loaded in the Docker host's kernel

→ Carga el módulo nfsd como se explicó en los prerrequisitos.

2. El cliente muestra No such file or directory al montar

Verifica que la ruta exportada exista dentro del contenedor:
docker exec -it nfs-server ls /nfs-share

Asegúrate de que la variable SHARED_DIRECTORY o NFS_EXPORT_0 esté configurada correctamente en el docker-compose.yml.

3. Comprobar exportaciones disponibles

Desde cualquier cliente Linux:
sudo showmount -e 192.168.X.X

Deberías ver algo como:
Export list for 192.168.X.X:
/nfs-share *

4. Reiniciar servicios NFS en el host

En algunos casos puede ser necesario:
sudo systemctl restart nfs-common rpcbind

5. Puerto de escucha:

Podés verificar si el puerto 2049 (NFS) está activo en el contenedor con:
sudo netstat -tulnp | grep 2049




# Despliegue de Zabbix con Docker Compose (usando IPVLAN)

Este proyecto permite desplegar un entorno completo de **Zabbix 7.0** utilizando `docker-compose` con red **IPVLAN**, ideal para laboratorios y entornos de práctica.

---

## 📋 Requisitos previos

Antes de desplegar el stack, asegúrate de cumplir con los siguientes requisitos:

### 1. Sistema operativo
- Linux (Ubuntu, Debian, Rocky, CentOS o similar)
- Acceso como usuario con permisos de **sudo**

### 2. Paquetes necesarios
Instalar **Docker Engine** y **Docker Compose**:

sudo apt update
sudo apt install -y docker.io docker-compose

Verifica la instalación:
docker --version
docker-compose --version

### 3. Red IPVLAN
Este proyecto usa IPVLAN en modo L2.
Debes identificar el nombre de tu interfaz de red física (ejemplo: enp2s8, eth0, etc.).

Puedes verificarlo con:
ip addr

En el archivo docker-compose.yml actualiza la sección:
driver_opts:
  parent: enp2s8   # <-- cambiar por tu interfaz real

### 4. Directorios de volúmenes
Asegúrate de crear los directorios necesarios en tu host antes de levantar los contenedores:
mkdir -p ./zabbix/db
mkdir -p ./zabbix/varlib
mkdir -p ./zabbix/front
mkdir -p ./zabbix/zabbix-agent



🚀 Despliegue

Clona o descarga este repositorio

Posiciónate en la carpeta del proyecto

Levanta los servicios:
docker-compose -f deploy.zabbix.yml up -d

🔍 Acceso

Zabbix Frontend:

URL: http://192.168.88.22 (o la IP que definiste en zabbix-web)

Usuario: Admin

Password: zabbix

Base de datos Postgres:

Host: 192.168.88.20 (o la IP que definiste en zabbix-db)

Usuario: zabbix

Password: zabbix

Servidor Zabbix: 192.168.88.21 (o la IP que definiste en zabbix-server)


🛑 Detener el stack

Para detener y eliminar los contenedores:

docker-compose -f deploy.zabbix.yml down

📚 Notas

IPVLAN en modo l2 permite que los contenedores se comporten como hosts de la misma red física, con IP propia.

Si no puedes usar IPVLAN en tu máquina (restricciones del kernel, permisos, etc.), puedes cambiar el driver a bridge como alternativa.






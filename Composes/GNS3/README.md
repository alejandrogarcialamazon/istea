# GNS3 en Docker con Compose

Este despliegue permite levantar un **servidor GNS3** en Docker de forma rápida, ideal para usar desde el navegador o desde el cliente de escritorio.

---

## ✅ Requisitos previos

Antes de iniciar, asegurate de tener instalado:

- **Docker Engine** (mínimo 20.10+)
- **Docker Compose Plugin** (incluido en versiones recientes de Docker Desktop / Docker Engine)
- Acceso de superusuario (`sudo`) en Linux

Para verificar:
```bash
docker --version
docker compose version

⚙️ Configuración de red

Este contenedor usa una red Docker externa (gns3-net) que debe estar creada previamente y conectada a tu LAN.

Si no existe, creala así (ajusta la interfaz física a tu caso):

sudo docker network create -d macvlan \
  --subnet=192.168.88.0/24 \
  --gateway=192.168.88.1 \
  -o parent=enp2s8 gns3-net

📌 Reemplazá:

192.168.88.0/24 → por la subred de tu LAN

192.168.88.1 → gateway real de tu red

enp2s8 → interfaz de red física de tu host

🚀 Despliegue

Cloná o copiá el archivo docker-compose.yml y ejecutá:

sudo docker compose -f deploy-gns3-server.yml up -d

Para detener:

sudo docker compose -f deploy-gns3-server.yml down

📂 Persistencia (opcional)

Si querés que los proyectos de GNS3 se guarden en tu disco local, descomentá en el docker-compose.yml la sección:

volumes:
  - ./gns3_data:/data

🌐 Acceso

Web UI / API → http://localhost:3080

⚠️ Notas importantes

El contenedor usa privileged: true, requerido para QEMU/Dynamips. No usar en servidores de producción.

Limitamos los recursos a 1 CPU y 3GB RAM. Podés ajustarlo según tu hardware.

Si tu host no tiene al menos 4GB de RAM libre, el rendimiento será bajo.






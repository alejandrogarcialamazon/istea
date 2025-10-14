# 🛰️ Introducción a SNMP (Simple Network Management Protocol)

## 📘 Fundamentos Teóricos

**SNMP (Simple Network Management Protocol)** es un protocolo estándar del modelo TCP/IP utilizado para la **administración y monitoreo de dispositivos de red**.  
Permite que los administradores recopilen información, detecten fallas y realicen ajustes en routers, switches, servidores, firewalls, impresoras, entre otros.

---

## 🧩 Arquitectura del Sistema SNMP

El sistema se compone de tres elementos principales:

| Componente | Descripción |
|-------------|--------------|
| **Manager (Gestor)** | Sistema central que consulta y administra los dispositivos. Ejemplo: Zabbix, PRTG, SolarWinds, Nagios, etc. |
| **Agent (Agente)** | Software que se ejecuta en el dispositivo y expone información mediante SNMP. |
| **MIB (Management Information Base)** | Base de datos jerárquica que define qué información puede consultar o modificar el gestor. Cada elemento tiene un identificador único llamado **OID (Object Identifier)**. |

---

## 🧠 Conceptos Clave

- **OID (Object Identifier):** Identifica de manera única cada parámetro o métrica.  
  Ejemplo:  
  - `1.3.6.1.2.1.1.3.0` → Tiempo de actividad del sistema (sysUpTime)
  - `1.3.6.1.2.1.2.2.1.10` → Bytes recibidos por interfaz

- **Comunidad SNMP:**  
  Una especie de contraseña que define el nivel de acceso.
  - `public` → Solo lectura (Read-Only)
  - `private` → Lectura y escritura (Read-Write)

- **Versiones del protocolo:**
  | Versión | Características principales |
  |----------|------------------------------|
  | **v1** | Primera versión, simple, sin cifrado. |
  | **v2c** | Mejora el rendimiento y agrega más operaciones, pero sigue sin seguridad. |
  | **v3** | Añade autenticación y cifrado (seguridad basada en usuarios). Ideal para entornos productivos. |

---

## 🔄 Flujo de comunicación

```text
+------------------+         +------------------+
|     Manager      |         |      Agent       |
| (Zabbix, etc.)   | <-----> | (Router/Switch)  |
+------------------+         +------------------+
         |                           |
         |------ GET / GET-NEXT ---->|
         |<------ RESPONSE ----------|
         |------ SET (opcional) ---->|




Operaciones principales:

GET: Solicita el valor de una variable al agente.

GET-NEXT: Explora la siguiente variable dentro del árbol MIB.

SET: Modifica el valor de una variable (si está permitido).

TRAP: Notificación enviada por el agente al manager ante un evento.




🎯 Objetivo de los ejercicios


Comprender el funcionamiento de SNMP.

Configurar un router o switch para exponer información vía SNMP.

Utilizar herramientas de monitoreo o simuladores para verificar comunicación.

Capturar tráfico SNMP y analizar los mensajes.

Integrar SNMP con herramientas de observabilidad (Zabbix, Grafana, etc.).

🧪 Prácticas en Cisco Packet Tracer

⚙️ Nivel: Inicial / Intermedio
Objetivo: Familiarizarse con el protocolo, configuración básica y monitoreo.

🧰 Ejercicio 1 - Activar SNMP en un router Cisco

Objetivo: Configurar el servicio SNMP en un router y verificarlo con un "Network Management Station".
Tareas:

Crear una topología simple: 1 Router, 1 PC (Manager).

Configurar en el router:

snmp-server community public RO
snmp-server contact "admin@istea.com.ar"
snmp-server location "Laboratorio SNMP"

Desde la PC, usar la herramienta SNMP del Packet Tracer para consultar sysName y sysUpTime.

🧰 Ejercicio 2 - Monitoreo de múltiples dispositivos

Objetivo: Configurar SNMP en varios routers/switches y centralizar consultas desde una PC.
Tareas:

Topología con 3 routers y un PC.

Cada router con community public RO.

Consultar interfaces activas (ifNumber y ifDescr).

🧰 Ejercicio 3 - Captura de traps SNMP

Objetivo: Simular el envío de traps SNMP desde un router a una estación de gestión.
Tareas:

Configurar snmp-server enable traps.

Forzar un cambio de estado en una interfaz.

Observar el trap recibido.

🧰 Ejercicio 4 - Configuración de comunidades seguras

Objetivo: Configurar diferentes comunidades para diferentes niveles de acceso.
Tareas:

public (RO)

private (RW)

Probar que solo la comunidad RW permite realizar cambios en las variables.

🧰 Ejercicio 5 - MIB Browser y exploración de OIDs

Objetivo: Navegar la MIB y observar los OIDs principales.
Tareas:

Usar un "MIB Browser" en Packet Tracer.

Consultar variables del grupo system y interfaces.

Documentar los OIDs más importantes.



🧠 Prácticas en GNS3

⚙️ Nivel: Intermedio / Avanzado
Objetivo: Trabajar con entornos más reales, capturas y monitoreo externo.

## 🧩 Ejercicio 1 – Configuración base SNMPv2c y verificación con snmpwalk

### 🎯 Objetivo
Configurar un router Cisco IOSv para habilitar el servicio SNMPv2c y verificar desde una máquina Linux que las consultas SNMP funcionan correctamente.

### 🖥️ Topología sugerida
+------------+ +------------+
| Linux VM | <-----> | Router R1 |
| (Manager) | | (Agent) |
| 192.168.10.10/24 | 192.168.10.1/24 |
+------------+ +------------+


### ⚙️ Configuración en el Router (R1)

enable
configure terminal
hostname R1
interface g0/0
 ip address 192.168.10.1 255.255.255.0
 no shutdown

snmp-server community public RO
snmp-server location "Lab GNS3 - SNMPv2"
snmp-server contact "admin@itenaccion.com.ar"
end
write memory

🧠 Verificación desde Linux

En la VM Linux (con net-snmp instalado):
sudo apt update && sudo apt install -y snmp snmp-mibs-downloader
snmpwalk -v2c -c public 192.168.10.1 system

✅ Resultado esperado

Respuestas con información del sistema: sysDescr, sysUpTime, sysName, etc.

Comunicación SNMPv2c establecida correctamente.



🧩 Ejercicio 2 – Monitoreo de múltiples routers con SNMP
🎯 Objetivo

Configurar varios routers con diferentes comunidades SNMP y realizar consultas desde una estación central.

🖥️ Topología sugerida

         +------------+
         |  Linux VM  |
         | 192.168.10.10 |
         +------+------+
                |
       -------------------------
       |           |           |
   +---+---+   +---+---+   +---+---+
   |  R1  |   |  R2  |   |  R3  |
   |.1/24 |   |.2/24 |   |.3/24 |
   -------   -------   -------

hostname R1
interface g0/0
 ip address 192.168.10.1 255.255.255.0
 no shutdown
snmp-server community public RO
snmp-server location "Router 1"

hostname R2
interface g0/0
 ip address 192.168.10.2 255.255.255.0
 no shutdown
snmp-server community red RO
snmp-server location "Router 2"

hostname R3
interface g0/0
 ip address 192.168.10.3 255.255.255.0
 no shutdown
snmp-server community secure RW
snmp-server location "Router 3"


🧠 Verificación desde Linux
snmpwalk -v2c -c public 192.168.10.1 sysName
snmpwalk -v2c -c red 192.168.10.2 sysName
snmpwalk -v2c -c secure 192.168.10.3 sysName


✅ Resultado esperado

Cada consulta devuelve el nombre del router correspondiente.
Se demuestra cómo diferentes comunidades controlan el acceso.


🧩 Ejercicio 3 – Captura y análisis de tráfico SNMP con Wireshark
🎯 Objetivo

Observar y analizar las operaciones GET y RESPONSE del protocolo SNMP en tiempo real.

🖥️ Topología

Se usa el escenario del Ejercicio 2.

🧩 Pasos

Iniciar Wireshark en la interfaz conectada al router.

Filtrar por:
udp.port == 161

Ejecutar desde Linux:

snmpget -v2c -c public 192.168.10.1 sysUpTime.0

Observar el intercambio GET (solicitud) y RESPONSE (respuesta) en Wireshark.

✅ Resultado esperado

Se identifican claramente los paquetes SNMP.

Se visualizan los OIDs y los valores devueltos por el agente.



🧩 Ejercicio 4 – Configuración SNMPv3 con autenticación y cifrado
🎯 Objetivo

Configurar SNMPv3 en un router con autenticación y privacidad (authPriv) y realizar una consulta segura desde Linux.

🖥️ Topología

+------------+         +------------+
|  Linux VM  | <-----> |  Router R1 |
|192.168.10.10|        |192.168.10.1|
+------------+         +------------+

⚙️ Configuración en el Router
enable
configure terminal
snmp-server group SECURE v3 priv
snmp-server user admin SECURE v3 auth sha itenaccion priv aes 12345678
snmp-server host 192.168.10.10 version 3 priv admin
snmp-server location "SNMPv3 Secure Lab"
snmp-server contact "admin@itenaccion.com.ar"
end
write memory

🧠 Verificación desde Linux
snmpwalk -v3 -l authPriv -u admin \
  -a SHA -A itenaccion \
  -x AES -X 12345678 \
  192.168.10.1 system


✅ Resultado esperado

La consulta devuelve los valores del sistema.
En Wireshark, los datos aparecen cifrados (no legibles), demostrando la seguridad de SNMPv3.



🧩 Ejercicio 5 – Integración SNMP con Zabbix (monitoreo real)
🎯 Objetivo

Conectar un router SNMPv2c o SNMPv3 configurado en GNS3 con un servidor Zabbix real o virtual, y graficar sus métricas.

🖥️ Topología sugerida

                +--------------------+
                |   Zabbix Server    |
                |   192.168.10.50    |
                +---------+----------+
                          |
        ---------------------------------------
        |                                     |
   +------------+                      +------------+
   |   R1 (v2c) |                      |   R2 (v3)  |
   |192.168.10.1|                      |192.168.10.2|
   +------------+                      +------------+


⚙️ Configuración en Router R1 (SNMPv2c)
snmp-server community public RO
snmp-server location "SNMPv2 Device"

⚙️ Configuración en Router R2 (SNMPv3)
snmp-server group SECURE v3 priv
snmp-server user admin SECURE v3 auth sha itenaccion priv aes 12345678


⚙️ Configuración en Zabbix

Crear Hosts:

Router_R1_SNMPv2

Interface: 192.168.10.1

Template: Template Module Interfaces SNMPv2

Community: public

Router_R2_SNMPv3

Interface: 192.168.10.2

Template: Template Module Interfaces SNMPv3

User: admin

Auth: SHA / AES (claves: itenaccion / 12345678)

Esperar detección automática y visualizar métricas (tráfico, uptime, CPU).

✅ Resultado esperado

Zabbix obtiene métricas de ambos routers.

En gráficos se visualiza la diferencia entre SNMPv2 y v3.

Se comprueba la interoperabilidad entre el entorno GNS3 y herramientas reales de monitoreo.






📦 Recursos sugeridos

📘 RFC 1157 - Simple Network Management Protocol (SNMP v1)

📘 RFC 3411–3418 - SNMPv3 Framework

🧰 Herramientas:

snmpwalk, snmpget, snmptrap

Wireshark

Zabbix

Cisco Packet Tracer / GNS3





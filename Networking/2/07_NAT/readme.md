# 🌐 Clase Práctica: NAT en Redes (Network Address Translation)

**Proyecto:** Laboratorio de Redes
**Plataforma:** Cisco Packet Tracer  

---

## 🧭 Objetivo General

Comprender el funcionamiento del **NAT (Network Address Translation)** y sus diferentes tipos (Static NAT, Dynamic NAT y PAT), aplicando configuraciones prácticas en **Cisco Packet Tracer** para conectar redes privadas con redes públicas simuladas.

---

## 📘 Contenidos

1. Introducción a NAT  
2. Tipos de NAT  
3. Conceptos clave  
4. Prácticas paso a paso en Packet Tracer  
5. Comparativa y casos de uso  
6. Evaluación final  

---

## 🔍 1. Introducción

**NAT (Network Address Translation)** es una técnica que permite traducir direcciones IP privadas a públicas (y viceversa).  
Se utiliza principalmente para:

- Permitir que redes privadas accedan a Internet.  
- Ocultar la estructura interna de la red.  
- Ahorrar direcciones IPv4 públicas.  

---

## 🧩 2. Tipos de NAT

| Tipo de NAT | Descripción | Ejemplo de uso |
|--------------|--------------|----------------|
| **Static NAT** | Traducción 1 a 1 entre IP privada y pública. | Publicar un servidor interno (ej: web o mail). |
| **Dynamic NAT** | Traducción 1 a 1, pero dinámica, usando un pool de IPs públicas. | Cuando hay pocas IPs públicas disponibles. |
| **PAT (NAT Overload)** | Traducción de muchas IPs privadas usando una sola IP pública (por puertos). | Conexión de múltiples hosts a Internet usando una sola IP. |

---

## 🧠 3. Conceptos Clave

| Término | Significado |
|----------|--------------|
| **Inside Local** | IP privada dentro de la red interna (ej: 192.168.1.10). |
| **Inside Global** | IP pública que representa al host interno (ej: 200.1.1.10). |
| **Outside Local** | IP del host externo vista desde dentro de la red. |
| **Outside Global** | Dirección real del host externo. |

---

## ⚙️ 4. Prácticas en Packet Tracer

A continuación se presentan **tres laboratorios** progresivos para aprender y practicar NAT en routers Cisco.

---

### 🧪 Práctica 1: NAT Estático (Static NAT)

#### 🎯 Objetivo
Configurar una traducción fija entre un servidor interno y una IP pública para hacerlo accesible desde Internet.

#### 🖥️ Topología
[PC Cliente Internet]---- [Router NAT] ---- [SW] ---- [LAN Interna con Servidor]
200.1.1.100 200.1.1.1 | 192.168.1.1 192.168.1.100


#### 🧰 Direccionamiento
| Dispositivo | Interfaz | IP | Descripción |
|--------------|-----------|----|--------------|
| Router | fa1/0 | 192.168.1.1 | Red interna |
| Router | fa0/0 | 200.1.1.1 | Red pública |
| Servidor | NIC | 192.168.1.100 | Web server interno |
| Cliente Internet | NIC | 200.1.1.100 | Equipo externo |

#### 🔧 Configuración del Router
-
Router> enable
Router# configure terminal
Router(config)# interface fa1/0
Router(config-if)# ip address 192.168.1.1 255.255.255.0
Router(config-if)# ip nat inside
Router(config-if)# no shutdown
-
Router(config)# interface fa0/0
Router(config-if)# ip address 200.1.1.1 255.255.255.0
Router(config-if)# ip nat outside
Router(config-if)# no shutdown
-
Router(config)# ip nat inside source static 192.168.1.100 200.1.1.100
-
🧩 Verificación
Router# show ip nat translations
Router# show ip nat statistics

Desde el cliente externo: hacer ping 200.1.1.100 o probar conexión HTTP.

El router traducirá la IP pública a la IP privada del servidor.


🧪 Práctica 2: NAT Dinámico con Pool
-
🎯 Objetivo

Permitir que varias PCs de una LAN accedan a Internet usando un conjunto (pool) de IPs públicas.

🖥️ Topología
[LAN 192.168.10.0/24] ---- [Router NAT] ---- [Red Pública 200.1.1.0/24]

🔧 Configuración del Router:
-
-
Router(config)# access-list 1 permit 192.168.10.0 0.0.0.255
Router(config)# ip nat pool NAT_POOL 200.1.1.100 200.1.1.110 netmask 255.255.255.0
Router(config)# ip nat inside source list 1 pool NAT_POOL
-
Router(config)# interface fa0/0
Router(config-if)# ip address 192.168.10.1 255.255.255.0
Router(config-if)# ip nat inside
Router(config-if)# no shutdown
-
Router(config)# interface fa1/0
Router(config-if)# ip address 200.1.1.1 255.255.255.0
Router(config-if)# ip nat outside
Router(config-if)# no shutdown
-
🧩 Verificación
Router# show ip nat translations
Router# show ip nat statistics
-
Desde varias PCs, realizar ping a una IP pública (ej. 8.8.8.8 simulado).

Cada equipo tomará una IP diferente del pool.


🧪 Práctica 3: PAT (NAT Overload)
-
🎯 Objetivo

Permitir que muchas PCs internas salgan a Internet usando una sola IP pública, diferenciadas por sus puertos.

🖥️ Topología
[LAN 192.168.20.0/24] ---- [Router NAT] ---- [Internet 200.1.1.0/24]

🔧 Configuración del Router
-
-
Router(config)# access-list 1 permit 192.168.20.0 0.0.0.255
Router(config)# ip nat inside source list 1 interface s0/0/0 overload
-
Router(config)# interface fa0/0
Router(config-if)# ip address 192.168.20.1 255.255.255.0
Router(config-if)# ip nat inside
Router(config-if)# no shutdown
-
Router(config)# interface fa1/0
Router(config-if)# ip address 200.1.1.1 255.255.255.0
Router(config-if)# ip nat outside
Router(config-if)# no shutdown
-

🧩 Verificación
-
-
Router# show ip nat translations
Router# show ip nat statistics
-
Todas las PCs internas deberían acceder simultáneamente usando la misma IP pública (200.1.1.1).
-
-

🧾 5. Comparativa Final
-
Tipo		Nº de IPs Públicas	Escalabilidad	Uso Común
Static  NAT	Alta			Baja		Servidores públicos
Dynamic NAT	Media			Media		Pequeñas LAN con IPs limitadas
PAT		Baja (1 IP)		Alta		Conexión de usuarios a Internet


📂 Archivos del Proyecto
-
-
En la carpeta del repositorio encontrarás los siguientes recursos:

Archivo	Descripción
-
nat-static.pkt	Escenario configurado para práctica de NAT estático.
https://drive.google.com/file/d/1g1zVPhoehzEmpyrZ74MHnSG9lVf0ClHv/view?usp=sharing

nat-dynamic.pkt	Escenario para práctica de NAT dinámico con pool.
https://drive.google.com/file/d/19Wqn4qhL95aPJxrQ1akxROrAHStngINl/view?usp=sharing

nat-pat.pkt	Escenario para práctica de PAT (NAT Overload).
https://drive.google.com/file/d/1EPUKPa068IGk8efxXVvdD05oiLvqLVQT/view?usp=sharing






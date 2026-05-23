# 🛰️ Laboratorio de OSPF - Open Shortest Path First

## 📘 Introducción teórica

### ¿Qué es OSPF?

**OSPF (Open Shortest Path First)** es un protocolo de enrutamiento dinámico **basado en estado de enlace** (Link-State) que permite a los routers intercambiar información de topología para determinar las mejores rutas hacia las redes de destino.

Es un protocolo **estándar abierto (RFC 2328)**, ampliamente utilizado en redes medianas y grandes debido a su **velocidad de convergencia, eficiencia y escalabilidad.**

---

## ⚙️ Características principales

| Característica | Descripción |
|----------------|-------------|
| Tipo de protocolo | Estado de Enlace |
| Algoritmo | Dijkstra (SPF - Shortest Path First) |
| Métrica | Costo (basado en ancho de banda) |
| Actualizaciones | Solo cuando hay cambios en la topología |
| Áreas | Estructura jerárquica mediante áreas (backbone = Área 0) |
| Encapsulación | IP (Protocolo 89) |
| Autenticación | Soporta autenticación simple y MD5 |
| Convergencia | Rápida |
| Clase | Protocolo Interior (IGP) |

---

## 📡 Conceptos Clave

### 🔹 Router ID
Identificador único de cada router en el dominio OSPF (formato IP).  
Se elige en el siguiente orden:
1. Dirección IP más alta en loopback.
2. Si no hay loopback, la IP más alta en interfaces activas.

### 🔹 Áreas OSPF
OSPF divide la red en áreas para optimizar el procesamiento de información.  
- **Área 0 (Backbone)**: núcleo de la red.  
- **Otras áreas**: se conectan siempre al área 0.  
Esto permite una red más escalable y organizada.

### 🔹 Tipos de routers
| Tipo | Descripción |
|------|--------------|
| Internal Router | Todas las interfaces en la misma área. |
| Area Border Router (ABR) | Conecta múltiples áreas. |
| Backbone Router | Participa en el área 0. |
| Autonomous System Boundary Router (ASBR) | Conecta OSPF con otros protocolos (EIGRP, RIP, BGP). |

### 🔹 Tipos de redes OSPF
- **Broadcast** (Ethernet) → DR/BDR elegidos automáticamente.  
- **Point-to-Point** → No se elige DR/BDR.  
- **Non-Broadcast (NBMA)** → Se configura manualmente la vecindad.

---

## 📈 Ventajas de OSPF

✅ Estandarizado (interoperable entre fabricantes)  
✅ Soporta VLSM y CIDR  
✅ Convergencia rápida  
✅ Escalable y jerárquico  
✅ Actualizaciones eficientes  

---

## 🧠 Ejercicios prácticos en Packet Tracer

### 🧩 Ejercicio 1 - Configuración básica de OSPF entre dos routers

**Objetivo:** Configurar OSPF entre dos routers y verificar la tabla de enrutamiento.

**Topología:**

R1 --- R2

**Tareas:**
1. Asignar direcciones IP a las interfaces.  
2. Activar OSPF (`router ospf 1`) en ambas.  
3. Anunciar las redes conectadas con `network`.  
4. Verificar con `show ip route` y `show ip ospf neighbor`.

---

### 🧩 Ejercicio 2 - OSPF con tres routers en línea

**Objetivo:** Comprobar la propagación de rutas.

**Topología:**

R1 --- R2 --- R3

**Tareas:**
1. Configurar IPs y OSPF en todos.  
2. Anunciar redes LAN y WAN.  
3. Verificar si R1 aprende las redes de R3 y viceversa.  
4. Probar conectividad con `ping`.

---

### 🧩 Ejercicio 3 - Elección de DR/BDR en red Broadcast

**Objetivo:** Observar la elección de DR/BDR en una red Ethernet.

**Topología:**

   SW
 / | \
R1 R2 R3

**Tareas:**
1. Conectar tres routers a un switch.  
2. Activar OSPF en las interfaces conectadas.  
3. Verificar con `show ip ospf neighbor` quién es DR y BDR.  
4. Cambiar la prioridad OSPF (`ip ospf priority`) para forzar un nuevo DR.

---

### 🧩 Ejercicio 4 - OSPF con múltiples áreas

**Objetivo:** Implementar una red jerárquica con Área 0 y Área 1.

**Topología:**

R1 --- R2 --- R3
Área 0 Área 1


**Tareas:**
1. R2 será el ABR (conecta Área 0 y Área 1).  
2. Configurar `router ospf 1` y asignar áreas correctamente.  
3. Verificar rutas inter-área (`show ip route ospf`).  

---

### 🧩 Ejercicio 5 - OSPF + Loopback y Router ID

**Objetivo:** Comprender cómo OSPF selecciona el Router ID.

**Topología:**

R1 --- R2

**Tareas:**
1. Configurar loopbacks en ambos routers (ej. 1.1.1.1/32 y 2.2.2.2/32).  
2. Activar OSPF y verificar el Router ID (`show ip ospf`).  
3. Cambiar manualmente el Router ID (`router-id 10.10.10.10`) y reiniciar el proceso.  

---

## 🔍 Comandos útiles

| Comando | Descripción |
|----------|--------------|
| `show ip route` | Muestra la tabla de enrutamiento |
| `show ip ospf neighbor` | Vecinos OSPF detectados |
| `show ip ospf interface` | Detalles de interfaces OSPF |
| `show ip protocols` | Protocolos de enrutamiento activos |
| `clear ip ospf process` | Reinicia el proceso OSPF |

---

## 🎯 Resultado esperado

Al finalizar los ejercicios, el estudiante deberá:
- Comprender el funcionamiento del protocolo OSPF.  
- Configurar redes OSPF básicas y jerárquicas.  
- Interpretar tablas de enrutamiento.  
- Diagnosticar y ajustar el comportamiento de OSPF (DR/BDR, Router ID, áreas).  

---

## 📚 Recursos recomendados

- Cisco Networking Academy: *Routing Protocols and Concepts*  
- RFC 2328: *OSPF Version 2*  
- Packet Tracer 8.x o superior  

---






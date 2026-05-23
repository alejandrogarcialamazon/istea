# 🧭 Introducción a EIGRP (Enhanced Interior Gateway Routing Protocol)

## 📘 Fundamentos Teóricos

**EIGRP (Enhanced Interior Gateway Routing Protocol)** es un protocolo de **enrutamiento dinámico** desarrollado por Cisco, clasificado como **híbrido** (con características tanto de protocolos de distancia vector como de estado de enlace).

Fue diseñado para ser **eficiente, rápido y fácil de configurar**, especialmente en redes medianas y grandes.

---

## 🧩 Características principales

| Característica | Descripción |
|----------------|-------------|
| **Tipo** | Protocolo de enrutamiento dinámico interior (IGP) |
| **Algoritmo** | DUAL (Diffusing Update Algorithm) |
| **Clasificación** | Híbrido (mezcla de vector distancia y estado de enlace) |
| **Métrica** | Calcula el costo usando **ancho de banda, retardo, carga y confiabilidad** |
| **Vecinos** | Establece relaciones adyacentes mediante paquetes “Hello” |
| **Actualizaciones** | Solo envía actualizaciones **parciales y dirigidas** cuando hay cambios |
| **Balanceo de carga** | Admite **ECMP (Equal-Cost Multipath)** y **variance** (rutas desiguales) |
| **Autenticación** | Soporta autenticación MD5 |
| **Protocolo de transporte** | Propietario (no usa TCP/UDP, sino IP protocolo 88) |

---

## ⚙️ Funcionamiento básico

1. **Descubrimiento de vecinos**  
   Los routers EIGRP intercambian mensajes “Hello” en cada interfaz activa para detectar vecinos.

2. **Formación de tabla de vecinos**  
   Cada router mantiene una **tabla de vecinos** con los routers adyacentes detectados.

3. **Tabla de topología**  
   EIGRP construye una tabla de topología con todas las rutas aprendidas y sus métricas asociadas.

4. **Selección de rutas**  
   Usa el **algoritmo DUAL** para elegir la mejor ruta (**sucesor**) y mantener rutas de respaldo (**feasible successors**).

---

## 📊 Métrica de EIGRP

La **métrica compuesta** se calcula con la siguiente fórmula simplificada:

\[
Métrica = (10^7 / Ancho\ de\ banda\ más\ bajo) + Retardo\ total
\]

Solo **ancho de banda** y **retardo** se usan por defecto.  
Se pueden incluir también **carga** y **confiabilidad**, pero normalmente se omiten.

---

## 🧠 Tipos de tablas en EIGRP

| Tabla | Contenido |
|--------|------------|
| **Tabla de vecinos** | Lista de routers EIGRP conectados directamente. |
| **Tabla de topología** | Rutas aprendidas y métricas detalladas. |
| **Tabla de enrutamiento** | Mejor ruta seleccionada hacia cada red. |

---

## 🧰 Mensajes EIGRP

| Tipo de mensaje | Función |
|-----------------|----------|
| **Hello** | Descubrimiento y mantenimiento de vecinos. |
| **Update** | Envío de información de rutas nuevas o cambiadas. |
| **Query** | Solicitud de información de ruta cuando una red deja de estar disponible. |
| **Reply** | Respuesta a una Query. |
| **ACK** | Confirma la recepción de actualizaciones. |

---

## 🔧 Configuración básica en routers Cisco

enable
configure terminal
router eigrp 10
 network 192.168.1.0 0.0.0.255
 network 192.168.2.0 0.0.0.255
 no auto-summary
end
write memory

##
10 es el AS (Autonomous System), que debe coincidir entre los routers vecinos.

no auto-summary evita el resumen automático de redes de clase A/B/C.


🎯 Objetivo de las prácticas

Comprender el funcionamiento del protocolo EIGRP.

Configurarlo correctamente en routers Cisco.

Verificar adyacencias y tablas de enrutamiento.

Probar balanceo de carga, rutas de respaldo y autenticación.

Identificar métricas y procesos del algoritmo DUAL.


🧪 Ejercicios Prácticos en Cisco Packet Tracer

⚙️ Nivel: Inicial / Intermedio
Todos los ejercicios usan routers Cisco 2911 o 1941 con PCs simulando hosts finales.

🧩 Ejercicio 1 – Configuración básica de EIGRP
🎯 Objetivo

Establecer comunicación dinámica entre tres routers mediante EIGRP.

🖥️ Topología sugerida

PC1 --- R1 --- R2 --- R3 --- PC2

⚙️ Configuración

En cada router:

R1
hostname R1
interface g0/0
 ip address 192.168.10.1 255.255.255.0
 no shutdown
interface g0/1
 ip address 10.0.12.1 255.255.255.0
 no shutdown
router eigrp 10
 network 192.168.10.0 0.0.0.255
 network 10.0.12.0 0.0.0.255
 no auto-summary

R2
hostname R2
interface g0/0
 ip address 10.0.12.2 255.255.255.0
 no shutdown
interface g0/1
 ip address 10.0.23.2 255.255.255.0
 no shutdown
router eigrp 10
 network 10.0.12.0 0.0.0.255
 network 10.0.23.0 0.0.0.255
 no auto-summary

R3
hostname R3
interface g0/0
 ip address 10.0.23.3 255.255.255.0
 no shutdown
interface g0/1
 ip address 192.168.20.1 255.255.255.0
 no shutdown
router eigrp 10
 network 192.168.20.0 0.0.0.255
 network 10.0.23.0 0.0.0.255
 no auto-summary


🧠 Verificación
show ip eigrp neighbors
show ip route eigrp

✅ Resultado esperado:
Los routers forman adyacencias y las PCs pueden hacer ping extremo a extremo.

🧩 Ejercicio 2 – Visualización de la tabla de topología
🎯 Objetivo

Explorar la tabla de topología EIGRP y comprender los conceptos de sucesor y feasible successor.

🖥️ Topología

Usar la misma del Ejercicio 1.

🔍 Verificación
show ip eigrp topology


✅ Resultado esperado:

“Successor” → mejor ruta actual

“Feasible Successor” → ruta de respaldo lista en caso de falla

🧩 Ejercicio 3 – Balanceo de carga en EIGRP
🎯 Objetivo

Configurar rutas con igual costo para activar el balanceo de carga.

🖥️ Topología

R1 --- R2 --- R3
 \           /
  --- R4 ----


⚙️ Configuración

Configurar EIGRP en todos con el mismo AS (10), y asegurarse de que las dos rutas desde R1 a R3 tengan el mismo ancho de banda y retardo.

Verificar con:

show ip route


✅ Resultado esperado:
EIGRP instalará dos rutas hacia el mismo destino (ECMP).


⚙️ Configuración ejemplo (R1 y R2)
interface g0/1
 ip authentication mode eigrp 10 md5
 ip authentication key-chain eigrp 10 KEY-EIGRP
!
key chain KEY-EIGRP
 key 1
  key-string itenaccion


✅ Resultado esperado:
La vecindad solo se establece si las claves coinciden.
Si no, el comando show ip eigrp neighbors mostrará 0 vecinos.


🧩 Ejercicio 5 – Prueba de convergencia ante fallas
🎯 Objetivo

Observar el comportamiento del protocolo EIGRP ante la caída de una interfaz.

🖥️ Topología

Usar la del Ejercicio 1.

🧩 Pasos

Establecer conectividad entre todos los routers.

Apagar la interfaz g0/0 de R2:

interface g0/0
shutdown

Observar la reacción en R1 y R3:
show ip eigrp topology
show ip route

Volver a levantar la interfaz:
no shutdown

✅ Resultado esperado:
EIGRP detecta la pérdida del vecino, elimina la ruta y reconverge automáticamente al restaurarse el enlace.



















































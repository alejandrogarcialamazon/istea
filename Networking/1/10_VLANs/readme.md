# Laboratorio de VLANs en Cisco Packet Tracer

### 20 casos de uso práctico (10 fundamentales + 10 avanzados)

---

## Introducción

Una red de área local tradicional sin segmentación lógica concentra a todos los equipos en un mismo dominio de broadcast: cada trama ARP, DHCP o de descubrimiento de servicios se replica hacia todos los puertos. En entornos pequeños es tolerable; en oficinas, aulas o centros de datos el crecimiento del tráfico innecesario degrada el rendimiento y amplía la superficie de ataque (un host comprometido puede escuchar o perturbar tráfico ajeno).

Las **VLANs (Virtual Local Area Networks)** resuelven parte de ese problema al dividir un switch (o una red de switches) en **dominios de broadcast independientes** sin necesidad de cablear redes físicas separadas. Cada VLAN se identifica por un número (1–4094 en estándar 802.1Q) y se comporta, a efectos de capa 2, como una red distinta: los hosts de la VLAN 10 no reciben broadcasts de la VLAN 20 salvo que exista un dispositivo de capa 3 que los interconecte.

En estos laboratorios trabajarás con **Cisco IOS** en Packet Tracer, replicando escenarios habituales en empresas:

| Concepto | Qué aprenderás |
|----------|----------------|
| VLAN de acceso | Aislar departamentos (ventas, IT, invitados) |
| Enlace troncal (Trunk) | Transportar varias VLANs entre switches |
| VLAN nativa | Tráfico sin etiqueta 802.1Q en el trunk |
| SVI / VLAN de gestión | Administrar el switch por IP |
| Router-on-a-Stick | Enrutar entre VLANs con un solo puerto físico |
| Buenas prácticas | Seguridad, documentación, verificación sistemática |

**Metodología recomendada en cada caso:**

1. Montar la topología indicada y etiquetar VLANs en el diagrama.
2. Aplicar la configuración por bloques (VLAN → puertos → trunk → routing).
3. Ejecutar **todas** las comprobaciones listadas antes de pasar al siguiente caso.
4. Anotar en un cuaderno de laboratorio: comando usado, salida esperada y resultado obtenido.
5. Si algo falla, usar la sección **Troubleshooting rápido** al final antes de pedir ayuda.

---

## Requisitos previos

| Requisito | Detalle |
|-----------|---------|
| Software | Cisco Packet Tracer **8.2 o superior** |
| IOS | Modo usuario (`>`), privilegiado (`#`), configuración global (`config`) |
| Redes | IPv4, máscaras, puerta de enlace por defecto, ping |
| Topología | Saber conectar PCs, switches 2960 (o equivalente) y router 2911/1941 |

**Comandos de referencia que usarás a menudo:**

```text
enable
configure terminal
end | exit
copy running-config startup-config
write memory          ! equivalente en muchos equipos
```

---

## Conceptos clave (léelos antes del Caso 1)

### Modos de puerto en un switch

- **Access:** un solo VLAN por puerto; tráfico sin etiqueta hacia el host.
- **Trunk:** transporta múltiples VLANs con etiquetas **802.1Q** entre switches (o hacia un router con subinterfaces).

### VLAN 1

Por defecto todos los puertos pertenecen a la **VLAN 1**. En producción se evita usar VLAN 1 para datos o gestión; se dejan los puertos no usados en una VLAN “basura” o `shutdown`.

### Comunicación entre VLANs

Las VLANs **no se enrutan solas**. Hace falta un **router**, un **switch capa 3 (L3)** con SVIs, o un firewall. Sin eso, el ping entre subredes distintas fallará aunque el cableado sea correcto.

### VLAN nativa en un trunk

Debe coincidir en **ambos extremos** del enlace. Un desajuste no siempre rompe el trunk, pero genera fugas de tráfico o vulnerabilidades (ataques de VLAN hopping en entornos reales).

---

# Casos de uso prácticos — Bloque 1 (Fundamentos 1–10)

---

## Caso 1: Creación de VLANs básicas

### Objetivo

Crear VLANs con identificador numérico y nombre descriptivo, y verificar su existencia en la base de datos del switch.

### Contexto para el alumno

La numeración de VLANs es una convención de la organización (por ejemplo: 10 ventas, 20 IT, 30 invitados). El nombre (`name`) no afecta al funcionamiento del protocolo, pero facilita auditorías y documentación.

### Topología sugerida

- 1× Switch Cisco 2960 (sin PCs obligatorias en este caso).

### Configuración

```text
Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name VENTAS
Switch(config-vlan)# exit
Switch(config)# vlan 20
Switch(config-vlan)# name IT
Switch(config-vlan)# exit
Switch(config)# end
```

### Verificación y pruebas

```text
Switch# show vlan brief
Switch# show vlan id 10
```

| Comprobación | Resultado esperado |
|--------------|-------------------|
| VLAN 10 y 20 listadas | Estado `active`, nombres correctos |
| Puertos asignados | Ningún puerto en 10/20 aún (salvo que ya existiera config) |
| VLAN 1 | Sigue presente como VLAN por defecto |

### Buena práctica

Reservar rangos por departamento y documentarlos en una tabla (evitar crear VLANs “al azar” que luego choquen con otras sedes).

---

## Caso 2: Asignación de puertos a VLANs (modo access)

### Objetivo

Asociar interfaces físicas a VLANs de acceso y comprobar aislamiento de capa 2 entre VLANs distintas.

### Contexto

Cada puerto access pertenece a **una** VLAN. Dos PCs en la misma VLAN y misma subred IP deberían hacer ping; en VLANs diferentes, sin router, el ping debe **fallar**.

### Topología

- Switch 2960.
- 4 PCs: PC1 y PC2 → VLAN 10 (192.168.10.0/24); PC3 y PC4 → VLAN 20 (192.168.20.0/24).
- Ejemplo IPs: PC1 `192.168.10.10/24`, PC2 `192.168.10.11/24`, PC3 `192.168.20.10/24`, PC4 `192.168.20.11/24`.

### Configuración en el switch

```text
Switch# configure terminal
Switch(config)# interface range fastEthernet 0/1 - 2
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
Switch(config-if-range)# exit
Switch(config)# interface range fastEthernet 0/3 - 4
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 20
Switch(config-if-range)# end
```

### Verificación y pruebas

```text
Switch# show vlan brief
Switch# show interfaces status
```

Desde Packet Tracer o CLI de las PCs:

| Prueba | Comando / acción | Esperado |
|--------|------------------|----------|
| Misma VLAN | `ping 192.168.10.11` desde PC1 | Éxito |
| Otra VLAN | `ping 192.168.20.10` desde PC1 | Fallo (timeout / unreachable) |
| Tabla MAC | `show mac address-table` en switch | MACs aprendidas en puertos Fa0/1–4 |

### Buena práctica

Configurar siempre `switchport mode access` de forma explícita (no depender del modo automático en entornos de examen ni en producción).

---

## Caso 3: VLAN de gestión y acceso remoto al switch

### Objetivo

Crear una VLAN dedicada a administración, asignar una **SVI** (Switch Virtual Interface) y comprobar conectividad de gestión desde una PC.

### Contexto

Los técnicos necesitan una IP en el switch para SSH, SNMP o monitoreo. Esa IP vive en una interfaz lógica `interface vlan X`, no en un puerto físico.

### Topología

- Switch 2960.
- 1 PC administración: `192.168.99.10/24`, gateway no obligatorio si solo hace ping al switch.

### Configuración

```text
Switch(config)# vlan 99
Switch(config-vlan)# name ADMIN
Switch(config-vlan)# exit
Switch(config)# interface vlan 99
Switch(config-if)# ip address 192.168.99.2 255.255.255.0
Switch(config-if)# no shutdown
Switch(config)# interface fastEthernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 99
Switch(config-if)# description PC-ADMIN
```

Opcional (solo si el laboratorio incluye gateway):

```text
Switch(config)# ip default-gateway 192.168.99.1
```

### Verificación y pruebas

```text
Switch# show ip interface brief
Switch# show vlan brief
```

| Prueba | Esperado |
|--------|----------|
| Ping desde PC → `192.168.99.2` | Éxito |
| `show ip interface brief` | `Vlan99` up/up con IP correcta |
| Puerto Fa0/1 | En VLAN 99 en `show vlan brief` |

### Buena práctica

No usar VLAN 1 para gestión. Restringir quién puede alcanzar la VLAN 99 (ACL o red de administración separada en escenarios avanzados).

---

## Caso 4: Comunicación entre VLANs (Router-on-a-Stick)

### Objetivo

Permitir routing entre VLANs mediante subinterfaces 802.1Q en un router con un único enlace físico al switch.

### Contexto

Cada VLAN es una subred distinta. El router actúa como **puerta de enlace por defecto** para cada subred. El enlace switch–router debe ser **trunk**; las subinterfaces del router llevan `encapsulation dot1Q <vlan-id>`.

### Topología

- Switch con VLAN 10 (192.168.10.0/24) y VLAN 20 (192.168.20.0/24).
- Router R1 conectado a Fa0/24 del switch (trunk).
- PCs: gateway `192.168.10.1` y `192.168.20.1` respectivamente.

### Configuración — Switch (trunk hacia router)

```text
Switch(config)# interface fastEthernet 0/24
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk allowed vlan 10,20
```

Puertos access a PCs en VLAN 10 y 20 (como en Caso 2).

### Configuración — Router

```text
Router(config)# interface gigabitEthernet 0/0
Router(config-if)# no shutdown
Router(config-if)# exit
Router(config)# interface gigabitEthernet 0/0.10
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0
Router(config-subif)# exit
Router(config)# interface gigabitEthernet 0/0.20
Router(config-subif)# encapsulation dot1Q 20
Router(config-subif)# ip address 192.168.20.1 255.255.255.0
```

### Verificación y pruebas

En el router:

```text
Router# show ip interface brief
Router# show interfaces trunk    ! en switch
```

| Prueba | Esperado |
|--------|----------|
| Ping PC VLAN10 → gateway .1 | Éxito |
| Ping PC VLAN10 → PC VLAN20 | Éxito si ambas PCs tienen gateway correcto |
| Ping PC VLAN10 → PC VLAN20 sin gateway en PC | Fallo (revisar default gateway) |

### Buena práctica

Activar `no shutdown` en interfaz física **y** comprobar subinterfaces. Sin trunk en el switch, las subinterfaces quedan “up” pero no pasan tráfico etiquetado.

---

## Caso 5: Enlace Trunk entre dos switches

### Objetivo

Extender VLANs entre dos switches por un único enlace troncal.

### Contexto

Sin trunk, cada switch tendría VLANs locales aisladas. El trunk etiqueta las tramas con el VLAN ID para que el switch remoto sepa a qué dominio de broadcast pertenecen.

### Topología

- Switch1: PC-A VLAN 10 en Fa0/1.
- Switch2: PC-B VLAN 10 en Fa0/1.
- Enlace trunk Switch1 Fa0/24 ↔ Switch2 Fa0/24.

IPs ejemplo: PC-A `192.168.10.10/24`, PC-B `192.168.10.20/24` (misma subred).

### Configuración (ambos switches)

```text
! Crear VLAN 10 en AMBOS switches
vlan 10
 name VENTAS
exit

interface fastEthernet 0/24
 switchport mode trunk
 switchport trunk allowed vlan 10
 description TRUNK-SW2
```

En puertos de PCs: access VLAN 10.

### Verificación y pruebas

```text
show interfaces trunk
show vlan brief
```

| Prueba | Esperado |
|--------|----------|
| Ping PC-A → PC-B | Éxito (misma VLAN y subred) |
| `show interfaces trunk` | Modo `on` o `trunk`, VLAN 10 permitida |
| PC en VLAN 20 (si solo existe en un switch) | Sin comunicación cruzada hasta crear VLAN 20 en ambos |

### Buena práctica

Crear la VLAN en **todos** los switches donde haya puertos access de esa VLAN; el trunk solo transporta IDs existentes en la base de datos.

---

## Caso 6: VLAN nativa en enlace Trunk

### Objetivo

Cambiar la VLAN nativa del trunk (por defecto suele ser 1) y verificar coherencia en ambos lados.

### Contexto

La VLAN nativa transporta tráfico **sin etiqueta** 802.1Q. En enlaces entre switches Cisco, la VLAN nativa debe coincidir. Se suele elegir una VLAN dedicada no usada para datos de usuario.

### Topología

- Misma que Caso 5, con trunk entre dos switches.

### Configuración (en ambos extremos)

```text
interface fastEthernet 0/24
 switchport mode trunk
 switchport trunk native vlan 99
 switchport trunk allowed vlan 10,20,99
```

Crear `vlan 99` con nombre `NATIVE` en ambos switches.

### Verificación y pruebas

```text
show interfaces trunk
```

| Campo en salida | Esperado |
|-----------------|----------|
| Native vlan | 99 en ambos switches |
| Operational Mode | trunk |

**Prueba de coherencia:** configura temporalmente native vlan 1 en un solo extremo y observa mensajes o comportamiento errático; vuelve a 99 en ambos.

### Buena práctica

Documentar la VLAN nativa en el diagrama de red. No usar la VLAN nativa para asignar hosts de usuario si puede evitarse.

---

## Caso 7: Restricción de VLANs permitidas en un Trunk

### Objetivo

Limitar qué VLANs atraviesan un enlace troncal (`allowed vlan`).

### Contexto

Principio de **mínimo privilegio** en capa 2: solo las VLANs necesarias deben cruzar cada trunk (reduce broadcast y riesgo en enlaces hacia otras plantas).

### Topología

- Trunk con VLANs 10, 20 y 30 definidas en el switch; solo 10 y 20 deben pasar el enlace.

### Configuración

```text
interface fastEthernet 0/24
 switchport mode trunk
 switchport trunk allowed vlan 10,20
! Para añadir sin reescribir todo:
! switchport trunk allowed vlan add 30
```

### Verificación y pruebas

```text
show interfaces trunk
```

| Prueba | Esperado |
|--------|----------|
| PC VLAN 10 a través del trunk | Comunicación OK |
| PC VLAN 30 solo más allá del trunk restringido | Sin paso si 30 no está en `allowed` |
| Añadir VLAN 30 con `add` | Tráfico VLAN 30 empieza a pasar sin borrar 10,20 |

### Buena práctica

Usar `switchport trunk allowed vlan add <id>` en lugar de redefinir la lista completa en producción (evita cortes accidentales).

---

## Caso 8: Puerta de enlace y conectividad extremo a extremo

### Objetivo

Integrar VLANs, trunk y router-on-a-stick verificando que **cada PC** tenga IP, máscara y **default gateway** correctos.

### Contexto

El error más frecuente en laboratorio no es la VLAN, sino una gateway mal puesta o ausente. Este caso obliga a validar la pila completa L2 + L3.

### Topología

- 2 VLANs, 2 switches en trunk, router-on-a-stick, 2 PCs por VLAN (4 PCs total).

### Lista de comprobación (checklist)

| Elemento | Valor ejemplo VLAN 10 |
|----------|------------------------|
| Subred | 192.168.10.0/24 |
| Gateway PC | 192.168.10.1 (subinterface .10 del router) |
| Subinterfaz router | `encapsulation dot1Q 10`, IP .1 |
| Puerto switch hacia PC | access vlan 10 |
| Puerto hacia router | trunk, allowed 10,20 |

### Pruebas obligatorias

1. Ping PC → su gateway (debe funcionar).
2. Ping PC → otro PC **misma VLAN** en otro switch (trunk OK).
3. Ping PC → PC **otra VLAN** (routing OK).
4. `traceroute` desde PC a PC otra VLAN (debe mostrar el router como salto).

### Buena práctica

Dibujar una tabla: PC | IP | Máscara | Gateway | VLAN | Puerto switch.

---

## Caso 9: Eliminación segura de VLANs y limpieza de puertos

### Objetivo

Borrar VLANs no usadas y devolver puertos a un estado conocido sin dejar configuraciones huérfanas.

### Contexto

Las VLANs activas con puertos asignados **no** se pueden eliminar hasta reasignar o apagar esos puertos. Orden correcto: mover puertos → luego `no vlan`.

### Procedimiento

```text
! 1. Mover puerto a otra VLAN o shutdown
interface fastEthernet 0/5
 shutdown
 exit

! 2. Eliminar VLAN vacía
no vlan 30

! 3. Guardar
copy running-config startup-config
```

### Verificación

```text
show vlan brief
show run | section vlan
```

| Prueba | Esperado |
|--------|----------|
| `no vlan 30` con puertos aún en 30 | IOS rechaza o advierte |
| Tras mover puertos | VLAN 30 desaparece de `show vlan brief` |

### Buena práctica

Nunca eliminar VLANs en horario productivo sin ventana de mantenimiento y backup de configuración.

---

## Caso 10: Troubleshooting sistemático de VLANs

### Objetivo

Diagnosticar fallos típicos usando comandos `show` sin “reconfigurar al azar”.

### Escenarios de fallo sugeridos (el docente o tú mismo los introduces)

1. Puerto en VLAN equivocada.
2. Trunk apagado o en modo access.
3. VLAN no creada en el switch remoto.
4. Native VLAN distinta en un extremo del trunk.
5. Gateway incorrecta en la PC.

### Comandos de diagnóstico

```text
show vlan brief
show interfaces status
show interfaces trunk
show spanning-tree vlan 10    ! si STP está habilitado
show mac address-table
show ip interface brief
ping <gateway>               ! desde PC
```

### Plantilla de informe (para entregar)

| Paso | Hallazgo | Acción correctiva |
|------|----------|-------------------|
| 1 | | |
| 2 | | |

### Buena práctica

Seguir el modelo **capa por capa**: físico (link up) → VLAN/puerto → trunk → IP/gateway → routing.

---

# Casos de uso prácticos — Bloque 2 (Avanzados y buenas prácticas 11–20)

---

## Caso 11: Desactivar negociación DTP (`switchport nonegotiate`)

### Objetivo

Forzar trunk explícito y evitar que un puerto negocie dinámicamente un enlace no deseado.

### Contexto

**DTP (Dynamic Trunking Protocol)** puede convertir enlaces en trunk automáticamente si el vecino también negocia. En redes seguras se desactiva la negociación y se fija `switchport mode trunk` o `access`.

### Configuración

```text
interface fastEthernet 0/24
 switchport mode trunk
 switchport nonegotiate
 switchport trunk allowed vlan 10,20
```

### Verificación

```text
show interfaces fa0/24 switchport
```

| Comprobación | Esperado |
|--------------|----------|
| Administrative Mode | trunk |
| Negotiation of Trunking | Off / nonegotiate |

### Buena práctica

En puertos hacia PCs: `switchport mode access` + `switchport nonegotiate` (donde el IOS lo permita en el modelo).

---

## Caso 12: Voice VLAN (datos + voz en el mismo puerto)

### Objetivo

Configurar un puerto con VLAN de datos (access) y VLAN de voz para teléfonos IP Cisco (escenario típico de oficina).

### Topología

- Switch + PC + IP Phone (en Packet Tracer: Phone-PT) en cadena, o puerto al teléfono con PC detrás.

### Configuración

```text
vlan 10
 name DATA
vlan 150
 name VOICE
exit

interface fastEthernet 0/1
 switchport mode access
 switchport access vlan 10
 switchport voice vlan 150
 mls qos trust cos    ! si el modelo lo soporta en PT
```

### Verificación

```text
show interfaces fa0/1 switchport
```

Comprobar que el teléfono recibe VLAN voz y la PC VLAN datos (según topología del simulador).

### Buena práctica

Separar voz y datos para QoS y para facilitar políticas de seguridad distintas.

---

## Caso 13: Seguridad — VLAN 1 y puertos no utilizados

### Objetivo

Aplicar hardening básico: no dejar puertos en VLAN 1 por defecto ni activos sin uso.

### Configuración sugerida

```text
vlan 999
 name UNUSED
exit

interface range fastEthernet 0/10 - 24
 description NO-CONEXION
 switchport mode access
 switchport access vlan 999
 shutdown
```

Mover puertos en uso fuera de VLAN 1 explícitamente.

### Verificación

```text
show vlan brief
show interfaces status | include notconnect
```

| Prueba | Esperado |
|--------|----------|
| Puertos sin cable | `shutdown`, VLAN 999 |
| Tráfico desde VLAN 1 hacia usuarios | No debería existir en puertos de usuario |

### Buena práctica

Estándar corporativo: “todo puerto no documentado = shutdown + VLAN basura”.

---

## Caso 14: DHCP entre VLANs (`ip helper-address`)

### Objetivo

Permitir que PCs de varias VLANs obtengan IP de un servidor DHCP central mediante reenvío UDP en el router.

### Topología

- Servidor DHCP en VLAN 99 (192.168.99.0/24), IP servidor `192.168.99.100`.
- Clientes en VLAN 10 y 20.
- Router-on-a-stick con subinterfaces .10 y .20.

### Configuración — Router

```text
interface gigabitEthernet 0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.1 255.255.255.0
 ip helper-address 192.168.99.100
!
interface gigabitEthernet 0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.1 255.255.255.0
 ip helper-address 192.168.99.100
```

Servidor DHCP: pools para 10.0 y 20.0 con gateway y DNS correctos.

### Verificación

En PCs: modo DHCP. Comprobar IP asignada y ping al gateway.

```text
Router# show ip dhcp binding    ! si el router hace DHCP local; en PT ver en servidor
```

### Buena práctica

Un solo servidor DHCP bien segmentado es más fácil de auditar que pools duplicados en cada VLAN sin documentar.

---

## Caso 15: Documentación en interfaces (`description`)

### Objetivo

Etiquetar puertos y trunks para mantenimiento (buena práctica operativa).

### Configuración

```text
interface fastEthernet 0/1
 description PC-VENTAS-01
 switchport mode access
 switchport access vlan 10
!
interface fastEthernet 0/24
 description TRUNK-A-SW-CORE
 switchport mode trunk
```

### Verificación

```text
show interfaces description
show running-config interface fastEthernet 0/1
```

Entregar captura o texto con convención de nombres acordada en clase.

### Buena práctica

Formato consistente: `ROL-DISPOSITIVO-UBICACION` (ej. `ACC-PC-VENTAS-PB2`).

---

## Caso 16: Ampliar VLANs en trunk en caliente (`allowed vlan add`)

### Objetivo

Añadir una VLAN a un trunk existente sin eliminar las ya permitidas.

### Procedimiento

Estado inicial:

```text
switchport trunk allowed vlan 10,20
```

Añadir VLAN 30:

```text
switchport trunk allowed vlan add 30
```

### Verificación

| Antes de `add` | PC VLAN 30 detrás del trunk | Después de `add` |
|----------------|----------------------------|------------------|
| Sin VLAN 30 en allowed | Sin conectividad | Ping OK si VLAN existe en ambos switches |

Comparar con el error típico:

```text
switchport trunk allowed vlan 30
! Esto DEJA solo la 30 y rompe 10 y 20
```

### Buena práctica

Siempre preferir `add` / `remove` frente a reemplazar la lista entera.

---

## Caso 17: Spanning Tree y VLANs (introducción PVST+)

### Objetivo

Relacionar broadcast domains con STP: una instancia de spanning tree por VLAN en PVST+ (concepto; en Packet Tracer ver comportamiento básico).

### Actividad

1. Crear dos switches con trunk y VLAN 10.
2. Introducir un segundo enlace redundante entre switches (triángulo).
3. Observar qué puerto queda bloqueado:

```text
show spanning-tree vlan 10
show spanning-tree summary
```

### Verificación

| Comprobación | Esperado |
|--------------|----------|
| Un puerto en estado BLK/FWD según topología | Sin bucles de capa 2 en VLAN 10 |
| Cambio de root bridge (opcional) | Recomputación visible en `show spanning-tree` |

### Buena práctica

En redes reales, coordinar root bridge y costes por VLAN; no dejar valores por defecto en el núcleo sin diseño.

---

## Caso 18: Diagnóstico capa 2 vs capa 3

### Objetivo

Diferenciar síntomas: “no hay ping en la misma VLAN” (L2) frente a “hay ping en la VLAN pero no a otra subred” (L3).

### Tabla guía para alumnos

| Síntoma | Causa probable | Comando clave |
|---------|----------------|---------------|
| Misma VLAN, misma IP duplicada | Conflicto ARP | `show arp` en router, cambiar IP |
| Misma VLAN, distinta máscara | Subred mal definida | Revisar máscara PC |
| Misma VLAN, distinto switch, no ping | Trunk / VLAN no creada | `show vlan`, `show trunk` |
| Distinta VLAN, no ping, gateway OK en ambas | Router o subinterfaces | `show ip route`, `show ip int br` |
| Distinta VLAN, gateway mal | Default gateway PC | Config IP PC |

### Práctica

El docente rompe **un solo** parámetro; el alumno debe identificar la capa en menos de 15 minutos usando la tabla.

---

## Caso 19: Conciencia de seguridad — doble etiquetado (Double Tagging)

### Objetivo

Comprender el riesgo teórico del **VLAN hopping** por doble etiqueta 802.1Q (sin implementar ataque, solo prevención).

### Contexto pedagógico

Si un atacante envía tramas con doble etiqueta y la VLAN nativa del trunk procesa mal el tráfico, podría saltar a otra VLAN en diseños antiguos o mal configurados.

### Medidas preventivas (configurar y documentar)

1. Cambiar VLAN nativa a una VLAN no usada por usuarios (Caso 6).
2. Desactivar DTP en puertos hacia usuarios (`nonegotiate` + access).
3. No poner hosts en la VLAN nativa del trunk.
4. Usar `switchport trunk allowed vlan` restrictivo.

### Entregable

Redactar medio página: qué es doble etiquetado y qué tres controles aplicaste en tu topología del Caso 6.

### Buena práctica

En exámenes y empresas se valora la **conciencia** del riesgo, no reproducir exploits en la red del centro.

---

## Caso 20: Proyecto integrador — Empresa multi-departamento

### Objetivo

Diseñar e implementar una red completa que combine la mayoría de conceptos del laboratorio.

### Enunciado

Empresa **ISTEA-LAB** con:

| Departamento | VLAN | Subred | Requisito |
|--------------|------|--------|-----------|
| Ventas | 10 | 192.168.10.0/24 | 2 PCs |
| IT | 20 | 192.168.20.0/24 | 2 PCs |
| Invitados | 30 | 192.168.30.0/24 | 1 PC, sin acceso a otras VLANs salvo Internet si se simula |
| Administración | 99 | 192.168.99.0/24 | 1 PC + IP de gestión del switch |

**Infraestructura mínima:**

- 2 switches con trunk (allowed solo VLANs necesarias).
- 1 router router-on-a-stick.
- DHCP central en VLAN 99 con helper-address.
- Puertos no usados en VLAN 999 `shutdown`.
- `description` en todos los puertos activos.
- Native VLAN 999 en trunks (coherente en ambos lados).

### Criterios de evaluación (rúbrica sugerida)

| Criterio | Puntos |
|----------|--------|
| Topología montada y guardada (.pkt) | 15 |
| VLANs y nombres correctos | 15 |
| Trunks y allowed VLANs correctos | 20 |
| Routing / DHCP funcionando | 25 |
| Seguridad básica (999, native, nonegotiate) | 15 |
| Documentación + capturas de pruebas ping | 10 |

### Pruebas finales obligatorias

1. Ping intra-VLAN entre switches.
2. Ping inter-VLAN con gateway.
3. Obtención DHCP en al menos dos VLANs de usuario.
4. Ping a IP de gestión del switch desde VLAN 99.
5. Intento de ping desde Invitados hacia IT (debe fallar si se implementa ACL opcional; si no hay ACL, explicar por qué aún fallaría sin rutas — reforzar diseño).

### Entregables

- Archivo Packet Tracer.
- PDF o Markdown con tabla de direccionamiento y capturas de `show vlan brief`, `show interfaces trunk`, `show ip interface brief`.

---

## Troubleshooting rápido (referencia global)

| Problema | Solución habitual |
|----------|-------------------|
| `show vlan` no muestra la VLAN en switch remoto | `vlan X` + `name` en ese switch |
| Trunk no levanta | `switchport mode trunk` en ambos lados; cable correcto |
| Ping entre VLANs falla | Gateway en PC; subinterfaces router; trunk al router |
| Ping misma VLAN, distinto switch | Trunk allowed incluye esa VLAN; mismas máscaras |
| DHCP no funciona | `ip helper-address`; servidor en VLAN alcanzable; pools correctos |
| Cambié `allowed vlan` y corté todo | Restaurar lista con `10,20,...` o usar `add` |

---

## Glosario breve

| Término | Definición |
|---------|------------|
| **802.1Q** | Estándar de etiquetado VLAN en tramas Ethernet |
| **Access** | Puerto de un solo VLAN hacia el host |
| **Trunk** | Enlace que multiplexa varias VLANs |
| **SVI** | Interfaz virtual `interface vlan X` en el switch |
| **DTP** | Protocolo Cisco de negociación de trunk (evitar en puertos de usuario) |
| **Router-on-a-Stick** | Router con una interfaz física y varias subinterfaces dot1Q |
| **Native VLAN** | VLAN cuyo tráfico va sin etiqueta en el trunk |

---

## Recursos y cierre

- Repasa cada caso en orden; los casos 11–20 asumen dominio del bloque 1–10.
- Guarda siempre la configuración: `copy running-config startup-config`.
- Antes de entregar el Caso 20, pide a un compañero que “rompa” un cable o una VLAN y resuélvelo con la plantilla del Caso 10.

**Autor del laboratorio:** módulo ISTEA — Redes locales y conmutación.  
**Versión del documento:** 20 casos (10 fundamentales + 10 avanzados).

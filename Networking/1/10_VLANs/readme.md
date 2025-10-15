# 🧩 Laboratorio de VLANs en Cisco Packet Tracer  
### 10 Casos de Uso Práctico  

---

## 📘 Introducción

Las **VLANs (Virtual Local Area Networks)** permiten segmentar una red física en varias redes lógicas, mejorando la **seguridad**, **rendimiento** y **organización** del tráfico.

En estos laboratorios aprenderás paso a paso cómo:
- Crear VLANs en switches Cisco  
- Asignar puertos a VLANs  
- Configurar enlaces troncales (Trunk)  
- Interconectar VLANs mediante routers (Router-on-a-Stick)  
- Usar VLANs nativas y de gestión  

---

## 🧠 Requisitos previos

- Cisco Packet Tracer 8.2 o superior  
- Conocimientos básicos de comandos en IOS (modo EXEC y configuración)  
- Comprensión básica de redes (direcciones IP, máscaras, subredes)

---

# 🧪 Casos de Uso Prácticos

---

## 🧩 Caso 1: Creación de VLANs básicas

**Objetivo:** Aprender a crear VLANs y asignarles nombres.

**Topología sugerida:**  
Un switch Cisco 2960

**Pasos:**

Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name VENTAS
Switch(config-vlan)# exit
Switch(config)# vlan 20
Switch(config-vlan)# name IT
Switch(config-vlan)# exit
Switch# show vlan brief

Verificación:
show vlan brief

Confirmar que las VLANs 10 y 20 aparecen en la lista.

Observar que aún no hay puertos asignados.


🧩 Caso 2: Asignación de puertos a VLANs

Objetivo: Asociar puertos físicos a VLANs específicas.

Topología:
Switch 2960 con 4 PCs conectadas (2 por VLAN)

Pasos:
Switch> enable
Switch# configure terminal
Switch(config)# interface fastEthernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config)# interface fastEthernet 0/2
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 20
Switch# end
Switch# show vlan brief

Verificación:

PCs dentro de la misma VLAN pueden hacer ping entre sí.

No hay comunicación entre VLANs diferentes.


🧩 Caso 3: VLAN nativa y de gestión

Objetivo: Configurar VLAN de gestión (para administración remota del switch).

Topología:
Switch con 1 PC de administración conectada.

Pasos:
Switch> enable
Switch# configure terminal
Switch(config)# vlan 99
Switch(config-vlan)# name ADMIN
Switch(config)# interface vlan 99
Switch(config-if)# ip address 192.168.99.2 255.255.255.0
Switch(config-if)# no shutdown
Switch(config)# interface fastEthernet 0/1
Switch(config-if)# switchport access vlan 99

Verificación:

Desde la PC, hacer ping a la IP del switch (192.168.99.2).



🧩 Caso 4: Comunicación entre VLANs (Router-on-a-Stick)

Objetivo: Permitir comunicación entre VLANs usando un router.

Topología:
2 VLANs (10 y 20), switch conectado a router (G0/0).

Pasos:
Router> enable
Router# configure terminal
Router(config)# interface gigabitEthernet 0/0.10
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0
Router(config-subif)# exit
Router(config)# interface gigabitEthernet 0/0.20
Router(config-subif)# encapsulation dot1Q 20
Router(config-subif)# ip address 192.168.20.1 255.255.255.0
Router(config-subif)# exit
Router(config)# interface gigabitEthernet 0/0
Router(config-if)# no shutdown

Verificación:

PCs de VLAN10 y VLAN20 pueden comunicarse (ping cruzado).


🧩 Caso 5: Configurar enlace Trunk entre dos switches

Objetivo: Permitir que varias VLANs viajen por un solo enlace entre switches.

Topología:
Dos switches conectados por un enlace.

Pasos:
Switch1(config)# interface fastEthernet 0/24
Switch1(config-if)# switchport mode trunk
Switch2(config)# interface fastEthernet 0/24
Switch2(config-if)# switchport mode trunk

Verificación:

PCs conectadas a VLAN10 en ambos switches pueden comunicarse.

Otras VLANs permanecen aisladas.


🧩 Caso 6: VLAN nativa en enlace Trunk

Objetivo: Configurar una VLAN diferente como nativa.

Pasos:
Switch(config)# interface fastEthernet 0/24
Switch(config-if)# switchport trunk native vlan 99
Switch(config-if)# switchport trunk allowed vlan 10,20,99

Verificación:

Verificar con show interfaces trunk

Confirmar VLAN nativa: 99


🧩 Caso 7: Restricción de VLANs permitidas en un Trunk

Objetivo: Limitar qué VLANs pueden pasar por el enlace.

Pasos:
Switch(config)# interface fastEthernet 0/24
Switch(config-if)# switchport trunk allowed vlan 10,20











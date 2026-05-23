# 🧠 Ejercicios Prácticos de Linux

Bienvenido/a a la sección de **Ejercicios Prácticos de Linux**.  
Aquí encontrarás una colección de actividades diseñadas para **aprender los fundamentos del sistema operativo GNU/Linux** y comprender cómo se gestionan los procesos, archivos y flujos de información dentro del sistema.

---

## 🎯 Objetivo General

El propósito de este conjunto de prácticas es que el estudiante:
- Desarrolle **competencias operativas en entornos Linux**.
- Comprenda los **principios del shell y la línea de comandos**.
- Aplique los conceptos teóricos de **Sistemas Operativos I** en ejercicios concretos.
- Logre una base sólida para avanzar hacia temas más avanzados (administración, scripting, monitoreo, virtualización, etc.).

---

## 📚 Contenidos Principales

Los temas que se abordan a lo largo de las prácticas son:

### 🧩 1. Introducción al entorno Linux
- Estructura básica del sistema operativo.
- Jerarquía de directorios (`/`, `/home`, `/etc`, `/bin`, `/var`...).
- Tipos de usuarios y permisos.

### 💻 2. Comandos básicos del shell
- Navegación: `ls`, `cd`, `pwd`
- Manipulación de archivos: `cp`, `mv`, `rm`, `mkdir`, `rmdir`
- Información del sistema: `uname`, `uptime`, `df`, `du`, `whoami`, `free`

### 🧮 3. Entrada, salida y error estándar (stdin, stdout, stderr)
- Flujos básicos del sistema:
  - Entrada estándar (descriptor 0)
  - Salida estándar (descriptor 1)
  - Error estándar (descriptor 2)
- Redirecciones:
  - `>`  (sobrescribir salida)
  - `>>` (agregar al final)
  - `<`  (entrada desde archivo)
  - `2>` (redirigir errores)
  - `&>` (combinar stdout y stderr)
- Uso de `/dev/null` y control de flujo.
- **Tuberías (pipes)**: conectar comandos con `|` para crear cadenas de procesamiento.

### ⚙️ 4. Automatización con scripts Bash
- Estructura de un script (`#!/bin/bash`)
- Variables, condiciones y bucles básicos.
- Redirección de entradas/salidas dentro de scripts.
- Ejecución controlada con `if`, `for`, `while`.

### 🧰 5. Administración y gestión de procesos
- Comandos: `ps`, `top`, `kill`, `jobs`, `fg`, `bg`
- Prioridades de procesos (`nice`, `renice`)
- Control de ejecución y multitarea en shell.

---

## 📁 Estructura de esta carpeta

Cada subcarpeta contiene una práctica independiente con:
- Un archivo `README.md` explicativo (teoría, objetivo, pasos, **Tips**, desafío y **ejercicio extra**).
- Uno o más scripts `.sh` listos para ejecutar.
- Material adicional o ejemplos de resultados.

### Serie actual: STDIN, STDOUT y STDERR (01–20)

La carpeta `Ejercicios-STDIN-STDOUT-STDERR/` organiza **20 ejercicios progresivos**:

| Bloque | Ejercicios | Contenido |
|--------|------------|-----------|
| Fundamentos | 01–03 | `>`, `>>`, `<` |
| stderr | 04–05 | `2>`, `2>>` |
| Combinación | 06–10 | `&>`, separación, `/dev/null`, E/S combinadas |
| Pipes | 11–14 | `\|`, cadenas, `grep`, `wc` |
| stderr + pipes | 15–16 | comportamiento del pipe, `2>&1` |
| Integración | 17–20 | repaso, scripts, `if`, proyecto de logs |

**Recomendación:** completar los ejercicios en orden numérico; cada README indica prerequisitos.

Ejemplo de estructura:

```
/Ejercicios/
├── readme.md
└── Ejercicios-STDIN-STDOUT-STDERR/
    ├── 01-redireccion-salida-basica/
    │   ├── README.md
    │   └── script.sh
    ├── 02-redireccion-salida-append/
    │   ├── README.md
    │   └── script.sh
    ...
    └── 20-backup-logs-con-pipes-y-redireccion/
        ├── README.md
        └── script.sh
```

## 🧩 Cómo trabajar cada práctica

1. Leer el archivo `README.md` de la práctica correspondiente (respetar el orden 01→20 en la serie STDIN/STDOUT/STDERR).  
2. Ejecutar paso a paso los comandos indicados en el terminal.  
3. Revisar la sección **Tips** antes de pasar al siguiente ejercicio.  
4. Completar el **ejercicio extra** y el **desafío adicional**.  
5. Documentar tus observaciones y resultados para compartirlos o subirlos a tu repositorio personal.

---

## 🧭 Recomendaciones generales

- Practicá en una máquina virtual o entorno controlado (Ubuntu, Debian o Fedora).
- Explorá las páginas de ayuda (`man comando` o `comando --help`).
- No temas romper cosas: **aprender Linux es experimentar**.
- Usá los errores como parte del proceso de aprendizaje.

---

## 📖 Referencias recomendadas

- **Manual de Bash**: [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)
- **Guía de referencia de Linux**: [https://tldp.org/LDP/intro-linux/html/](https://tldp.org/LDP/intro-linux/html/)
---

### ✍️ Contexto


El contenido está orientado a estudiantes que inician su recorrido en el mundo Linux y buscan comprender cómo un sistema operativo gestiona la información, los procesos y los recursos del hardware.

---

> “La mejor forma de entender cómo funciona un sistema operativo…  
> es interactuar directamente con él.”



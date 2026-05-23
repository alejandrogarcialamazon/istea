# Ejercicio 18 – Redirección en scripts Bash

**Nivel:** avanzado | **Serie:** 18/20 — Automatización

**Prerequisitos:** ejercicios 01–10 y 17 (redirecciones en línea de comandos)

---

## Teoría

Las redirecciones escritas **dentro** de un script `.sh` se aplican a los comandos de ese script, igual que en la terminal. Esto permite:

- Generar logs automáticos en cada ejecución
- Separar salida correcta de errores sin intervención manual
- Reutilizar el mismo script en cron o systemd

Estructura mínima:

```bash
#!/bin/bash
comando > salida.log 2> errores.log
```

El script `script.sh` de esta carpeta crea archivos de log al ejecutarse. Corrélo con `bash script.sh` desde el directorio del ejercicio.

---

## Objetivo

Automatizar redirecciones dentro de un script y verificar los archivos generados.

---

## Comandos y operadores

- `bash script.sh`
- `echo`, `ls`
- `>`, `>>`, `2>`
- `cat`

---

## Pasos prácticos

1. Revisá el contenido de `script.sh` antes de ejecutarlo.
2. Ejecutá el script:

```bash
bash script.sh
```

3. Listá los archivos creados:

```bash
ls -l log_script.txt listado_etc.txt errores_script.txt 2>/dev/null
```

4. Mostrá el contenido de cada log:

```bash
cat log_script.txt
head listado_etc.txt
cat errores_script.txt
```

5. Ejecutá el script una segunda vez y observá qué archivos se sobrescriben y cuáles se acumulan.

---

## Explicación del resultado

Cada redirección en el script se evalúa cuando llega esa línea. Los archivos quedan en el directorio de trabajo desde el que lanzaste `bash script.sh`, no necesariamente donde está guardado el script (salvo que el script haga `cd` a su carpeta).

---

## Tips

- Para que el script siempre escriba en su propia carpeta: `cd "$(dirname "$0")"` al inicio.
- Dale permisos de ejecución: `chmod +x script.sh` y ejecutá `./script.sh`.
- En scripts largos, centralizá rutas en variables: `LOG_DIR="./logs"` y `mkdir -p "$LOG_DIR"`.

---

## Desafío adicional

Modificá `script.sh` para que acepte un argumento `$1` como nombre base del log (`bash script.sh mi_log` → `mi_log.txt`).

---

## Ejercicio extra

Creá `mi_script.sh` (o editá una copia) que haga lo siguiente:

1. Escriba la fecha de inicio en `ejecucion.log` con `>`.
2. Liste el directorio actual en `listado.log` con `>`.
3. Intente listar `/ruta_inexistente_xyz` y guarde el error en `errores.log` con `2>`.
4. Añada «Fin OK» a `ejecucion.log` con `>>`.

Ejecutalo y verificá los cuatro resultados con `cat`. El script debe comenzar con `#!/bin/bash`.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Shell Scripts*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

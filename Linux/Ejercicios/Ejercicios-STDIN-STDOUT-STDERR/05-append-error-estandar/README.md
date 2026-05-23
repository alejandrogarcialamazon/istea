# Ejercicio 05 – Append de error estándar

**Nivel:** básico | **Serie:** 05/20 — stderr

**Prerequisitos:** ejercicios 02 y 04 (`>>` y `2>`)

---

## Teoría

Así como `>>` añade stdout al final de un archivo, `2>>` añade stderr sin sobrescribir entradas anteriores:

```bash
comando 2>> errores.log
```

Es el patrón típico de **logs de errores acumulativos** en scripts y tareas programadas (cron), donde cada fallo debe quedar registrado junto con los anteriores.

| Operador | Flujo | Modo |
|----------|-------|------|
| `2>` | stderr | Sobrescribe |
| `2>>` | stderr | Append |

---

## Objetivo

Construir un archivo de log de errores que crezca con cada ejecución fallida, usando `2>>`.

---

## Comandos y operadores

- `ls`
- `2>>`
- `wc -l`, `cat`

---

## Pasos prácticos

1. Generá el primer error en el log:

```bash
ls /noexiste 2>> errores.log
```

2. Añadí más entradas con otros comandos inválidos:

```bash
cat /archivo_que_no_existe 2>> errores.log
ls /otra_ruta_falsa 2>> errores.log
```

3. Revisá el log completo:

```bash
cat errores.log
wc -l errores.log
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

Cada comando fallido agrega su mensaje de error al final de `errores.log`. La salida estándar de comandos exitosos no se mezcla en este archivo porque solo redirigiste stderr.

---

## Tips

- En scripts, conviene anteponer timestamp: `comando 2>> errores.log` puede combinarse con `echo "$(date): fallo" >> errores.log` en un bloque `||`.
- No confundas `2>>` con `>>`: el primero captura errores, el segundo captura salida normal.
- Revisá periódicamente el tamaño del log con `du -h errores.log` en entornos reales.

---

## Desafío adicional

Creá un script de tres líneas que ejecute tres `ls` a rutas inválidas, cada uno con `2>>`, y verificá que el log tiene tres bloques de mensajes.

---

## Ejercicio extra

Implementá un «registro de diagnóstico» en `diagnostico.log`:

1. Escribí una cabecera con `echo "=== Inicio $(date) ===" > diagnostico.log` (va a stdout, no es un error).
2. Registrá **solo errores** de estos comandos con `2>>`:
   - `ls /noexiste`
   - `grep "xyz" /noexiste`
3. Cerrá el registro con `echo "=== Fin $(date) ===" >> diagnostico.log`

**Verificación:** `diagnostico.log` debe tener cabecera, al menos dos mensajes de error y pie de registro.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

# Ejercicio 20 – Backup de logs con pipes y redirección

**Nivel:** integrador | **Serie:** 20/20 — Proyecto final de la serie

**Prerequisitos:** ejercicios 01–19 (redirección, pipes, stderr, scripts)

---

## Teoría

Este ejercicio integra varias técnicas en un flujo típico de administración:

1. **Leer** un log del sistema (`cat` o equivalente)
2. **Filtrar** líneas relevantes (`grep`)
3. **Duplicar** salida a pantalla y archivo (`tee`)
4. **Registrar** todo el resultado de la cadena (`&>`)

```bash
cat /var/log/syslog | grep error | tee errores.log &> resumen.txt
```

**Precisión sobre `tee` y `&>`:** `tee errores.log` escribe en el archivo y también pasa datos a stdout. El `&> resumen.txt` al final redirige stdout y stderr **de toda la tubería** según el orden de evaluación del shell; en la práctica, conviene verificar en tu sistema qué contiene `errores.log` y `resumen.txt` tras ejecutar.

**Nota de entorno:** en sistemas con **systemd journal** puede no existir `/var/log/syslog`. Alternativas:

```bash
journalctl -p err --no-pager 2>/dev/null | head -50 | tee errores.log
# o, si existe:
cat /var/log/syslog 2>/dev/null | grep -i error | head -20 | tee errores.log
```

---

## Objetivo

Diseñar un mini-flujo de extracción y respaldo de líneas de log usando pipes, `tee` y redirección combinada.

---

## Comandos y operadores

- `cat` o `journalctl`
- `grep`
- `tee`
- `&>`
- `|`

---

## Pasos prácticos

1. Comprobá qué logs existen en tu sistema:

```bash
ls -l /var/log/syslog /var/log/messages 2>/dev/null
journalctl --version 2>/dev/null
```

2. Adaptá y ejecutá la cadena (ajustá la ruta del log si hace falta):

```bash
cat /var/log/syslog 2>/dev/null | grep -i error | head -30 | tee errores.log &> resumen.txt
```

3. Revisá los archivos generados:

```bash
wc -l errores.log resumen.txt
head errores.log
head resumen.txt
```

4. Ejecutá `bash script.sh` solo si la ruta del log es válida en tu máquina; si falla, usá la variante con `journalctl` del apartado Teoría.

5. Documentá qué contiene cada archivo y si son idénticos o distintos.

---

## Explicación del resultado

Obtienes un subconjunto de líneas que contienen «error» (según `grep -i`). `tee` conserva una copia en `errores.log` mientras la cadena sigue. `resumen.txt` captura la salida global de la tubería según cómo Bash resuelva las redirecciones al final; por eso es importante **verificar** en tu entorno y no asumir ciegamente.

---

## Tips

- Para no perder datos, probá primero sin `&>`: `... | tee errores.log > resumen.txt`
- `grep -i error` captura también palabras como «terror» si no usás límites de palabra; considerá `grep -wi error` o patrones más estrictos.
- En producción, los backups de logs usan rotación, compresión (`gzip`) y permisos restrictivos.
- Ejecutá como usuario con permiso de lectura en `/var/log` o usá `sudo` solo en entornos de práctica autorizados.

---

## Desafío adicional

Añadí fecha al nombre del archivo: `errores_$(date +%Y%m%d).log` y automatizá la ejecución en un script con cron (solo en VM de práctica).

---

## Ejercicio extra (proyecto integrador)

Creá `backup_logs.sh` que:

1. Defina `LOG_ORIGEN` (syslog, messages o salida de `journalctl -p err --no-pager`).
2. Filtre líneas con «error» o «fail» (insensible a mayúsculas).
3. Guarde hasta 50 líneas en `backup/errores_YYYYMMDD.log` (creá el directorio `backup/`).
4. Escriba en `backup/resumen_YYYYMMDD.txt` cuántas líneas se guardaron (`wc -l`).
5. Redirija stderr del script a `backup/errores_script.log`.

Ejecutá el script dos veces el mismo día y comprobá si el archivo de errores se sobrescribe o acumula (decidí cuál comportamiento quieres y documentalo).

**Criterio de éxito:** existen archivos en `backup/` con contenido coherente y el script termina sin errores no capturados.

---

## Referencias

- `man tee`, `man grep`, `man journalctl`
- Apunte de clase: «Entrada y salida estándar en Bash»
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

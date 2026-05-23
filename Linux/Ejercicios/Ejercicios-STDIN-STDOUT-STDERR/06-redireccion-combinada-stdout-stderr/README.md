# Ejercicio 06 – Redirección combinada stdout y stderr

**Nivel:** básico | **Serie:** 06/20 — Combinación de flujos

**Prerequisitos:** ejercicios 04 y 05 (stderr por separado)

---

## Teoría

Cuando necesitás guardar **toda** la salida del comando (normal y errores) en un mismo archivo, Bash ofrece la redirección combinada:

```bash
comando &> archivo.txt
```

Equivale a `comando > archivo.txt 2>&1`: primero redirige stdout al archivo y luego redirige stderr al mismo destino que stdout.

| Forma | Significado |
|-------|-------------|
| `&>` | stdout + stderr al mismo archivo (sobrescribe) |
| `&>>` | stdout + stderr al mismo archivo (append) |

**Orden importa:** `comando 2>&1 > archivo` y `comando > archivo 2>&1` no son equivalentes; en el ejercicio 16 profundizarás en `2>&1`.

---

## Objetivo

Capturar stdout y stderr juntos en un único archivo con `&>`.

---

## Comandos y operadores

- `ls`
- `&>` (o `> archivo 2>&1`)
- `cat`

---

## Pasos prácticos

1. Ejecutá un comando que produzca salida **y** error:

```bash
ls /etc /noexiste &> salida_y_errores.txt
```

2. Inspeccioná el archivo:

```bash
cat salida_y_errores.txt
```

3. Compará con redirecciones separadas del ejercicio 07:

```bash
ls /etc /noexiste 1> solo_ok.txt 2> solo_error.txt
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

El listado de `/etc` y el mensaje de error por `/noexiste` quedan mezclados en `salida_y_errores.txt`, en el orden en que el comando los generó. En pantalla no debería aparecer nada de ese comando.

---

## Tips

- `&>` es específico de Bash; en scripts POSIX a veces se prefiere `> archivo 2>&1` por portabilidad.
- Si solo querés silenciar todo, `&> /dev/null` descarta ambos flujos (útil en scripts ruidosos).
- Para **append** combinado usá `&>> archivo.log`.

---

## Desafío adicional

Ejecutá `find /etc -name "*.conf" &> find_completo.txt` y estimá cuántas líneas son salida normal y cuántas son errores de permiso.

---

## Ejercicio extra

Creá `ejecucion.log` que registre el resultado de un «comando mixto»:

```bash
{ echo "=== Inicio ==="; ls /etc; ls /noexiste; echo "=== Fin ==="; } &> ejecucion.log
```

Contá cuántas líneas contiene el archivo y localizá la línea del error con `grep -n "no such file\|No existe" ejecucion.log` (el mensaje puede variar según el idioma del sistema).

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Redirecting Standard Error and Output*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

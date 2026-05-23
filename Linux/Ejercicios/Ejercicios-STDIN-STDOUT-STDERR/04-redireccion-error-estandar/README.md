# Ejercicio 04 – Redirección de error estándar

**Nivel:** básico | **Serie:** 04/20 — stderr

**Prerequisitos:** ejercicios 01–03 (stdout y stdin)

---

## Teoría

Los programas envían su salida **normal** por stdout (descriptor 1) y los **mensajes de error** por stderr (descriptor 2). Por defecto ambos se muestran en la terminal, pero se redirigen de forma independiente.

Para capturar solo los errores:

```bash
comando 2> errores.txt
```

`2>` es equivalente a redirigir el descriptor 2. La salida correcta del comando **no** va al archivo de errores; si el comando tiene éxito y produce stdout, esa salida sigue yendo a la pantalla (o al destino que definas para stdout).

---

## Objetivo

Capturar mensajes de error en un archivo con `2>`, separándolos de la salida normal.

---

## Comandos y operadores

- `ls`
- `2>` — redirige stderr a un archivo (sobrescribe)
- `cat`

---

## Pasos prácticos

1. Provocá un error y guardalo en un archivo:

```bash
ls /noexiste 2> errores.txt
```

2. Comprobá que la pantalla no muestra el mensaje de error (o lo muestra vacío según el caso).
3. Leé el archivo de errores:

```bash
cat errores.txt
```

4. Compará con un comando exitoso que **no** llena el archivo de errores:

```bash
ls /etc 2> errores.txt
echo "Código de salida: $?"
```

5. Ejecutá `bash script.sh` para repetir el experimento.

---

## Explicación del resultado

`ls /noexiste` falla y escribe «No such file or directory» (o similar) en stderr. Con `2> errores.txt`, ese mensaje se guarda en el archivo. El **código de salida** del comando sigue siendo distinto de cero (`$?` ≠ 0), aunque el error no se vea en pantalla.

---

## Tips

- Podés escribir explícitamente `ls /noexiste 2> errores.txt` o `ls /noexiste 2>errores.txt`; el espacio antes de `>` en stderr es opcional en la práctica habitual.
- `2>` sobrescribe el archivo de errores igual que `>` hace con stdout.
- Para ver **solo** stdout en pantalla mientras guardás errores, esta es la técnica correcta; combinarla con `1>` es el ejercicio 07.

---

## Desafío adicional

Ejecutá `find /etc -name "*.conf" -readable 2> find_errores.txt` y revisá si se generaron mensajes de permiso denegado en el archivo.

---

## Ejercicio extra

Ejecutá dos comandos que fallen y guardá cada error en el **mismo** archivo usando `2>` (no `2>>`):

```bash
ls /ruta_inexistente_1 2> errores.txt
ls /ruta_inexistente_2 2> errores.txt
cat errores.txt
```

Observá que el segundo comando **sobrescribe** el primero. Luego repetí el experimento con `2>>` (ejercicio 05) y compará los resultados.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Redirecting Standard Error*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

# Ejercicio 19 – Redirección condicional con if

**Nivel:** avanzado | **Serie:** 19/20 — Control de flujo

**Prerequisitos:** ejercicios 04, 18 y nociones básicas de `if` en Bash

---

## Teoría

En Bash, la condición de `if comando` evalúa el **código de salida** del comando (0 = éxito, distinto de 0 = fallo). La redirección `2> archivo` se aplica al comando **antes** de evaluar el éxito: el error se guarda en el archivo, pero el comando sigue considerándose fallido si la ruta no existe.

```bash
if ls /noexiste 2> error.txt; then
  echo "OK"
fi
```

Aquí `then` **no** se ejecuta porque `ls` falló, aunque el mensaje de error esté en `error.txt`. Para reaccionar al fallo necesitás `else` o comprobar `$?`.

---

## Objetivo

Combinar `if` con redirección de stderr y entender que guardar el error no implica éxito del comando.

---

## Comandos y operadores

- `if`, `then`, `fi`, `else`
- `2>`
- `echo`, `ls`
- `$?`

---

## Pasos prácticos

1. Ejecutá el caso del README/script:

```bash
if ls /noexiste 2> error.txt; then echo OK; fi
```

2. Verificá que **no** se imprimió «OK» y que `error.txt` tiene contenido:

```bash
cat error.txt
echo "Código de salida de ls: $?"
```

3. Probá con ruta válida:

```bash
if ls /etc 2> error.txt; then echo "Listado OK"; fi
```

4. Añadí rama `else`:

```bash
if ls /noexiste 2> error.txt; then
  echo "Éxito"
else
  echo "Fallo — revisar error.txt"
fi
```

5. Ejecutá `bash script.sh`

---

## Explicación del resultado

La redirección solo cambia **dónde** se escribe stderr; no convierte un fallo en éxito. `if` reacciona al código de salida real del comando. Este patrón es útil para registrar errores y aun así tomar decisiones con `else`.

---

## Tips

- Tras un `if`, `$?` puede reflejar el último comando del `then`/`else`, no el del `if`; guardá el código si lo necesitás: `ls ... 2> e; r=$?`
- `if comando 2>/dev/null` silencia errores y sigue evaluando el código de salida.
- Para scripts robustos: `set -e` hace que el script aborte ante cualquier fallo no manejado.

---

## Desafío adicional

Escribí un script que intente `ping -c 1 127.0.0.1` y, según el resultado, escriba «Host alcanzable» o «Host no alcanzable» en `red.log`, redirigiendo stderr a `red_errores.txt`.

---

## Ejercicio extra

Implementá esta lógica en un script `verificar_ruta.sh` que reciba `$1` (ruta a comprobar):

```bash
#!/bin/bash
if ls "$1" 2> /tmp/error_verificar.txt; then
  echo "La ruta $1 existe y es accesible" > resultado_verificar.txt
else
  echo "La ruta $1 falló — ver /tmp/error_verificar.txt" > resultado_verificar.txt
fi
```

Probá con `/etc` y con `/noexiste`. Mostrá `resultado_verificar.txt` en ambos casos.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Shell Builtin Commands*, *Return Status*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

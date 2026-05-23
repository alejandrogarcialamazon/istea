# Ejercicio 15 – Pipes y stderr

**Nivel:** avanzado (introducción) | **Serie:** 15/20 — stderr en pipelines

**Prerequisitos:** ejercicios 04, 11 y 09 (stderr y pipes)

---

## Teoría

**Regla clave:** el pipe conecta solo stdout del comando izquierdo con stdin del derecho. **stderr sigue yendo a la terminal** (o al destino que le indiques aparte).

```bash
ls /noexiste | grep txt
```

`ls` escribe el error en stderr (visible en pantalla). `grep` recibe stdin vacío o sin líneas útiles, por lo que **no muestra coincidencias**. Esto confunde a menudo a quien espera que el error «pase» por el pipe.

---

## Objetivo

Demostrar que los mensajes de error no atraviesan un pipe y observar el comportamiento de `grep` sin entrada útil.

---

## Comandos y operadores

- `ls`
- `grep`
- `|`

---

## Pasos prácticos

1. Ejecutá el comando del ejercicio:

```bash
ls /noexiste | grep txt
```

2. Observá si aparece un mensaje de error en pantalla aunque `grep` no muestre nada.
3. Redirigí stderr a un archivo **sin** unirlo al pipe:

```bash
ls /noexiste 2> error_pipe.txt | grep txt
cat error_pipe.txt
```

4. Prepará el ejercicio 16 ejecutando:

```bash
ls /noexiste 2>&1 | grep "no such file"
```

5. Ejecutá `bash script.sh`

---

## Explicación del resultado

El error de `ls` no alimenta a `grep`. `grep` no falla necesariamente; simplemente no encuentra líneas. El mensaje de error lo ves porque stderr sigue conectado al terminal. La solución para incluir errores en el pipe es `2>&1` (ejercicio 16).

---

## Tips

- Para depurar pipes: insertá `tee /tmp/debug.txt` en medio: `comando | tee /tmp/debug.txt | otro`
- `set -o pipefail` en scripts hace que el pipe falle si **cualquier** etapa falla.
- Algunos comandos mezclan avisos en stderr aunque la operación «funcione»; no los confundas con fallo total.

---

## Desafío adicional

Ejecutá `find /root 2>/dev/null | head` y explicá qué stderr se suprimió y qué stdout llegó a `head`.

---

## Ejercicio extra

Realizá este experimento documentado en tres pasos:

| Paso | Comando | ¿Error visible? | ¿grep recibe datos? |
|------|---------|-----------------|---------------------|
| A | `ls /noexiste \| grep txt` | | |
| B | `ls /noexiste 2>/dev/null \| grep txt` | | |
| C | `ls /noexiste 2>&1 \| grep txt` | | |

Completá la tabla en tu cuaderno. Luego escribí una regla en una frase: «Para que los errores participen en un pipe debo…»

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Pipelines* y *Redirection*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

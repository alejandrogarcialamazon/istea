# Ejercicio 12 – Encadenar varios comandos con pipes

**Nivel:** intermedio | **Serie:** 12/20 — Tuberías (pipes)

**Prerequisitos:** ejercicio 11 (pipe simple)

---

## Teoría

Podés encadenar tantos comandos como necesites; cada uno procesa la salida del anterior:

```bash
comando1 | comando2 | comando3
```

Cada etapa debe leer de stdin y escribir a stdout (salvo el último, que puede redirigir a archivo). Comandos como `grep` y `wc` están diseñados para este modelo **filtro → transformación → agregación**.

---

## Objetivo

Construir una cadena de tres procesos que filtre y cuente líneas en un archivo del sistema.

---

## Comandos y operadores

- `cat`
- `grep`
- `wc -l`
- `|`

---

## Pasos prácticos

1. Contá líneas que contienen «bash» en `/etc/passwd`:

```bash
cat /etc/passwd | grep bash | wc -l
```

2. Observá la salida numérica (cantidad de líneas coincidentes).
3. Añadí una etapa de ordenación antes del conteo:

```bash
cat /etc/passwd | grep bash | sort | wc -l
```

4. Ejecutá `bash script.sh` y compará el número con el paso 1.

---

## Explicación del resultado

- `cat` envía el archivo a stdout.
- `grep bash` deja solo líneas con esa cadena (puede incluir `/bin/bash`, comentarios, etc.).
- `wc -l` cuenta líneas recibidas por stdin.

El resultado es un número: no ves las líneas intermedias a menos que quites `wc` o redirijas otra rama.

---

## Tips

- `grep -i bash` ignora mayúsculas/minúsculas.
- Para depurar cadenas largas, cortá temporalmente antes del final: `cat /etc/passwd | grep bash | head`
- El código de salida de un pipe en Bash es el del **último** comando por defecto (`set -o pipefail` cambia eso en scripts).

---

## Desafío adicional

Encadená `cat /etc/passwd | cut -d: -f1 | sort | uniq | wc -l` y explicá qué cuenta el número final.

---

## Ejercicio extra

A partir de `cat /usr/share/dict/words` (si existe en tu sistema) o de un archivo de texto propio con una palabra por línea:

1. Filtrá palabras que empiecen por «pro» (`grep "^pro"`).
2. Ordená (`sort`).
3. Mostrá las 5 primeras (`head -5`).

Escribí la cadena completa en una sola línea. Si el diccionario no existe, usá `ls /etc | grep "^p" | sort | head -5` como alternativa equivalente en estructura.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man grep`, `man wc`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

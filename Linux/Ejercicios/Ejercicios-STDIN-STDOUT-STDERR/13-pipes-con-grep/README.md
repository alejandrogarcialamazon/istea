# Ejercicio 13 – Pipes con grep

**Nivel:** intermedio-alto | **Serie:** 13/20 — Filtrado con pipes

**Prerequisitos:** ejercicios 11 y 12 (pipes)

---

## Teoría

`grep` busca patrones en texto. En un pipe actúa como **filtro**: recibe líneas por stdin y emite solo las que coinciden por stdout.

```bash
generador | grep patron
```

Cuando el generador lista nombres de archivo (como `ls`), cada línea es un candidato. `grep ssh` muestra solo entradas que contienen la cadena «ssh» (puede ser substring: `ssh`, `sshd`, etc.).

Opciones útiles: `-i` (ignorar caso), `-v` (invertir), `-w` (palabra completa), `-E` (expresiones extendidas).

---

## Objetivo

Filtrar la salida de `ls` con `grep` para localizar binarios relacionados con SSH.

---

## Comandos y operadores

- `ls`
- `grep`
- `|`

---

## Pasos prácticos

1. Listá y filtrá:

```bash
ls /bin | grep ssh
```

2. Contá coincidencias:

```bash
ls /bin | grep ssh | wc -l
```

3. Probá búsqueda insensible a mayúsculas en otra ruta:

```bash
ls /usr/sbin | grep -i ssh
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

`ls /bin` produce una línea por archivo. `grep ssh` descarta las líneas que no contienen «ssh». La salida es más corta y legible que el listado completo.

---

## Tips

- `grep -w ssh` evita coincidencias parciales dentro de palabras más largas (según el patrón).
- Para listados enormes, `ls /bin | grep ssh` es más eficiente que abrir todo en un editor.
- Si no hay coincidencias, `grep` devuelve código de salida 1 (no es un fallo del shell, significa «sin resultados»).

---

## Desafío adicional

Usá `ls -l /etc | grep "^-" | grep ".conf$"` para listar archivos regulares que terminan en `.conf` (ajustá si tu `ls` no muestra el formato esperado).

---

## Ejercicio extra

Creá un archivo `servicios.txt` con 8 nombres ficticios de servicios (uno por línea), incluyendo al menos dos con «web» y dos con «db».

Obtené solo los de «web» con:

```bash
grep "web" servicios.txt
```

Luego hacé lo mismo leyendo con pipe desde `cat` (sin argumento de archivo en grep):

```bash
cat servicios.txt | grep "web"
```

¿Cuál es la diferencia práctica entre ambas formas?

---

## Referencias

- `man grep`
- Apunte de clase: «Entrada y salida estándar en Bash»
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

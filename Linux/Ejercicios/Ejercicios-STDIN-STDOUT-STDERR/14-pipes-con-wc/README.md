# Ejercicio 14 – Pipes con wc

**Nivel:** intermedio-alto | **Serie:** 14/20 — Agregación con pipes

**Prerequisitos:** ejercicios 11–13 (pipes y grep)

---

## Teoría

`wc` (word count) cuenta líneas, palabras y bytes. En un pipe suele usarse al final de la cadena como **resumen**:

| Opción | Cuenta |
|--------|--------|
| `-l` | Líneas |
| `-w` | Palabras |
| `-c` | Bytes |

```bash
ls /usr/bin | wc -l
```

Cada línea que llega de `ls` se cuenta como una línea para `wc -l`. Ojo: en directorios con enlaces o nombres multilínea el conteo representa **entradas listadas**, no necesariamente «archivos únicos» del disco.

---

## Objetivo

Contar cuántas entradas devuelve `ls` usando `wc -l` en un pipe.

---

## Comandos y operadores

- `ls`
- `wc -l`
- `|`

---

## Pasos prácticos

1. Contá entradas en `/usr/bin`:

```bash
ls /usr/bin | wc -l
```

2. Compará con contar archivos de otra forma:

```bash
ls /usr/bin | wc -l
find /usr/bin -maxdepth 1 | wc -l
```

3. Filtrá antes de contar:

```bash
ls /usr/bin | grep python | wc -l
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

`wc -l` imprime un número seguido del nombre del archivo de entrada. Cuando lee de stdin (pipe), suele mostrar solo el número o «total» según la versión. Ese número es la cantidad de líneas recibidas del comando anterior.

---

## Tips

- `ls /usr/bin | wc -l` y `ls -1 /usr/bin | wc -l` pueden diferir si `ls` usa formato mult columna sin `-1`.
- Para contar palabras en un texto: `cat archivo.txt | wc -w`
- Combiná con `grep` para métricas condicionales (ejercicio 12).

---

## Desafío adicional

Calculá cuántas líneas del archivo `/etc/passwd` tienen shell `/bin/bash` con `grep "/bin/bash" /etc/passwd | wc -l`.

---

## Ejercicio extra

Generá estadísticas de un archivo `notas.txt` que crees con al menos 10 líneas de texto:

```bash
echo "=== Estadísticas de notas.txt ==="
wc -l notas.txt
wc -w notas.txt
wc -c notas.txt
```

Luego, en **una sola línea con pipe**, contá cuántas líneas contienen la palabra «importante»:

```bash
grep -c "importante" notas.txt
# o con pipe:
grep "importante" notas.txt | wc -l
```

Compará ambos métodos y anotá si dan el mismo resultado.

---

## Referencias

- `man wc`
- Apunte de clase: «Entrada y salida estándar en Bash»
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

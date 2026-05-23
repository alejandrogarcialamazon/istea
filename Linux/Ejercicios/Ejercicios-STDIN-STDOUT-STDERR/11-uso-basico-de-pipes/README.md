# Ejercicio 11 – Uso básico de pipes

**Nivel:** intermedio | **Serie:** 11/20 — Tuberías (pipes)

**Prerequisitos:** ejercicios 01–10 (redirección a archivos)

---

## Teoría

El operador `|` conecta la **stdout** de un proceso con la **stdin** del siguiente. No crea un archivo intermedio en disco; el kernel gestiona un buffer entre procesos.

```bash
comando1 | comando2
```

Solo stdout del primer comando alimenta al segundo. **stderr no atraviesa el pipe** por defecto (lo verás en el ejercicio 15).

En este ejercicio, `less` recibe el listado de `ls` y permite desplazarse página a página. Salí de `less` con la tecla `q`.

---

## Objetivo

Conectar la salida de un comando con la entrada de otro usando `|`.

---

## Comandos y operadores

- `ls`
- `|` — pipe entre procesos
- `less` — paginador (o `more` si `less` no está disponible)

---

## Pasos prácticos

1. Conectá listado y paginador:

```bash
ls /etc | less
```

2. Navegá con flechas o PgUp/PgDn y salí con `q`.
3. Compará con redirección a archivo:

```bash
ls /etc > listado.txt
less listado.txt
```

4. Observá la diferencia: el pipe no deja archivo intermedio obligatorio.
5. Ejecutá `bash script.sh` (si usás `less` en modo no interactivo, probá `ls /etc | head`).

---

## Explicación del resultado

`ls /etc` escribe en stdout; el shell redirige ese flujo al stdin de `less`. Ambos procesos pueden ejecutarse en paralelo: `ls` produce datos mientras `less` los consume.

---

## Tips

- Si la salida es corta, `ls /etc | cat` también demuestra el pipe sin paginador.
- `ls /etc | wc -l` cuenta líneas sin abrir un visor interactivo.
- Los pipes encadenados consumen memoria acotada frente a archivos temporales gigantes.

---

## Desafío adicional

Probá `ls /etc | grep "^a"` y contá cuántas entradas empiezan por «a».

---

## Ejercicio extra

Sin usar archivos intermedios, mostrá las **10 primeras** entradas de `/usr/bin` ordenadas alfabéticamente:

```bash
ls /usr/bin | sort | head -10
```

Explicá en una frase qué hace cada etapa del pipe. Luego guardá el mismo resultado en `top10_bin.txt` añadiendo redirección al final: `... > top10_bin.txt`.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Pipelines*
- [GNU Bash Reference Manual — Pipelines](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html)

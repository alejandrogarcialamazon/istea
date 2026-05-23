# Ejercicio 10 – Redirección de entrada y salida combinadas

**Nivel:** intermedio | **Serie:** 10/20 — Cierre del bloque de redirección

**Prerequisitos:** ejercicios 03 y 01 (`<` y `>`)

---

## Teoría

Podés redirigir stdin y stdout **en la misma línea**. El shell abre ambos archivos antes de ejecutar el comando:

```bash
comando < origen.txt > destino.txt
```

En este patrón, `cat` actúa como un «copiador» por flujos: lee de `origen.txt` y escribe en `destino.txt` sin mostrar nada en pantalla. Es equivalente conceptualmente a `cp origen.txt destino.txt` para texto plano, pero ilustra el manejo explícito de descriptores.

**Orden de evaluación:** las redirecciones se procesan de izquierda a derecha; en casos con `2>&1` el orden cambia el resultado (ejercicio 16).

---

## Objetivo

Copiar el contenido de un archivo a otro usando solo redirección `<` y `>`.

---

## Comandos y operadores

- `cat`
- `<` y `>`
- `diff` — para verificar copia

---

## Preparación

```bash
echo -e "alpha\nbeta\ngamma" > entrada.txt
```

---

## Pasos prácticos

1. Copiá mediante redirección:

```bash
cat < entrada.txt > salida.txt
```

2. Verificá que `salida.txt` coincide con `entrada.txt`:

```bash
diff entrada.txt salida.txt
```

3. Modificá `entrada.txt` y repetí la copia; confirmá que `>` sobrescribe `salida.txt`.
4. Ejecutá `bash script.sh`

---

## Explicación del resultado

`cat` lee líneas desde stdin (conectado a `entrada.txt`) y las escribe en stdout (conectado a `salida.txt`). La terminal no muestra el contenido durante la operación. Si `entrada.txt` no existe, el shell falla antes de ejecutar `cat`.

---

## Tips

- También podés usar `cat entrada.txt > salida.txt`; la forma con `<` enseña el modelo de descriptores.
- Para añadir al destino en lugar de sobrescribir: `cat < entrada.txt >> salida.txt`
- Si necesitás copiar errores de un proceso, necesitarás redirigir stderr aparte (ejercicios 04–07).

---

## Desafío adicional

Transformá `entrada.txt` a mayúsculas en un solo paso: `tr 'a-z' 'A-Z' < entrada.txt > salida_mayus.txt`

---

## Ejercicio extra

Creá `origen.txt` con cinco palabras (una por línea). Generá `destino.txt` con solo las líneas que contengan la letra «a», usando **solo** redirección y pipes básicos:

```bash
grep "a" < origen.txt > destino.txt
```

Añadí al final de `destino.txt` una línea «--- fin ---» con `>>` sin borrar lo anterior. Verificá con `cat destino.txt`.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

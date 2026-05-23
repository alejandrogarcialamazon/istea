# Ejercicio 03 – Redirección de entrada estándar

**Nivel:** inicial | **Serie:** 03/20 — Fundamentos de redirección

**Prerequisitos:** ejercicios 01 y 02 (redirección de salida)

---

## Teoría

Hasta ahora redirigiste la **salida** de los comandos. El operador `<` redirige la **entrada estándar (stdin)** para que un comando lea desde un archivo en lugar del teclado:

```bash
comando < archivo.txt
```

El shell abre `archivo.txt` y conecta su contenido al descriptor 0 del proceso. Muchos comandos aceptan un archivo como argumento (`cat archivo.txt`), pero la redirección de entrada es útil cuando el programa **solo** lee de stdin o cuando querés unificar el patrón de redirección.

---

## Objetivo

Alimentar stdin de un comando desde un archivo usando `<`.

---

## Comandos y operadores

- `cat`
- `<` — redirige stdin desde un archivo
- `echo` — para crear archivos de prueba

---

## Preparación

Creá el archivo de entrada antes de practicar:

```bash
echo -e "Línea uno\nLínea dos\nLínea tres" > entrada.txt
```

---

## Pasos prácticos

1. Leé el archivo redirigiendo stdin:

```bash
cat < entrada.txt
```

2. Compará con la forma directa (sin redirección):

```bash
cat entrada.txt
```

En este caso el resultado en pantalla es el mismo; la diferencia está en **cómo** el comando recibe los datos.

3. Probá con `sort`, que lee de stdin:

```bash
sort < entrada.txt
```

4. Ejecutá el script del ejercicio si lo preferís: `bash script.sh`

---

## Explicación del resultado

`cat < entrada.txt` hace que `cat` lea del descriptor 0 (conectado al archivo). La salida sigue yendo a stdout (la pantalla), salvo que también redirijas la salida con `>` (ejercicio 10).

---

## Tips

- `<` debe ir **después** del comando: `cat < archivo` es correcto; `< archivo cat` no es la forma habitual en Bash.
- Si el archivo no existe, el shell reporta el error **antes** de ejecutar el comando.
- `wc -l < entrada.txt` cuenta líneas sin mostrar el contenido del archivo en pantalla.

---

## Desafío adicional

Creá `numeros.txt` con varios números desordenados y usá `sort < numeros.txt` para ordenarlos. Guardá el resultado en `numeros_ordenados.txt` con `>`.

---

## Ejercicio extra

Creá `usuarios.txt` con tres nombres ficticios (uno por línea). Usá solo redirección de entrada (`<`) con `grep` para buscar un nombre dentro del archivo:

```bash
grep "ana" < usuarios.txt
```

Luego repetí el ejercicio redirigiendo también la salida a `coincidencias.txt` con `>` en la misma línea.

**Verificación:** `cat coincidencias.txt` debe mostrar solo las líneas que coincidan.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Input Redirection*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

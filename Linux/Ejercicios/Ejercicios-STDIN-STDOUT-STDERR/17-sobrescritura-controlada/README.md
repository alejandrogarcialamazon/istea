# Ejercicio 17 – Sobrescritura controlada

**Nivel:** avanzado | **Serie:** 17/20 — Repaso y precisión

**Prerequisitos:** ejercicios 01, 02 y 05 (`>`, `>>`, `2>>`)

---

## Teoría

Este ejercicio consolida la diferencia entre **truncar** y **añadir**, aplicada de forma consciente en una misma sesión:

| Operador | Efecto en el archivo |
|----------|----------------------|
| `>` | Borra contenido previo (trunca) |
| `>>` | Conserva contenido y escribe al final |

Lo mismo aplica a stderr con `2>` y `2>>`. En producción, sobrescribir sin querer un log valioso es un error frecuente; por eso muchos scripts usan `>>` o nombres con timestamp.

---

## Objetivo

Comparar en la práctica el efecto de `>` frente a `>>` sobre el mismo archivo.

---

## Comandos y operadores

- `echo`
- `>`, `>>`
- `cat`, `wc -c`

---

## Pasos prácticos

1. Creá y ampliá un archivo en secuencia:

```bash
echo 'Primera' > archivo.txt
cat archivo.txt
echo 'Segunda' >> archivo.txt
cat archivo.txt
```

2. Observá el tamaño tras cada paso:

```bash
wc -c archivo.txt
```

3. Sobrescribí con `>` de nuevo:

```bash
echo 'Solo esto queda' > archivo.txt
cat archivo.txt
```

4. Ejecutá `bash script.sh` y repetí el análisis.

---

## Explicación del resultado

Tras el paso 1, el archivo contiene «Primera». Tras `>>`, aparece «Segunda» en una nueva línea. Tras el último `>`, solo queda «Solo esto queda»: el operador `>` eliminó el historial anterior.

---

## Tips

- Usá `ls -l archivo.txt` tras cada operación para ver el tamaño en bytes.
- Para logs, preferí `>>` o rotación con `logrotate` en sistemas reales.
- `set -o noclobber` evita sobrescribir con `>` por accidente en Bash interactivo.

---

## Desafío adicional

Simulá tres días de log con `echo "Día N" >> app.log` y luego un reinicio que haga `echo "=== Reinicio ===" > app.log`. Documentá qué información se perdió.

---

## Ejercicio extra

Construí `bitacora.txt` siguiendo **exactamente** esta secuencia y anotá el contenido tras cada paso:

```bash
echo "evento 1" > bitacora.txt
echo "evento 2" >> bitacora.txt
echo "evento 3" >> bitacora.txt
echo "REINICIO" > bitacora.txt
echo "evento 4" >> bitacora.txt
cat bitacora.txt
```

**Preguntas:**
1. ¿Cuántos eventos quedaron después del reinicio?
2. ¿Qué operador causó la pérdida de datos?
3. ¿Cómo registrarías un reinicio **sin** borrar eventos anteriores?

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

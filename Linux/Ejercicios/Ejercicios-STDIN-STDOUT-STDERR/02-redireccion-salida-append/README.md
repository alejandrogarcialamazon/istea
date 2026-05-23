# Ejercicio 02 – Redirección de salida con append

**Nivel:** inicial | **Serie:** 02/20 — Fundamentos de redirección

**Prerequisito:** ejercicio 01 (redirección con `>`)

---

## Teoría

El operador `>>` redirige stdout al final de un archivo existente **sin borrar** lo que ya contiene. Si el archivo no existe, se crea (igual que con `>`).

```bash
comando >> archivo.txt
```

La diferencia clave respecto al ejercicio 01:

| Operador | Comportamiento |
|----------|----------------|
| `>` | Sobrescribe el archivo (lo trunca a cero bytes) |
| `>>` | Añade al final del archivo |

Este patrón es habitual en **logs** y registros donde cada ejecución agrega una nueva entrada.

---

## Objetivo

Usar `>>` para acumular salida en un mismo archivo sin perder contenido previo.

---

## Comandos y operadores

- `echo`
- `>>` — redirige stdout en modo append
- `cat`

---

## Pasos prácticos

1. Creá un archivo base con el ejercicio anterior (o ejecutá esto primero):

```bash
echo 'Primera línea' > salida.txt
```

2. Añadí contenido con append:

```bash
echo 'Nueva línea' >> salida.txt
```

3. Verificá el resultado:

```bash
cat salida.txt
```

4. Ejecutá el append varias veces seguidas y observá cómo crece el archivo:

```bash
echo "$(date)" >> salida.txt
echo "$(date)" >> salida.txt
cat salida.txt
```

---

## Explicación del resultado

Cada `>>` coloca su salida **después** del contenido existente. El archivo conserva todas las líneas anteriores. En contraste, si hubieras usado `>` en el paso 2, solo quedaría «Nueva línea».

---

## Tips

- `echo` añade un salto de línea al final por defecto; por eso cada ejecución ocupa una línea nueva en el archivo.
- Para logs con timestamp, la forma `echo "$(date '+%Y-%m-%d %H:%M:%S') - mensaje" >> log.txt` es muy usada en scripts.
- Podés encadenar varios append en una sola línea: `echo A >> f.txt; echo B >> f.txt`

---

## Desafío adicional

Redirigí con `>>` la salida de `uname -a`, `uptime` y `df -h /` al mismo archivo `sistema.log`. Comprobá que las tres salidas quedaron registradas.

---

## Ejercicio extra

Simulá un mini-log de accesos en `accesos.log`:

1. Escribí «Inicio de sesión» con `>` (crea el archivo).
2. Añadí tres líneas con `>>` simulando eventos: «Consulta de archivos», «Copia completada», «Fin de sesión».
3. Usá `tail -3 accesos.log` para ver solo las últimas tres líneas.

**Pregunta de reflexión:** ¿Qué pasaría si en el paso 2 usaras `>` en lugar de `>>`?

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — sección *Appending Redirected Output*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

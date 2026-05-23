# Ejercicio 08 – Ignorar la salida estándar

**Nivel:** intermedio | **Serie:** 08/20 — `/dev/null`

**Prerequisitos:** ejercicios 01 y 07 (redirección de stdout)

---

## Teoría

`/dev/null` es un dispositivo especial del kernel: todo lo que se escribe en él **se descarta**. Leer desde `/dev/null` devuelve fin de archivo inmediatamente.

Redirigir stdout a `/dev/null` silencia la salida normal pero **no** los errores:

```bash
comando > /dev/null
```

El comando sigue ejecutándose; solo deja de mostrarse su salida útil. El código de salida (`$?`) no se ve afectado.

---

## Objetivo

Descartar stdout de un comando manteniendo visible stderr cuando ocurra.

---

## Comandos y operadores

- `ls`
- `> /dev/null`
- `echo $?`

---

## Pasos prácticos

1. Descartá la salida de un listado grande:

```bash
ls /etc > /dev/null
echo "El comando terminó con código: $?"
```

2. Comprobá que no quedó archivo residual (no se crea `null` como archivo de datos útil).
3. Compará con ejecutar sin redirección y notá la diferencia visual.
4. Probá con salida pequeña para confirmar que «no ver nada» no implica «no ejecutar»:

```bash
echo "prueba" > /dev/null; echo "Sigo aquí"
```

5. Ejecutá `bash script.sh`

---

## Explicación del resultado

`ls /etc` se ejecuta con normalidad; su listado se envía a `/dev/null` y desaparece. El shell muestra el código de salida si lo consultás. Si el comando fallara solo por stderr, ese error **sí** aparecería en pantalla porque no lo redirigiste.

---

## Tips

- Forma corta equivalente: `ls /etc &> /dev/null` silencia todo; `> /dev/null` solo stdout.
- En scripts, descartar stdout es útil cuando solo importa el código de salida: `grep -q patrón archivo > /dev/null`
- No uses `/dev/null` para «borrar archivos»; no es un reemplazo de `rm`.

---

## Desafío adicional

Medí el tiempo de `find /usr > /dev/null` frente a `find /usr | wc -l` y reflexioná sobre cuándo conviene descartar salida frente a procesarla.

---

## Ejercicio extra

Escribí una línea que ejecute `ls /etc /noexiste` descartando **solo** stdout pero mostrando stderr en pantalla. Luego otra línea que descarte **solo** stderr (anticipás el ejercicio 09).

**Verificación esperada:**
- Primera línea: ves el error de `/noexiste`, no el listado de `/etc`.
- Segunda línea: ves el listado de `/etc`, no el error.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man null` — *Data sink*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

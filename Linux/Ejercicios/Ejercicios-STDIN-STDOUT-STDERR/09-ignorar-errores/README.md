# Ejercicio 09 – Ignorar los errores (stderr)

**Nivel:** intermedio | **Serie:** 09/20 — `/dev/null`

**Prerequisitos:** ejercicios 04 y 08 (stderr y descarte de stdout)

---

## Teoría

Para suprimir mensajes de error sin ocultar la salida normal:

```bash
comando 2> /dev/null
```

Es habitual en scripts que recorren muchas rutas y esperan fallos parciales (por ejemplo, `find` o `grep` en árboles de directorios). **Cuidado:** ocultar errores puede dificultar la depuración; usalo cuando el fallo sea esperado y no relevante.

---

## Objetivo

Descartar stderr manteniendo visible stdout.

---

## Comandos y operadores

- `ls`
- `2> /dev/null`
- `echo $?`

---

## Pasos prácticos

1. Ejecutá un comando mixto silenciando errores:

```bash
ls /etc /noexiste 2> /dev/null
```

2. Observá que ves el listado de `/etc` pero no el mensaje de `/noexiste`.
3. Consultá el código de salida:

```bash
ls /etc /noexiste 2> /dev/null; echo $?
```

4. Compará con el ejercicio 08 (descartar stdout en lugar de stderr).
5. Ejecutá `bash script.sh`

---

## Explicación del resultado

La salida correcta de `ls /etc` llega a la pantalla. El error por `/noexiste` se envía a `/dev/null`. El código de salida puede seguir siendo distinto de cero aunque no veas el mensaje.

---

## Tips

- Forma compacta para silenciar stderr: `comando 2>/dev/null` (sin espacio, muy común).
- Para silenciar **ambos** flujos: `comando &> /dev/null` o `comando >/dev/null 2>&1`.
- En pipelines, silenciar stderr del primer comando no evita que el segundo falle; revisá el ejercicio 15.

---

## Desafío adicional

Ejecutá `grep -r "PASSWORD" /etc 2>/dev/null | head` y analizá por qué muchos administradores combinan `2>/dev/null` con pipes.

---

## Ejercicio extra

Implementá un filtro «solo resultados» para el comando:

```bash
ls /home /root /noexiste 2>/dev/null
```

Documentá en una frase: ¿qué directorios listó y cuál falló silenciosamente? Comprobá con `echo $?` si el conjunto tuvo errores parciales.

Luego repetí el comando **sin** `2>/dev/null` y compará la experiencia de depuración.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

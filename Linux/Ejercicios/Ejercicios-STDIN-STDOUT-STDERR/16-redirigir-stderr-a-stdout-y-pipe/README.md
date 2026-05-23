# Ejercicio 16 – Redirigir stderr a stdout y pipe

**Nivel:** avanzado | **Serie:** 16/20 — `2>&1` en pipelines

**Prerequisitos:** ejercicios 06, 07 y 15 (stderr, separación y pipes)

---

## Teoría

`2>&1` redirige stderr (descriptor 2) hacia **el destino actual de stdout** (descriptor 1). No es «escribir al archivo 1» literalmente: significa «stderr apunta donde apunta stdout ahora».

Para que errores y salida normal pasen juntos al siguiente comando del pipe:

```bash
comando 2>&1 | siguiente
```

**Orden crítico** cuando también guardás en archivo:

```bash
# Correcto: stderr sigue a stdout que ya va al pipe
comando 2>&1 | grep patron

# Distinto resultado:
comando | grep patron 2>&1   # stderr se une después del pipe
```

En el ejercicio, `grep etc` filtra tanto listados como mensajes que contengan «etc».

---

## Objetivo

Incluir stderr en el flujo que alimenta un pipe usando `2>&1`.

---

## Comandos y operadores

- `ls`
- `grep`
- `2>&1`
- `|`

---

## Pasos prácticos

1. Ejecutá con stderr unido a stdout antes del pipe:

```bash
ls /etc /noexiste 2>&1 | grep etc
```

2. Compará con el ejercicio 15 (sin `2>&1`).
3. Guardá el resultado combinado en archivo:

```bash
ls /etc /noexiste 2>&1 | grep etc > filtrado.txt
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

Todas las líneas (listado de `/etc` y mensaje de error) pasan por `grep etc`. Solo permanecen las que contienen la cadena «etc». Sin `2>&1`, el mensaje de error habría quedado fuera del pipe.

---

## Tips

- `&>` redirige ambos flujos a archivo; `2>&1 |` los unifica **hacia otro proceso**.
- En scripts modernos, `cmd |& grep` (Bash 4.4+) equivale a `cmd 2>&1 | grep`.
- Para depuración temporal, no uses `2>&1` hasta entender qué stderr estás ocultando del terminal.

---

## Desafío adicional

Ejecutá `(ls /etc; ls /noexiste) 2>&1 | sort | uniq | head` y describí cada etapa.

---

## Ejercicio extra

Creá `errores_filtrados.txt` con mensajes que contengan «Permission» o «denied» a partir de:

```bash
find /etc -maxdepth 2 -readable 2>&1 | grep -i "permission\|denied" > errores_filtrados.txt
```

Si no hay coincidencias, probá con `find /root 2>&1 | head -20 | tee salida_find.txt` y filtrá manualmente una cadena que aparezca en stderr.

Contá líneas con `wc -l errores_filtrados.txt`.

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — *Duplicating File Descriptors*
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

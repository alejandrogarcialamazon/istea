# Ejercicio 07 – Separar stdout y stderr

**Nivel:** intermedio | **Serie:** 07/20 — Combinación de flujos

**Prerequisitos:** ejercicios 04 y 06 (stderr y redirección combinada)

---

## Teoría

En administración y depuración a menudo necesitás **separar** lo que salió bien de lo que falló. Podés redirigir cada descriptor a un archivo distinto en la misma línea:

```bash
comando 1> salida_ok.txt 2> salida_error.txt
```

`1>` es explícito para stdout (equivalente a `>`). `2>` captura stderr. El orden de las redirecciones en la línea puede afectar el resultado cuando usás `2>&1`; aquí cada flujo tiene destino fijo.

---

## Objetivo

Guardar la salida normal y los errores de un mismo comando en archivos diferentes.

---

## Comandos y operadores

- `ls`
- `1>` — stdout a archivo
- `2>` — stderr a archivo
- `cat`, `wc -l`

---

## Pasos prácticos

1. Separá los flujos:

```bash
ls /etc /noexiste 1>ok.txt 2>error.txt
```

2. Revisá cada archivo por separado:

```bash
echo "--- stdout ---"; head ok.txt
echo "--- stderr ---"; cat error.txt
```

3. Verificá el código de salida:

```bash
echo $?
```

4. Ejecutá `bash script.sh`

---

## Explicación del resultado

`ok.txt` contiene el listado de `/etc` (salida correcta). `error.txt` contiene solo el mensaje por `/noexiste`. La pantalla queda limpia respecto a ese comando. El código de salida refleja que hubo al menos un error.

---

## Tips

- Podés usar `> ok.txt` en lugar de `1>`; son equivalentes para stdout.
- Para auditoría, guardá también `$?` inmediatamente después: `ls ...; echo $? >> error.txt`
- Esta técnica es la base de pipelines de ETL y scripts que procesan «datos buenos» y «rechazos» por separado.

---

## Desafío adicional

Ejecutá `grep -r "root" /etc 1> coincidencias.txt 2> permisos.txt` y analizá qué proporción de la salida fue error frente a resultado útil.

---

## Ejercicio extra

Diseñá un mini-informe en dos archivos a partir de:

```bash
find /var/log -maxdepth 1 -type f 1> archivos_encontrados.txt 2> problemas_find.txt
```

Luego uní ambos en un tercero **sin perder la separación conceptual**:

```bash
{ echo "=== STDOUT ==="; cat archivos_encontrados.txt; echo "=== STDERR ==="; cat problemas_find.txt; } > informe_completo.txt
```

**Pregunta:** ¿En qué situación preferirías mantener dos archivos en lugar de uno con `&>`?

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash`
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

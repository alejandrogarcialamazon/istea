# Ejercicio 01 – Redirección de salida básica

**Nivel:** inicial | **Serie:** 01/20 — Fundamentos de redirección

---

## Teoría

Cada proceso en Linux dispone de tres flujos de comunicación, llamados **descriptores de archivo**:

| Descriptor | Nombre | Símbolo | Destino por defecto |
|------------|--------|---------|---------------------|
| 0 | Entrada estándar (stdin) | `<` | Teclado |
| 1 | Salida estándar (stdout) | `>` | Terminal |
| 2 | Error estándar (stderr) | `2>` | Terminal |

El operador `>` redirige **solo stdout** hacia un archivo. Si el archivo ya existe, **se sobrescribe por completo**; si no existe, el shell lo crea.

```bash
comando > archivo.txt
```

Equivale a escribir `comando 1> archivo.txt`. Solo la salida normal del comando va al archivo; los mensajes de error seguirían mostrándose en pantalla.

---

## Objetivo

Redirigir la salida estándar de un comando a un archivo usando `>`, y comprobar que el contenido ya no aparece en la terminal.

---

## Comandos y operadores

- `echo` — escribe texto en stdout
- `>` — redirige stdout a un archivo (sobrescribe)
- `cat` — muestra el contenido de un archivo

---

## Pasos prácticos

1. Abrí una terminal y movete a la carpeta de este ejercicio.
2. Ejecutá el comando o el script incluido:

```bash
echo 'Hola mundo' > salida.txt
```

3. Observá que **no** aparece nada en pantalla.
4. Verificá el contenido del archivo:

```bash
cat salida.txt
```

5. Repetí el comando con otro texto y comprobá qué ocurre con el contenido anterior:

```bash
echo 'Segundo intento' > salida.txt
cat salida.txt
```

---

## Explicación del resultado

- Con `>`, el shell abre `salida.txt` para escritura **antes** de ejecutar el comando.
- La salida de `echo` va al archivo en lugar de al terminal.
- Al repetir el comando, el archivo se **vuelve a crear** y el texto anterior desaparece: ese es el comportamiento de sobrescritura.

---

## Tips

- Usá `ls -l salida.txt` después de redirigir para ver la fecha de modificación y el tamaño del archivo.
- Si querés evitar sobrescribir por accidente, en Bash podés activar `set -o noclobber` y usar `>|` para forzar la sobrescritura cuando sea intencional.
- Recordá: `>` afecta solo stdout. Si el comando falla, el mensaje de error puede seguir viéndose en pantalla (lo verás en el ejercicio 04).

---

## Desafío adicional

Redirigí la salida de `date` y de `ls /etc` al mismo archivo, uno después del otro con `>`. ¿Qué contenido queda al final? Compará con usar `>>` (ejercicio 02).

---

## Ejercicio extra

Creá un archivo `informe.txt` que contenga, en este orden:

1. La fecha y hora actual (`date`)
2. Tu nombre de usuario (`whoami`)
3. El directorio de trabajo actual (`pwd`)

Usá **una sola línea** con redirección `>` para el primer comando y `>>` para los demás (anticipás el ejercicio 02). Al final, el archivo debe tener exactamente tres líneas.

**Verificación:**

```bash
wc -l informe.txt   # debe mostrar 3
cat informe.txt
```

---

## Referencias

- Apunte de clase: «Entrada y salida estándar en Bash»
- `man bash` — sección *REDIRECTION*
- [GNU Bash Reference Manual — Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)

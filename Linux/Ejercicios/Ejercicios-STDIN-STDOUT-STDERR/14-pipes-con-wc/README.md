# 🧪 Ejercicio 14 – Pipes con wc

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo contar líneas, palabras o caracteres.

## 🧠 Objetivo
Aprender a usar wc con pipes.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `wc`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /usr/bin | wc -l
```

## 📊 Explicación del resultado
Cuenta cuántos archivos hay en /usr/bin.

## 🧩 Desafío adicional
Filtrar antes con grep para contar coincidencias específicas.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

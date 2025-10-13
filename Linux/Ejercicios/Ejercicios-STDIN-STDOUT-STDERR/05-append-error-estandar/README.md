# 🧪 Ejercicio 05 – Append de errores estándar

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo agregar errores sin sobrescribir.

## 🧠 Objetivo
Aprender a usar '2>>' para mantener logs de errores.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `2>>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /noexiste 2>> errores.log
```

## 📊 Explicación del resultado
Cada nuevo error se agrega al final del archivo errores.log.

## 🧩 Desafío adicional
Ejecutar varios comandos erróneos para ver cómo crece el log.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

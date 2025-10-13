# 🧪 Ejercicio 09 – Ignorar los errores

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo suprimir mensajes de error.

## 🧠 Objetivo
Aprender a redirigir stderr a /dev/null.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `2> /dev/null`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc /noexiste 2> /dev/null
```

## 📊 Explicación del resultado
Los errores se descartan, mostrando solo la salida válida.

## 🧩 Desafío adicional
Combinar esta técnica con pipes.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

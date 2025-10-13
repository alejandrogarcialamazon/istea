# 🧪 Ejercicio 04 – Redirección de errores estándar

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo capturar mensajes de error.

## 🧠 Objetivo
Aprender a redirigir stderr con '2>'.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `2>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /noexiste 2> errores.txt
```

## 📊 Explicación del resultado
El error se guarda en errores.txt y no se muestra en pantalla.

## 🧩 Desafío adicional
Combinar con stdout redirigiendo ambos flujos a distintos archivos.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

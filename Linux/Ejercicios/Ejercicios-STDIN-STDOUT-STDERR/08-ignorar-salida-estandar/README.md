# 🧪 Ejercicio 08 – Ignorar la salida estándar

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo descartar la salida normal.

## 🧠 Objetivo
Aprender a redirigir stdout a /dev/null.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `/dev/null`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc > /dev/null
```

## 📊 Explicación del resultado
No se muestra nada, aunque el comando se ejecuta correctamente.

## 🧩 Desafío adicional
Probar con un comando que produzca mucha salida.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

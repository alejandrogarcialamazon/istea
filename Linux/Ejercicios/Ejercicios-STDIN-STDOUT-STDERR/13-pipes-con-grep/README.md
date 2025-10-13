# 🧪 Ejercicio 13 – Pipes con grep

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo filtrar resultados con grep.

## 🧠 Objetivo
Aprender a buscar patrones dentro de la salida.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `grep`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /bin | grep ssh
```

## 📊 Explicación del resultado
Muestra solo archivos en /bin que contienen 'ssh'.

## 🧩 Desafío adicional
Probar con otras rutas o patrones.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

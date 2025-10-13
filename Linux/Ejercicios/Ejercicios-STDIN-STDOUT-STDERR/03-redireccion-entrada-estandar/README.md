# 🧪 Ejercicio 03 – Redirección de entrada estándar

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo leer datos desde un archivo.

## 🧠 Objetivo
Aprender a usar '<' para alimentar stdin.

## ⚙️ Comandos y operadores utilizados
- `cat`
- `<`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
cat < entrada.txt
```

## 📊 Explicación del resultado
El comando lee el contenido de entrada.txt en lugar del teclado.

## 🧩 Desafío adicional
Probar redirigir un archivo a un programa interactivo.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

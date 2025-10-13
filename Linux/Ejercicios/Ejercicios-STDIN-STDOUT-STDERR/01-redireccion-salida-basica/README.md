# 🧪 Ejercicio 01 – Redirección de salida básica

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo redirigir stdout a un archivo.

## 🧠 Objetivo
Aprender a redirigir la salida estándar usando '>'.

## ⚙️ Comandos y operadores utilizados
- `echo`
- `>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
echo 'Hola mundo' > salida.txt
```

## 📊 Explicación del resultado
La salida de echo no se muestra en pantalla sino que se guarda en salida.txt.

## 🧩 Desafío adicional
Probar con otros comandos como `ls` o `date`.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

# 🧪 Ejercicio 02 – Redirección de salida con append

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo añadir salida sin sobrescribir.

## 🧠 Objetivo
Aprender a usar '>>' para agregar contenido.

## ⚙️ Comandos y operadores utilizados
- `echo`
- `>>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
echo 'Nueva línea' >> salida.txt
```

## 📊 Explicación del resultado
El texto se añade al final sin borrar el contenido anterior.

## 🧩 Desafío adicional
Probar redirigiendo la salida de varios comandos al mismo archivo.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

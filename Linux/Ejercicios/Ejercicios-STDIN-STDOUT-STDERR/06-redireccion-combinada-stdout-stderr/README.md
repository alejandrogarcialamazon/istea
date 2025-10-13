# 🧪 Ejercicio 06 – Redirección combinada stdout + stderr

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo unificar ambos flujos en un archivo.

## 🧠 Objetivo
Aprender a usar '&>' para capturar todo.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `&>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc /noexiste &> salida_y_errores.txt
```

## 📊 Explicación del resultado
Tanto la salida como los errores se guardan en el mismo archivo.

## 🧩 Desafío adicional
Verificar la diferencia con redirecciones separadas.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

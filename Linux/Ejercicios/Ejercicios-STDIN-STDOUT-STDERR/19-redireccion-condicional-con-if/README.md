# 🧪 Ejercicio 19 – Redirección condicional con if

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo controlar errores con if y redirecciones.

## 🧠 Objetivo
Aprender a redirigir stderr según resultado.

## ⚙️ Comandos y operadores utilizados
- `if`
- `2>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
if ls /noexiste 2> error.txt; then echo OK; fi
```

## 📊 Explicación del resultado
Solo se ejecuta la parte del if si el comando fue exitoso.

## 🧩 Desafío adicional
Agregar un else para detectar errores.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

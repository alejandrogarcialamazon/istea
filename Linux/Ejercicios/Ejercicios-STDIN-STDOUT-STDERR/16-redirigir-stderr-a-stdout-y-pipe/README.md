# 🧪 Ejercicio 16 – Redirigir stderr a stdout y pipe

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo combinar ambos flujos en un pipe.

## 🧠 Objetivo
Aprender a usar '2>&1 |'.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `grep`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc /noexiste 2>&1 | grep etc
```

## 📊 Explicación del resultado
Ahora los errores también se procesan por grep.

## 🧩 Desafío adicional
Guardar la salida combinada en un archivo.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

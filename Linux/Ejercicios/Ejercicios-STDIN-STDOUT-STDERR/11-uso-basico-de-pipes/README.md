# 🧪 Ejercicio 11 – Uso básico de pipes

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo conectar stdout de un comando al stdin de otro.

## 🧠 Objetivo
Aprender a usar '|' para encadenar procesos.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `|`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc | less
```

## 📊 Explicación del resultado
La salida de ls se pasa a less para visualizar página por página.

## 🧩 Desafío adicional
Probar con otros comandos receptores como `grep`.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

# 🧪 Ejercicio 12 – Encadenar varios comandos con pipes

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo usar múltiples pipes.

## 🧠 Objetivo
Aprender a usar '|' en secuencia.

## ⚙️ Comandos y operadores utilizados
- `cat`
- `grep`
- `wc`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
cat /etc/passwd | grep bash | wc -l
```

## 📊 Explicación del resultado
Cuenta cuántas líneas del archivo contienen la palabra 'bash'.

## 🧩 Desafío adicional
Agregar más etapas como `sort` o `uniq`.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

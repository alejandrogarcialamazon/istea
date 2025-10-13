# 🧪 Ejercicio 07 – Separar stdout y stderr

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo guardar ambos flujos por separado.

## 🧠 Objetivo
Aprender a redirigir stdout (1>) y stderr (2>).

## ⚙️ Comandos y operadores utilizados
- `ls`
- `1>` `2>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /etc /noexiste 1>ok.txt 2>error.txt
```

## 📊 Explicación del resultado
La salida normal se guarda en ok.txt, los errores en error.txt.

## 🧩 Desafío adicional
Combinar los archivos para ver el resultado completo.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

# 🧪 Ejercicio 10 – Redirección de entrada y salida

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo leer de un archivo y escribir en otro.

## 🧠 Objetivo
Aprender a usar '<' y '>' juntos.

## ⚙️ Comandos y operadores utilizados
- `cat`
- `<` `>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
cat < entrada.txt > salida.txt
```

## 📊 Explicación del resultado
El contenido de entrada.txt se copia a salida.txt mediante redirección.

## 🧩 Desafío adicional
Probar reemplazar cat por otro comando.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

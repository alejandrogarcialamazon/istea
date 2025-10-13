# 🧪 Ejercicio 17 – Sobrescritura controlada

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: diferencia entre '>' y '>>'.

## 🧠 Objetivo
Aprender a comparar comportamiento.

## ⚙️ Comandos y operadores utilizados
- `echo`
- `>` `>>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
echo 'Primera' > archivo.txt; echo 'Segunda' >> archivo.txt
```

## 📊 Explicación del resultado
El primer comando sobrescribe, el segundo añade.

## 🧩 Desafío adicional
Comprobar el tamaño del archivo tras cada comando.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

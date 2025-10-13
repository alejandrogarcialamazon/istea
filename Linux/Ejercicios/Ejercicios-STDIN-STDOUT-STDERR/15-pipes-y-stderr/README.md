# 🧪 Ejercicio 15 – Pipes y stderr

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: cómo el pipe no redirige errores.

## 🧠 Objetivo
Aprender a mostrar que stderr no pasa por el pipe.

## ⚙️ Comandos y operadores utilizados
- `ls`
- `grep`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
ls /noexiste | grep txt
```

## 📊 Explicación del resultado
No hay salida porque el error no se canaliza por el pipe.

## 🧩 Desafío adicional
Usar '2>&1' para incluir errores en el pipe.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

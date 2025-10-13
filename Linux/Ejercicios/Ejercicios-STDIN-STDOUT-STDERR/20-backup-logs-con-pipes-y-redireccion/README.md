# 🧪 Ejercicio 20 – Backup de logs con pipes y redirección

## 📘 Teoría
En sistemas Unix/Linux, cada proceso utiliza tres flujos básicos:
- **stdin (0)**: Entrada estándar (por defecto, teclado)
- **stdout (1)**: Salida estándar (por defecto, pantalla)
- **stderr (2)**: Error estándar (por defecto, pantalla)

Este ejercicio aborda: caso práctico completo.

## 🧠 Objetivo
Aprender a combinar pipes, stdout y stderr.

## ⚙️ Comandos y operadores utilizados
- `cat`
- `grep`
- `tee`
- `&>`

## 💻 Pasos prácticos
1. Ejecutar el siguiente script o comandos en Bash.
2. Observar el resultado generado.
3. Verificar el contenido de los archivos creados.

```bash
cat /var/log/syslog | grep error | tee errores.log &> resumen.txt
```

## 📊 Explicación del resultado
Se filtran errores y se guardan tanto logs como resumen.

## 🧩 Desafío adicional
Adaptar el comando a otros tipos de logs del sistema.

## 🔗 Referencias
- Apunte de clase: “Entrada y salida estándar en Bash”.
- Manual de Bash (`man bash`).
- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/)

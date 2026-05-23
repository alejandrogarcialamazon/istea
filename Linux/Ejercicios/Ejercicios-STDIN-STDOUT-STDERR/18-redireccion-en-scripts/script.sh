#!/bin/bash
# Script del ejercicio 18 — redirección dentro de un script
cd "$(dirname "$0")" 2>/dev/null || true

echo "Inicio: $(date)" > log_script.txt
echo "Segunda entrada" >> log_script.txt

ls /etc > listado_etc.txt 2> errores_script.txt

echo "Script finalizado" >> log_script.txt

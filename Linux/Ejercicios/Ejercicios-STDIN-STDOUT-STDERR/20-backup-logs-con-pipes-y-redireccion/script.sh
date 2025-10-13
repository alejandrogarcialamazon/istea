#!/bin/bash
# Script del ejercicio 20
cat /var/log/syslog | grep error | tee errores.log &> resumen.txt

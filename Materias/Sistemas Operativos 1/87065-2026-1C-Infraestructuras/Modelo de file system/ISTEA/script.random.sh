#!/bin/bash

# Nombre del archivo donde se guardarán los números aleatorios
output_file="numeros.random"

# Limpiar el archivo si ya existe
> "$output_file"

# Generar 100 números aleatorios y escribirlos en el archivo
for i in {1..100}; do
  echo $((RANDOM)) >> "$output_file"
done

echo "Archivo '$output_file' generado con 100 números aleatorios."

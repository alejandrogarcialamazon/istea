#!/bin/bash

# Nombre del archivo donde se guardarán los números
output_file="numeros.sec"

# Limpiar el archivo si ya existe
> "$output_file"

# Número inicial y cantidad de números a generar
start=2316
count=317

# Generar la secuencia de números y escribirlos en el archivo
for ((i=0; i<count; i++)); do
  echo $((start + i)) >> "$output_file"
done

echo "Archivo '$output_file' generado con 317 números comenzando desde $start."

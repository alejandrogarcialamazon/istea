#!/bin/bash

# Nombre del archivo donde se guardarán los números
output_file="numeros.intsec"

# Limpiar el archivo si ya existe
> "$output_file"

# Número inicial y cantidad de números a generar
start=2316
count=917

# Generar la secuencia de números y escribirlos en el archivo
for ((i=0; i<count; i++)); do
  echo $((start + i)) >> "$output_file"
done

echo "Archivo '$output_file' generado con 917 números comenzando desde $start."

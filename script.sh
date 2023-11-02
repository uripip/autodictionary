#!/bin/bash

# Verificamos que se proporcionen los nombres de archivo como argumentos
if [ $# -ne 2 ]; then
    echo "Uso: ./script.sh \"archivo_a_modificar\" \"archivo_de_salida\""
    exit 1
fi

# Nombre del archivo de entrada (a modificar)
archivo_a_modificar="$1"

# Nombre del archivo de salida
archivo_de_salida="$2"

# Verificamos si el archivo a modificar existe
if [ ! -f "$archivo_a_modificar" ]; then
    echo "El archivo a modificar \"$archivo_a_modificar\" no existe."
    exit 1
fi

# Copiamos el contenido del archivo de entrada al archivo de salida
cp "$archivo_a_modificar" "$archivo_de_salida"

# Loop hasta que se ingrese "999"
while true; do
    read -p "Introduce una palabra clave (o escribe '999' para salir): " palabra
    if [[ "$palabra" == "999" ]]; then
        break
    else
        echo "$palabra" >> "$archivo_de_salida"
    fi
done

echo "Palabras clave guardadas en \"$archivo_de_salida\" junto con el contenido original."

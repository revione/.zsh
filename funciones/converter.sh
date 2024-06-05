#!/bin/bash

convertir_mkv_a_mp4() {
    # Directorio donde se encuentran los archivos MKV
    local DIRECTORIO="$1"

    # Cambiar al directorio especificado
    cd "$DIRECTORIO" || { echo "Directorio no encontrado"; return 1; }

    # Loop a través de todos los archivos .mkv en el directorio
    for archivo in *.mkv; do
        # Verifica si hay archivos .mkv en la carpeta
        if [[ -f "$archivo" ]]; then
            # Nombre del archivo sin la extensión
            local base=$(basename "$archivo" .mkv)
            
            # Nombre del archivo de salida
            local salida="${base}.mp4"
            
            # Convertir el archivo usando FFmpeg
            ffmpeg -i "$archivo" -codec copy "$salida"
            
            # Verifica si la conversión fue exitosa
            if [[ $? -eq 0 ]]; then
                echo "Conversión exitosa: $archivo -> $salida"
            else
                echo "Error al convertir $archivo"
            fi
        else
            echo "No se encontraron archivos MKV en el directorio."
        fi
    done
}

# Llamar a la función con el directorio como argumento
# convertir_mkv_a_mp4 "/ruta/a/tu/carpeta"

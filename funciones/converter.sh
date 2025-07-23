#!/bin/bash

convertir_a_mp3() {
    carpeta_entrada="$PWD"

    if [ ! -d "$carpeta_entrada" ]; then
        echo "La carpeta actual no existe o no se puede acceder."
        return 1
    fi

    for archivo_entrada in "$carpeta_entrada"/*; do
        # Verificar que sea un archivo
        if [ ! -f "$archivo_entrada" ]; then
            continue
        fi

        # Detectar la extensión (en minúsculas)
        extension="${archivo_entrada##*.}"
        extension_lower=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

        # Saltar archivos que ya son mp3
        if [ "$extension_lower" = "mp3" ]; then
            continue
        fi

        # Nombre base sin extensión
        nombre_base="${archivo_entrada##*/}"
        nombre_base="${nombre_base%.*}"

        carpeta_salida="$carpeta_entrada/$nombre_base"
        mkdir -p "$carpeta_salida"

        archivo_salida_mp3="$carpeta_salida/$nombre_base.mp3"

        # Convertir a mp3 solo si el archivo tiene audio
        ffmpeg -i "$archivo_entrada" -vn -acodec libmp3lame -q:a 2 "$archivo_salida_mp3"

        # Mover el archivo original
        mv "$archivo_entrada" "$carpeta_salida/"

        echo "Convertido: $archivo_entrada → $archivo_salida_mp3"
    done

    echo "Todos los archivos fueron procesados."
}

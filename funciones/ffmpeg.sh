#!/bin/bash

# Función para convertir archivos en una carpeta a formato .mp4 utilizando ffmpeg
convertir_a_mp4() {
    # Verificar que se haya proporcionado la ruta de la carpeta como argumento
    if [ $# -ne 1 ]; then
        echo "Uso: convertir_a_mp4 <ruta_de_la_carpeta>"
        return 1
    fi

    # Asignar el primer parámetro a la variable carpeta_entrada
    carpeta_entrada="$1"

    # Verificar si la carpeta de entrada existe
    if [ ! -d "$carpeta_entrada" ]; then
        echo "La carpeta $carpeta_entrada no existe."
        return 1
    fi

    # Bucle para recorrer cada archivo en la carpeta de entrada
    for archivo_entrada in "$carpeta_entrada"/*; do
        # Obtener el nombre del archivo sin la extensión
        nombre_archivo=$(basename "$archivo_entrada" | cut -d. -f1)
        # Obtener la extensión del archivo
        extension=$(basename "$archivo_entrada" | cut -d. -f2)
        # Renombrar el archivo
        nuevo_nombre="$nombre_archivo.mp4"
        # Ejecutar ffmpeg con los parámetros para minimizar la pérdida de calidad
        # ffmpeg -i "$archivo_entrada" -qscale 0 "$carpeta_entrada/$nuevo_nombre"
        ffmpeg -i "$archivo_entrada" -c:v libx264 -crf 18 -c:a aac -q:a 2 "$carpeta_entrada/convertidos/$nuevo_nombre"

        # Preguntar al usuario si desea continuar
        echo "¿Desea continuar con el siguiente archivo? (S/N): "
        read -r continuar
        case $continuar in
            [Nn]* ) 
                echo "Proceso de conversión abortado."
                return 0
                ;;
        esac
    done
}


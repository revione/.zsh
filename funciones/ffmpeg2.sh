#!/bin/bash

# Función para convertir archivos en una carpeta a formato .mp4 utilizando ffmpeg
convertir_y_organizar() {
    # Verificar que se haya proporcionado la ruta de la carpeta como argumento
    if [ $# -ne 1 ]; then
        echo "Uso: convertir_y_organizar <ruta_de_la_carpeta>"
        return 1
    fi

    # Asignar el primer parámetro a la variable carpeta_entrada
    carpeta_entrada="$1"

    # Verificar si la carpeta de entrada existe
    if [ ! -d "$carpeta_entrada" ]; then
        echo "La carpeta $carpeta_entrada no existe."
        return 1
    fi

    # Crear las carpetas si no existen
    mkdir -p "$carpeta_entrada/editados"
    mkdir -p "$carpeta_entrada/trabajados"
    mkdir -p "$carpeta_entrada/ya_procesados"

    # Bucle para recorrer cada archivo en la carpeta de entrada
    for archivo_entrada in "$carpeta_entrada"/*; do
        # Verificar si es un archivo y si no está en las carpetas especiales
        if [ -f "$archivo_entrada" ] && [[ "$archivo_entrada" != "$carpeta_entrada/editados/"* ]] && [[ "$archivo_entrada" != "$carpeta_entrada/trabajados/"* ]] && [[ "$archivo_entrada" != "$carpeta_entrada/ya_procesados/"* ]]; then
            # Obtener el nombre del archivo sin la extensión
            nombre_archivo=$(basename "$archivo_entrada" | cut -d. -f1)
            # Obtener la extensión del archivo
            extension=$(basename "$archivo_entrada" | cut -d. -f2)
            # Nombre del archivo editado
            nuevo_nombre="${nombre_archivo}_reduced.mp4"
            # Ruta del archivo editado
            archivo_editado="$carpeta_entrada/editados/$nuevo_nombre"

            # Ejecutar ffmpeg con los parámetros para minimizar la pérdida de calidad
            ffmpeg -i "$archivo_entrada" -c:v libx264 -crf 18 -c:a aac -q:a 2 "$archivo_editado"

            # Verificar si ffmpeg terminó con éxito
            if [ $? -eq 0 ]; then
                # Mover el archivo original a ya_procesados
                mv "$archivo_entrada" "$carpeta_entrada/ya_procesados/"
                # Mover el archivo editado a trabajados
                mv "$archivo_editado" "$carpeta_entrada/trabajados/"
            else
                echo "Error procesando el archivo $archivo_entrada"
            fi

            # Preguntar al usuario si desea continuar
            echo "¿Desea continuar con el siguiente archivo? (S/N): "
            read -r continuar
            case $continuar in
                [Nn]* ) 
                    echo "Proceso de conversión abortado."
                    return 0
                    ;;
            esac
        fi
    done
}

# Llamar a la función con el primer argumento pasado al script
# convertir_y_organizar "$1"
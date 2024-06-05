#!/bin/bash

# Función para descargar video de YouTube
download_video() {
    if [ -z "$1" ]; then
        echo "Uso: $0 <URL del video de YouTube>"
        exit 1
    fi

    local url=$1

    echo "Descargando video de YouTube: $url"
    yt-dlp -f "mp4" -o "%(title)s.%(ext)s" "$url"

    if [ $? -eq 0 ]; then
        echo "Descarga completada."
    else
        echo "Hubo un error durante la descarga."
    fi
}

# Llama a la función con el primer argumento
# download_video "$1"


# Función para descargar solo el audio de YouTube en formato MP3
download_audio() {
    if [ -z "$1" ]; then
        echo "Uso: $0 <URL del video de YouTube>"
        exit 1
    fi

    local url=$1

    echo "Descargando audio de YouTube: $url"
    yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" "$url"

    if [ $? -eq 0 ]; then
        echo "Descarga de audio completada."
    else
        echo "Hubo un error durante la descarga."
    fi
}

# Llama a la función con el primer argumento
# download_audio "$1"

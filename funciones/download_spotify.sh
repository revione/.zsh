#!/bin/bash

# Función para descargar una canción de Spotify
download_spotify() {
    # Verificar si spotDL está instalado
    if ! command -v spotdl &> /dev/null; then
        echo "spotDL no está instalado. Instalándolo ahora..."
        pipx install spotdl
    fi

    # Verificar si se proporcionó un enlace de Spotify
    if [ -z "$1" ]; then
        echo "Error: No se proporcionó ningún enlace de Spotify."
        echo "Uso: download_spotify_song <enlace_spotify>"
        return 1
    fi

    # Obtener el enlace de Spotify
    local SPOTIFY_LINK="$1"

    # Descargar la canción usando spotDL
    spotdl "$SPOTIFY_LINK"

    echo "Descarga completada."
}

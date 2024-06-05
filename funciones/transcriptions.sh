#!/bin/bash

transcribe_video() {
  # Verifica si se proporcionó un directorio
  if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
  fi

  # Directorio de entrada
  INPUT_DIR="$1"

  # Buscar videos en el directorio
  VIDEO_FILES=$(find "$INPUT_DIR" -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \))
  if [ -z "$VIDEO_FILES" ]; then
    echo "No se encontraron archivos de video en el directorio $INPUT_DIR"
    exit 1
  fi

  # Procesar cada archivo de video
  for VIDEO_FILE in $VIDEO_FILES; do
    VIDEO_NAME=$(basename "$VIDEO_FILE" .${VIDEO_FILE##*.})

    # Crear carpeta para el video procesado
    OUTPUT_DIR="${VIDEO_NAME}_output"
    mkdir -p "$OUTPUT_DIR"

    # Extraer el audio del video
    AUDIO_FILE="${OUTPUT_DIR}/${VIDEO_NAME}.wav"
    ffmpeg -i "$VIDEO_FILE" -vn -acodec pcm_s16le -ar 44100 -ac 2 "$AUDIO_FILE"

    # Transcribir el audio utilizando whisper
    whisper "$AUDIO_FILE" --output_dir "$OUTPUT_DIR"

    # Mover el video original a la carpeta de salida
    mv "$VIDEO_FILE" "$OUTPUT_DIR"

    echo "Transcripción completada para $VIDEO_FILE. Los archivos están en la carpeta $OUTPUT_DIR"
  done
}

# Llamada a la función con el argumento proporcionado
# transcribe_video "$1"

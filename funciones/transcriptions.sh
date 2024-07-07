#!/bin/bash

transcribe_video() {
  # Verifica si se proporcionó un directorio, si no, usa el directorio actual
  INPUT_DIR="${1:-.}"

  # Buscar videos en el directorio y procesar cada archivo de video
  find "$INPUT_DIR" -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \) | while read -r VIDEO_FILE; do
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


transcribe_audio() {
  # Verifica si se proporcionó un directorio, si no, usa el directorio actual
  INPUT_DIR="${1:-.}"

  # Buscar archivos de audio en el directorio y procesar cada archivo de audio
  find "$INPUT_DIR" -maxdepth 1 -type f \( -iname "*.wav" -o -iname "*.mp3" -o -iname "*.flac" -o -iname "*.aac" -o -iname "*.m4a" \) | while read -r AUDIO_FILE; do
    AUDIO_NAME=$(basename "$AUDIO_FILE" .${AUDIO_FILE##*.})

    # Crear carpeta para el audio procesado
    OUTPUT_DIR="${AUDIO_NAME}_output"
    mkdir -p "$OUTPUT_DIR"

    # Transcribir el audio utilizando whisper
    whisper "$AUDIO_FILE" --output_dir "$OUTPUT_DIR"

    # Mover el archivo de audio original a la carpeta de salida
    mv "$AUDIO_FILE" "$OUTPUT_DIR"

    echo "Transcripción completada para $AUDIO_FILE. Los archivos están en la carpeta $OUTPUT_DIR"
  done
}

# Llamada a la función con el argumento proporcionado
# transcribe_audio "$1"

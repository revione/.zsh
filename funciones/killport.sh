# Función para matar un proceso escuchando en un puerto específico
# Uso: killport PORT
# Si PORT no se proporciona, solicita al usuario que ingrese el puerto
# Si no se proporciona ninguna entrada dentro de 5 segundos, se cierra la función
function killport() {
    # Si el puerto no se proporciona como argumento, solicitar al usuario que ingrese el puerto
    if [ -z "$1" ]; then
        read -p "Ingrese el número del puerto que desea matar: " PORT
    else
        PORT=$1
    fi

    # Verificar si existe un proceso escuchando en el puerto especificado
    PID=$(lsof -ti:$PORT)
    if [[ -z "$PID" ]]; then
        echo "No se encontró ningún proceso escuchando en el puerto $PORT."
    else
        echo "Proceso escuchando en el puerto $PORT encontrado. PID: $PID"
        echo "Terminando proceso..."
        echo 'kill $PID'
        kill $PID
        echo "Proceso terminado."
    fi
}


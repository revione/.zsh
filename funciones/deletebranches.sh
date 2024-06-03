# Función para borrar todos los branches excepto los que se mencionan
# Realiza un pull de los branches "main" y "mein" desde los repositorios remotos
# Uso: deletebranches [lista de branches a conservar]
# Ejemplo: deletebranches main mein a
function deletebranches() {
    # Obtener la lista de branches a conservar de los argumentos
    KEEP=("$@")

    # Si no se proporcionan branches para conservar, agregar "main" y "mein"
    if [ ${#KEEP[@]} -eq 0 ]; then
        KEEP=("main" "mein")
    fi

    # Obtener el nombre del branch actual
    CURRENT=$(git rev-parse --abbrev-ref HEAD)

    # Si el branch actual no es "mein", cambiar a "mein" y hacer pull desde el repositorio remoto
    if [ "$CURRENT" != "mein" ]; then
        echo "Cambiando a 'mein'..."
        git checkout mein
        git pull opentalk/main main
        git pull opentalk/main mein
    fi

    # Obtener la lista de branches locales y eliminar los branches que se quieren conservar
    BRANCHES=($(git branch --list | cut -c 3-))
    DELETE=()
    for branch in "${BRANCHES[@]}"; do
        if [[ ! " ${KEEP[@]} " =~ " ${branch} " ]]; then
            DELETE+=("$branch")
        fi
    done

    # Verificar si hay branches para borrar
    if [ ${#DELETE[@]} -eq 0 ]; then
        echo "No hay branches para borrar."
    else
        # Confirmar si el usuario desea continuar
        echo "Los siguientes branches se eliminarán: ${DELETE[@]}"
        echo "¿Desea continuar? (s/n) " 
        read -r ANSWER
        if [ "$ANSWER" = "s" ]; then
            # Eliminar los branches
            for branch in "${DELETE[@]}"; do
                echo "Eliminando branch $branch..."
                git branch -D "$branch"
            done
        else
            echo "Operación cancelada."
        fi
    fi

    # Volver al branch original si no es "mein"
    if [ "$CURRENT" != "mein" ]; then
        echo "Cambiando a '$CURRENT'..."
        git checkout "$CURRENT"
    fi
}

# Ejemplo de uso: eliminar todos los branches excepto "main", "mein" y "a"
# deletebranches main mein a

# echo "dirname "$0""
local folder_papa="$(dirname "${0}")"

local create_source_whit () {
  if [ $# -eq 0 ]; then
    echo 'No hay una entrada, fijate.'
    return 1
  fi
  source "$folder_papa/$1.sh"
}

create_source_whit ffmpeg
create_source_whit ffmpeg2
create_source_whit transcriptions
create_source_whit converter
create_source_whit killport
create_source_whit common
create_source_whit commit
create_source_whit reset_repo
create_source_whit "mensajes motivacionales"

check_internet() {
  # Verificar la conexión a Internet
  ping -c 1 www.rev.earth > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Conectado a Internet"
  else
    echo "No hay conexión a Internet"
  fi

  # Obtener la cantidad de datos de subida y bajada
  netstat -i -b -n | awk 'NR>2 {print "Interface:", $1, "Bajada:", $7, "Subida:", $10}'
}

# Llamar a la función
# check_internet


# Nextjs 
# -z : vacio
# $# : numero de argumentos (0)
# $@ : todos los argumentos
create-next-app() {
  echo "$#"
  if [ "$#" -eq 0 ]; then;
    pnpm create next-app@latest
    echo "$user_input"
  else
    pnpm create next-app@latest "$@"
  fi
}
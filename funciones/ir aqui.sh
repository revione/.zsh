# echo "dirname "$0""
local folder_papa="$(dirname "${0}")"

local create_source_whit () {
  if [ $# -eq 0 ]; then
    echo 'No hay una entrada, fijate.'
    return 1
  fi
  source "$folder_papa/$1.sh"
}

create_source_whit killport
create_source_whit common
create_source_whit commit
create_source_whit reset_repo
create_source_whit "mensajes motivacionales"

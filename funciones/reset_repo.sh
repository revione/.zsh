reset_repo () {
  if [ $# -lt 2 ]; then
    echo "Se esperan dos argumentos: user y repo"
    echo "Introduzca los argumentos en 5 segundos o la aplicación se detendrá"

    echo ''

    echo "Por favor, introduzca el valor de user: "
    read -t 10 -r user

    if [ -z "$user" ]; then
      echo "Se acabó el tiempo hasta la próxima"
      return
    fi

    echo "Por favor, introduzca el valor de repo: "
    read -t 10 -r repo

    if [ -z "$repo" ]; then
      echo "Se acabó el tiempo hasta la próxima"
      return
    fi

    reset_repo "$user" "$repo"
    return
  fi

  # El resto de tu código aquí...
  rm -rf .git
  git init
  git add .
  git commit -m "$2"
  git remote add origin git@github.com:$1/$2
  git push -f --set-upstream origin main
}

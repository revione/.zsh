add_changes() {
  echo 'Agregando todo...'
  git add . || return 1
}

commit_changes() {
  echo 'Haciendo commit...'
  git commit -m "$1" || return 1
  echo 'Commit echo.'
}

commit() {
  if [ $# -eq 0 ]; then
    echo 'Agrega un mensaje'
  else
    add_changes && commit_changes "$1" && echo 'Todo listo!'
    if [ $? -ne 0 ]; then
      echo 'Ha ocurrido un error al hacer el commit.'
    fi
  fi
}

vamo () {
  commit 'vamo'
}
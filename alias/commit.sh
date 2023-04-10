# Commit
alias commit='my_commit_function'

add_changes() {
  echo 'Agregando todo...'
  git add . || return 1
}

commit_changes() {
  echo 'Haciendo commit...'
  git commit -m "$1" || return 1
  echo 'Commit echo.'
}

my_commit_function() {
  if [ $# -eq 0 ]; then
    echo 'Agrega un mensaje'
  else
    add_changes && commit_changes "$1" && echo 'Todo listo!'
    if [ $? -ne 0 ]; then
      echo 'Ha ocurrido un error al hacer el commit.'
      # echo '¿Desea continuar? [s/n]'
      # read -r response
      # if [[ "$response" =~ ^[nN]$ ]]; then
      #   echo 'Cancelando commit...'
      #   git reset HEAD~
      # fi
    fi
  fi
}


alias vamo='commit vamo'
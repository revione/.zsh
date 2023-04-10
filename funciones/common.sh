
theirs () {
  git merge --strategy-option=theirs
}

revione () {
  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain ~/.ssh/revione
}

function over() {
  echo "Guardando cambios locales..."
  git stash
  echo "Obteniendo cambios remotos..."
  git pull
  echo "Aplicando cambios guardados..."
  git stash pop
  echo "Resolviendo conflictos con cambios del stash..."
  git merge --strategy-option=theirs
}
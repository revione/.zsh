
theirs () {
  git merge --strategy-option=theirs
}

revione () {
  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain ~/.ssh/revione
}

over() {
  echo "Guardando cambios locales..."
  git stash
  echo "Obteniendo cambios remotos..."
  git pull
  echo "Aplicando cambios guardados..."
  git stash pop
  echo "Resolviendo conflictos con cambios del stash..."
  git merge --strategy-option=theirs
}


my_host () {
  uname -n && ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'
}

template () {
  revione
  git clone git@github.com:revdev-earth/template.git $1
  cd $1
  pmpm i
  echo "Listo!"
  clear
}

push() {
  if [ $# -eq 0 ]; then
    git push -f
  else
    git push -u oliver "$@"
  fi
}


p () {
  vamo
  push
  clear
}
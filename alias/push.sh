alias push='my_push_func'

my_push_func() {
  if [ $# -eq 0 ]; then
    git push -f
  else
    git push -u oliver "$@"
  fi
}

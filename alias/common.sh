alias ls='ls -G'                              # colorize `ls` output
alias zshreload='source ~/.zshrc'             # reload ZSH
alias shtop='sudo htop'                       # run `htop` with root rights
alias grep='grep --color=auto'                # colorize `grep` output
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias less='less -R'
alias g='git'

alias rm='rm -i'                              # confirm removal
alias cp='cp -i'                              # confirm copy
alias mv='mv -i'                              # confirm move
alias cal='gcal --starting-day=1'             # print simple calendar for current month
alias weather='curl v2.wttr.in'               # print weather for current location (https://github.com/chubin/wttr.in)

alias pull='git pull'

alias fetch-all='git fetch --all'
alias all='git fetch --all'

alias status='git status'

alias soft='my_soft_func'

my_soft_func() {
  if [ $# -eq 0 ]; then
    git reset --soft HEAD~1
  else
    git reset --soft HEAD~$1
  fi
}

alias mia='mia_funcion'

mia_funcion() {
  echo "Estos es #@ $@"
  echo "Estos es \$1 $1 "
  echo "Estos es \$2 $2 "
  echo "Estos es \$3 $3 "
  echo "Estos es \$4 $4 "
  for arg in "$@"
  do
    echo "El argumento es: $arg"
  done
}

alias hard='git reset --hard'

alias glog='git log --oneline'
alias oneline='git log --oneline'

alias stash='git stash'
alias pop='git stash pop'

alias remote-add='git remote add'

# pnpm

alias dev='pnpm dev'
alias start='pnpm start:dev'

# script para los package json 
# "scripts" {
#   "script": "chmod x+ script.sh && ./script.sh"
# }

alias script='pnpm script'

# Prettier write all

alias prettier-all='npx prettier --write .'

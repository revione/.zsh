# echo "dirname "$0""
local folder_papa="$(dirname "${0}")"

local create_source_whit () {
  if [ $# -eq 0 ]; then
    echo 'No hay una entrada, fijate.'
    return 1
  fi
  source "$folder_papa/$1.sh"
}

create_source_whit common
# create_source_whit commit

# alias raiz=./raiz

# ejecutable de python
export PATH="/Users/rev/Library/Python/3.9/bin:$PATH"
alias virtualenv=/Users/rev/Library/Python/3.9/bin/virtualenv
alias create-venv="python -m venv venv"
alias active-venv="source venv/bin/activate"


alias vscode='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# code codium

alias code='codium'

aji() {
  cd ~/dev/my-cron-node/
  node ~/dev/my-cron-node/aji/aji.js aji
}
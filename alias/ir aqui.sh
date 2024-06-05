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


# Python

# Si hay un entorno virtual activo, utiliza sus versiones de python y pip
if [ -n "$VIRTUAL_ENV" ]; then
    # alias python="$VIRTUAL_ENV/bin/python3"
    # alias pip="$VIRTUAL_ENV/bin/pip3"
    alias python="$VIRTUAL_ENV/bin/python3.12"
    alias pip="$VIRTUAL_ENV/bin/pip3.12"
    alias p="python"
else
    # alias python=/usr/bin/python3
    # alias pip=/usr/bin/pip3

    alias python=/opt/homebrew/bin/python3.12
    alias pip=/opt/homebrew/bin/pip3.12
fi
# ejecutable de python
export PATH="/Users/rev/Library/Python/3.9/bin:$PATH"
alias virtualenv=/Users/rev/Library/Python/3.9/bin/virtualenv
alias create-venv="python -m venv venv"
alias active-venv="source venv/bin/activate"

# console ninja
PATH=~/.console-ninja/.bin:$PATH

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias vscode='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# code codium

alias code='codium'
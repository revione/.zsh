# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/Users/revi/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


eval "$(starship init zsh)"

source /Users/revi/.zsh/fsh/F-Sy-H.plugin.zsh
source /Users/revi/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/revi/.zsh/key-bindings.zsh

source "$HOME/.zsh/index.sh"

# Load completion config
source /Users/revi/.zsh/completion.zsh
# source $HOME/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export PATH="/opt/homebrew/bin/python3:$PATH"
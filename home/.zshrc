
add_to_path() {
  local new_path=$1
  if ! echo "$PATH" | grep -q -E "(^|:)$new_path($|:)" ; then
    if [ -d "$new_path" ]; then
      export PATH=$new_path:$PATH
    fi
  fi
}

add_to_path "/usr/local/lib"
add_to_path "/usr/local/bin"
add_to_path "$HOME/go/bin/"
add_to_path "$HOME/.cargo/bin"

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="robbyrussell"

plugins=(
  git
  vi-mode
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
 
# fuzzy matching for ctrl  +  r and others
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# backspace stuff
bindkey '^H' backward-kill-word
# Set the terminal output standard
export LC_ALL="en_US.UTF-8"

eval "$(starship init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


. "$HOME/.deno/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

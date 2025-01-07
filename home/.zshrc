# If you come from bash you might have to change your $PATH.
export PATH=usr/local/lib:$PATH

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='hx'
else
  export EDITOR='nvim'
fi

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
# Aliases, please use sparingly and mostly only for programs that are named different than the common name on other systems
alias hx="helix"

eval "$(starship init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# add go bin to path
export PATH=$PATH:$HOME/go/bin/

# add rust bin to path
export PATH=$PATH:$HOME/.cargo/bin

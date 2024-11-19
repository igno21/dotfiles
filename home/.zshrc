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
  export EDITOR='code -w'
fi

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
 
# fuzzy matching for ctrl  +  r and others
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# backspace stuff
bindkey '^H' backward-kill-word
# Set the terminal output standard
export LC_ALL="en_US.UTF-8"
# Allow use of google cloud cli
source /etc/profile.d/google-cloud-cli.sh
# Aliases, please use sparingly and mostly only for programs that are named different than the common name on other systems
alias hx="helix"

eval "$(starship init zsh)"

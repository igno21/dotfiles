# ==============================================================================
# 1. ENVIRONMENT VARIABLES (Exported globally)
# ==============================================================================

# -- Language & Editor --
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR='nvim'

# -- Go (Golang) Setup --
# 1. Force GOROOT to the Snap path (use 'current' so updates don't break it)
# Check if /snap/go/current exists; if not, ask go
if [ -d "/snap/go/current" ]; then
    export GOROOT="/snap/go/current"
else
  export GOROOT="$(go env GOROOT)"
fi

# 2. Force GOPATH (Standard location)
export GOPATH="$HOME/go"

# 3. Add both to PATH
# Note: We put GOROOT/bin first to ensure we use the Snap binary, not a stale one
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# -- Path Configuration --
# 'typeset -U' ensures that we never get duplicate entries in our PATH
typeset -U path PATH

# Prepend user paths (Priority: High -> Low)
path=(
  "$HOME/.local/bin"        # pipx and user scripts
  "$GOPATH/bin"             # Go tools
  "$HOME/.cargo/bin"        # Rust/Cargo tools
  "$HOME/.nvm/versions/node/$(nvm version 2>/dev/null)/bin" # NVM (fallback)
  "/usr/local/bin"
  "/usr/local/sbin"
  $path
)
export PATH

# -- NVM (Node Version Manager) --
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# -- Deno --
if [ -f "$HOME/.deno/env" ]; then
    . "$HOME/.deno/env"
fi

# -- Envman --
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# ==============================================================================
# 2. INTERACTIVE SHELL CONFIGURATION
# (Only runs when you are actually using the terminal)
# This prevents 'gopls' and other tools from crashing due to shell output.
# ==============================================================================
if [[ $- == *i* ]]; then

  # -- Oh-My-Zsh Configuration --
  ZSH="/usr/share/oh-my-zsh/"
  
  # Disable the internal theme because we use Starship
  ZSH_THEME="" 
  
  plugins=(
    git
    vi-mode
  )

  ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
  if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir -p "$ZSH_CACHE_DIR"
  fi

  # Source Oh-My-Zsh if it exists
  if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
      source "$ZSH/oh-my-zsh.sh"
  fi

  # -- Plugins & Bindings --
  
  # Autosuggestions
  if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  elif [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
   
  # FZF (Fuzzy Finder)
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
      source /usr/share/fzf/key-bindings.zsh
      source /usr/share/fzf/completion.zsh
  fi

  # Keybindings
  bindkey '^H' backward-kill-word

  # -- Prompt (Starship) --
  # This must be last to ensure it wraps everything correctly
  eval "$(starship init zsh)"

fi

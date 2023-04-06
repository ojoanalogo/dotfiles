# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found
  # Auto suggestions
  zgen load zsh-users/zsh-autosuggestions
  # Syntax highlighting bundle
  zgen load zsh-users/zsh-syntax-highlighting
  # generate the init script from plugins above
  zgen save
fi

# declare zsh var
ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"

# export bin folder to path
export PATH="/usr/local/bin:$PATH"

# fnm
export PATH="$PATH:$HOME/.fnm"
eval "`fnm env`"

# flutter
export PATH="$PATH:$HOME/flutter/bin"

# aliases
alias ls="lsd -a"
alias shit="cowsay shit"
alias vim="nvim"
alias vi="nvim"

# load starship prompt
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/mxarc/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
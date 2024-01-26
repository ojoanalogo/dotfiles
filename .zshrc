
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found
  zgen load supercrabtree/k
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
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

# export bin folder to path
export PATH="/usr/local/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/sdks/flutter/bin"

# fnm
export PATH="$PATH:$HOME/.fnm"
eval "`fnm env`"

# aliases
alias ls="lsd"
alias shit="cowsay shit"
alias vim="nvim"
alias vi="nvim"
alias icat="kitty +kitten icat"
alias sizeof="$HOME/Code/dotfiles/scripts/sizeof"
alias photomod="$HOME/Code/dotfiles/scripts/photomod"
alias dedupvid="$HOME/Code/dotfiles/scripts/dedupvid"
alias rm="trash"

# load starship prompt
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/mxarc/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



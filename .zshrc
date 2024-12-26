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

# wm specific env variables
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

# gtk fixes
export GTK_THEME="Flat-Remix-GTK-Teal-Darkest-Solid"

# export bin folder to path
export PATH="/usr/local/bin:$PATH"

# fnm
export PATH="$PATH:$HOME/.fnm"
eval "`fnm env`"

# Load secret tokens
if [ -f "$HOME/.zsh_secrets" ]; then
    source "$HOME/.zsh_secrets"
fi

function nvim {
  ($HOME/dotfiles/scripts/nvim "$@")
}

# use nvim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# cursor cmd, run and forget
function cursor {
  (/usr/bin/cursor "$@" >/dev/null 2>&1 &)
}

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mxarc/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mxarc/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mxarc/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mxarc/google-cloud-sdk/completion.zsh.inc'; fi

# pyenv config

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# load starship prompt
eval "$(starship init zsh)"

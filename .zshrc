. "$HOME/.local/bin/env"

# Load aliases
[ -f ~/.aliases ] && source ~/.aliases

# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# go
export PATH="$PATH:$(go env GOPATH)/bin"

. "$HOME/.local/bin/env"

# Load aliases
[ -f ~/.aliases ] && source ~/.aliases

# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# uv
eval "$(uv generate-shell-completion zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go
export PATH="$PATH:$(go env GOPATH)/bin"

# iTerm2 Natural Text Editing keybindings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[^?" backward-delete-word
bindkey "^[[3;3~" delete-word

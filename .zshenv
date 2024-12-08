# Paths
export PYTHON3_HOST_PROG=/usr/local/bin/python3
export PIPX_DEFAULT_PYTHON=$HOME/.local/share/zinit/plugins/pyenv---pyenv/versions/3.10.14/bin/python
export GOPATH=$HOME/.go
export GO111MODULE=auto
export EDITOR=/usr/local/bin/vi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.ghcup/bin:$PATH
export PATH=/opt/homebrew/opt/openssl@3/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

export GPG_TTY=$(tty)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
. "$HOME/.cargo/env"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --color 16'


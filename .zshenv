# Paths
export PYTHON3_HOST_PROG=/usr/local/bin/python3
export GOPATH=$HOME/src/go
export GO111MODULE=auto
export PYTHONSTARTUP=$HOME/.pythonrc.py
export EDITOR=/usr/local/bin/vi

export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.nimble/bin:$PATH
# export PATH=$HOME/.flutter/bin:$PATH
export PATH=$HOME/.ghcup/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/3.0.0/bin:$PATH

export GPG_TTY=$(tty)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
. "$HOME/.cargo/env"

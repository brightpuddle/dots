# Paths
export PYTHON3_HOST_PROG=/usr/local/bin/python3
export GOPATH=$HOME/src/go
export GO111MODULE=auto
# export PYTHONSTARTUP=$HOME/.pythonrc.py
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
export PATH=/opt/homebrew/opt/openssl@3/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/Users/nathan/.spicetify

export GPG_TTY=$(tty)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
. "$HOME/.cargo/env"

# FZF
# Alternatively --no-ignore-vcs
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
# TERM="alacritty-direct"

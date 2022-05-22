############################################################
# Plugins
############################################################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Prompt
zinit ice lucid atload'source ~/.p10k.zsh; _p9k_precmd'
zinit light romkatv/powerlevel10k

# Load a few important annexes, without Turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


# Git prefixes
zinit ice wait lucid
zinit light wfxr/forgit

# History
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

# cd
zinit ice wait"2" as"command" from"gh-r" lucid \
  mv"zoxide -> zoxide" \
  atclone"./zoxide init zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!'
zinit light ajeetdsouza/zoxide
# eval "$(zoxide init zsh)"
############################################################
# Aliases
############################################################
# Aliases
alias ls="ls -G"
alias ll="ls -al"
alias tt="taskwarrior-tui"
alias vcat="~/src/nvimpager/nvimpager -c "
alias icat="kitty +kitten icat"
alias lg='lazygit'
alias config='lazygit -g $HOME/.local/share/yadm/repo.git'
alias cat='bat -p'
alias l='exa'

############################################################
# Options
############################################################
# History
setopt appendhistory
setopt sharehistory
setopt incappendhistory
# VI keys for command line editing
bindkey -v

# History
h() {
  if [ -z "$*" ];
  then history 1;
  else history 1 | egrep "$@";
  fi;
}

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ctrl-P
fzf-open-file-or-dir() {
  local cmd="command rg . --files --color=never"
  local out=$(eval $cmd | fzf --exit-0)

  if [ -f "$out" ]; then
    vi "$out"
  fi
}
zle -N fzf-open-file-or-dir
# Ctrl-P bindings
bindkey '^P' fzf-open-file-or-dir
bindkey -s '^W' '^D'

# Titles
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~}"
}
function set-title-preexec() {
  printf "\e]2;%s\a" "$1"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

eval $(opam env)
source $HOME/.config/nnn/config

# CD on quit for nnn
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

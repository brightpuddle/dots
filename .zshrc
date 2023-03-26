# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Pyenv
zinit ice wait"0" atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
  silent \
  atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
  as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

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
alias t="task"
alias tt="taskwarrior-tui"
alias icat="kitty +kitten icat"
alias lg='lazygit'
alias ly='lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git'
alias lg-yadm='lazygit -g $HOME/.local/share/yadm/repo.git'
alias cat='bat -Pp'

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
  local out=$(eval $cmd | fzf --exit-0 --height 40%)

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

# if [ "$TMUX" = "" ]; then tmux; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

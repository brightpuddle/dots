if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

############################################################
# Plugins
############################################################
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zi ice lucid atload'source ~/.p10k.zsh; _p9k_precmd'
zi light romkatv/powerlevel10k

zi light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


zi light-mode lucid for \
        wait='1' atload='_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
        blockf \
    zsh-users/zsh-completions

zinit ice wait lucid
zinit light wfxr/forgit

zinit ice wait lucid
zinit light joshskidmore/zsh-fzf-history-search

zinit ice wait"0" atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
  silent \
  atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
  as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice wait"0" as"command" from"gh-r" lucid \
  atload'unalias zi' \
  mv"zoxide -> zoxide" \
  atclone"./zoxide init zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!'
zinit light ajeetdsouza/zoxide

############################################################
# Functions
############################################################
# Yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# Ctrl-P
fzf-open-file-or-dir() {
  local cmd="command rg . --files --color=never"
  local out=$(eval $cmd | fzf --exit-0 --height 40% --color 16)

  if [ -f "$out" ]; then
    vi "$out"
  fi
}
zle -N fzf-open-file-or-dir
############################################################
# Aliases
############################################################
alias ls="ls -G"
alias ll="ls -al"
alias l="eza"
alias lt="eza -T"
alias tt="taskwarrior-tui"
alias lg='lazygit'
alias cat='bat -Pp'
alias cd='z'
alias h='history 1 | rg'

############################################################
# Options
############################################################
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify


# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

############################################################
# Keys
############################################################
bindkey '^P' fzf-open-file-or-dir
bindkey -s '^W' '^D'
bindkey -v


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
### End of Zinit's installer chunk

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# [BEGIN profiling]
# zmodload zsh/zprof

# Aliases
alias ls="ls -G"
alias ll="ls -al"
alias tt="taskwarrior-tui"
alias vcat="~/src/nvimpager/nvimpager -c "
alias icat="kitty +kitten icat"
alias lg='lazygit'

# History
setopt appendhistory
setopt sharehistory
setopt incappendhistory

h() {
  if [ -z "$*" ];
  then history 1;
  else history 1 | egrep "$@";
  fi;
}

# VI keys for command line editing
bindkey -v

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

# key mappings
bindkey '^P' fzf-open-file-or-dir
bindkey -s '^W' '^D'

PROMPT='%1~ $ '

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

# OCaml
eval $(opam env)

# nnn
source $HOME/.config/nnn/config


# Haskell
# [ -f "/Users/nathan/.ghcup/env" ] && source "/Users/nathan/.ghcup/env" # ghcup-env

# Perl
PATH="/Users/nathan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/nathan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/nathan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/nathan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/nathan/perl5"; export PERL_MM_OPT;

export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/3.0.0/bin:$PATH

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

# base16 shell - https://github.com/chriskempson/base16-shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
# base16_ocean

# [END profiling]
# zprof

### Added by Zinit's installer
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
zinit load wfxr/forgit

### End of Zinit's installer chunk

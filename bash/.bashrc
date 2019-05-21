# vim: ft=sh
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

set -P # follow physical directory structure

# Do not suspend programs (such as tig) on Ctrl-Y.
stty dsusp undef
# Do not stop on CTRL-S (see: man stty)
stty -ixon

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
#for option in autocd globstar; do
#  shopt -s "$option" 2> /dev/null;
#done;

# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;32m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[1;30m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00m\]"
RED="\[\033[0;31m\]"
VIOLET="\[\033[01;35m\]"
WHITE="\[\033[01;37m\]"
RESTORE="\[\033[0m\]"

prompt_command() {
  local __location="$BLUE\w"
  local __branch_color="$GRAY"
  local __git="$(__git_ps1 '%s')"
  local __tail="$MAGENTA"
  local __restore="$RESTORE"
  local __prompt_symbol="❯"

  # TODO: replace < > and <> with nice symbols

  PS1="$__location $__branch_color$__git\n$__tail$__prompt_symbol $__restore"
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=prompt_command

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

export PS2="→ ";

GPG_TTY=$(tty)
export GPG_TTY

HOMEBREW_PREFIX=$(brew --prefix)
source $HOMEBREW_PREFIX/etc/bash_completion
source $HOMEBREW_PREFIX/etc/profile.d/z.sh
unset HOMEBREW_PREFIX

# Easier navigation:
alias ..="cd .."
alias ...="cd ../.."

alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias -- -="cd -"

# fs
alias ls='ls -GpF'
alias ll='ls -alGpF'

# Vim
alias vim="nvim"

# Tools
# - ignore alias: \cat or command cat
alias cat="bat"
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias help='tldr'

# NPM
alias nb='npm run build'
alias ns='npm run start'
alias nt='npm run test'
alias np='npm version patch && git push origin master --tags && npm publish'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Shortcuts
alias d='cd ~/Documents/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias s='cd ~/src'
alias t='cd ~/src/terkel'
alias w='cd ~/src/hellomonday'

# Git
alias g='git'
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gs='git s'
alias gst='git st'

# Safe delete
alias del="mv -t ~/.Trash/"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Local IP
function localip {
  ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}

# Top... twenty commands used :>
function topten {
  history | awk '{ print $2 }' | LC_ALL=C sort -i | LC_ALL=C uniq -c | LC_ALL=C sort -irn | head -n 20
}

# Better tree lists
tt() {
    tree -I '.git|.node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Easy npm publish
publish() {
  npm version "$1" && git push origin master --tags && npm publish
}

# extract any time of compressed file
extract() {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1  ;;
            *.tar.gz)    tar xzf $1  ;;
            *.bz2)       bunzip2 $1  ;;
            *.rar)       rar x $1    ;;
            *.gz)        gunzip $1   ;;
            *.tar)       tar xf $1   ;;
            *.tbz2)      tar xjf $1  ;;
            *.tgz)       tar xzf $1  ;;
            *.zip)       unzip $1   ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1  ;;
            *)        echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fzf shell extensions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ~/.bashrc_top_secret can be used for settings that must not be shared.
if [ -r .bashrc_top_secret ] && [ -f .bashrc_top_secret ] ; then
    source .bashrc_top_secret
fi

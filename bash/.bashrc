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

lf_ssh=$([ "${SSH_TTY}" ] && echo "⎋ ")
PS1='\e[34m\w\e[0m\n';
PS1+='\e[1;35m❯\e[0m ';
export PS1;
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

# NPM
alias nb='npm run build'
alias ns='npm run start'
alias nt='npm run test'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Shortcuts
alias d='cd ~/Documents/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias s='cd ~/src'
alias r='cd ~/src/robin'
alias t='cd ~/src/terkel'
alias a='cd ~/src/activetheory'

# Git
alias gap='git add . -p'
alias gb='git branch'
alias gba='git branches'
alias gd='git diff'
alias gds='git ds'
alias gl='git ll'
alias gp='git push'
alias gs='git s'
alias gst='git st'

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

function man2pdf {
  man -t $1 | open -f -a Preview
}

# Better tree lists
tt() {
    tree -I '.git|.node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
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

MARKPATH=$HOME/.marks
CDPATH=.:$MARKPATH

function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  (t="$(printf "\t")"; cd $MARKPATH && stat -f"%N$t%SY" * | column -ts"$t")
}

# fzf shell extensions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ~/.bashrc_top_secret can be used for settings that must not be shared.
if [ -r .bashrc_top_secret ] && [ -f .bashrc_top_secret ] ; then
    source .bashrc_top_secret
fi

# vim: ft=sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'
# Increase Bash history size.
export HISTSIZE='8192';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Highlight section titles in manual pages.
export LESS_TERMCAP_md=$(tput setaf 64);
HOMEBREW_PREFIX=/usr/local
export PATH="$HOME/Applications/Scripts:$HOME/.cabal/bin:$HOMEBREW_PREFIX/sbin:$PATH"
unset HOMEBREW_PREFIX
# fzf
export FZF_DEFAULT_COMMAND='rg --glob "!{.git,node_modules}" --files 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:-1,hl:238,fg+:243,bg+:-1,hl+:166
  --color info:248,prompt:243,spinner:242,pointer:242,marker:166'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --no-height --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# ~/.bash_profile_top_secret can be used for settings that must not be shared.
if [ -r .bash_profile_top_secret ] && [ -f .bash_profile_top_secret ] ; then
    source .bash_profile_top_secret
fi

# Load .bashrc only if this is an interactive shell
case "$-" in *i*) . ~/.bashrc; esac;
export PATH="/usr/local/opt/ncurses/bin:$PATH"

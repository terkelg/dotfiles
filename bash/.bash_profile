# vim: ft=sh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export EDITOR='nvim'
export GREP_OPTIONS='--color=auto'

# Increase Bash history size.
export HISTSIZE='8192';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md=$(tput setaf 64);
HOMEBREW_PREFIX=/usr/local
export PATH="$HOME/.bin:$HOME/Applications/Scripts:$HOME/.cabal/bin:$HOMEBREW_PREFIX/sbin:$PATH"
unset HOMEBREW_PREFIX

# fzf
export FZF_DEFAULT_COMMAND='rg --glob "!{.git,node_modules}" --files 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
# Using highlight - https://remysharp.com/2018/08/23/cli-improved
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS --no-height --preview 'bat --color \"always\" {}'"

# https://github.com/drduh/YubiKey-Guide#replace-agents
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# ~/.bash_profile_top_secret can be used for settings that must not be shared.
if [ -r .bash_profile_top_secret ] && [ -f .bash_profile_top_secret ] ; then
    source .bash_profile_top_secret
fi

# Load .bashrc only if this is an interactive shell
case "$-" in *i*) . ~/.bashrc; esac;
export PATH="/usr/local/opt/ncurses/bin:$PATH"


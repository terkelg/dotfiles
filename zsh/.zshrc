# vim: ft=zsh
setopt    correct    # Correct spelling for commands
unsetopt  correctall # turn off the infernal correctall for filenames

# Changing directories
setopt    auto_cd
setopt    auto_pushd
setopt    pushd_ignore_dups
setopt    pushd_minus

## Expansion and globbing
setopt    glob
unsetopt  case_glob
unsetopt  case_match

# Emacs key bindings (use -v for vi key bindings)
bindkey -e

# Use Esc+Backspace to delete the previous word (vi style)
bindkey $'^[^?' vi-backward-kill-word

# Base PATH
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin"

# Geoff Greer made an online tool that makes it 
# easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export LSCOLORS='Exfxcxdxbxegedabagacad'
export LS_COLORS='di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

export CLICOLOR=1
export EDITOR='nvim'
export GREP_OPTIONS='--color=auto'

# FZF
export FZF_DEFAULT_COMMAND='rg --files 2>/dev/null'
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:-1,hl:238,fg+:243,bg+:-1,hl+:166
  --color info:248,prompt:243,spinner:242,pointer:242,marker:166'

# Install and load plugins
source ~/.zsh_plugins

# Load aliases
source ~/.zsh_aliases

# Load functions
source ~/.zsh_functions

# Load completion configuration
source ~/.zsh_completion

load-our-ssh-keys

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/terkel/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/terkel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/terkel/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/terkel/google-cloud-sdk/completion.zsh.inc'; fi

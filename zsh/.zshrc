# vim: ft=zsh
export CLICOLOR=1
export EDITOR='nvim'
export GREP_OPTIONS='--color=auto'

# Highlight section titles in manual pages
export LESS_TERMCAP_md=$(tput setaf 64);
export PATH="$HOME/Applications/Scripts:$HOME/.cabal/bin:usr/local/sbin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files 2>/dev/null'
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:-1,hl:238,fg+:243,bg+:-1,hl+:166
  --color info:248,prompt:243,spinner:242,pointer:242,marker:166'
GPG_TTY=$(tty)
export GPG_TTY

# Functions
#fpath+=~/.zshfunctions
#autoload topten
#autoload man2pdf

autoload -U compinit && compinit
zmodload -i zsh/complist
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

bindkey -M menuselect '^[[Z' reverse-menu-complete

# Changing directories
setopt    auto_cd
setopt    auto_pushd
setopt    pushd_ignore_dups
setopt    pushd_minus

# Completion
#setopt   auto_list            # Default
#unsetopt bash_auto_list       # Default
#setopt   auto_menu            # Default
setopt    glob_complete        # Generate completion list from glob expansion
setopt    list_packed          # Make list of completions occupy less space
setopt    list_rows_first      # Sort completions from left to right (by row)
#setopt   list_types           # Default
unsetopt  list_ambiguous       # Display completion list immediately on ambiguous completion
#unsetopt menu_complete        # Default
#unsetopt rec_exact            # Default

## Expansion and globbing
setopt    glob
unsetopt  case_glob
unsetopt  case_match

# Aliases
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias asmake='./makefile.applescript'
alias f=fossil

# Suffix aliases
alias -s  vim="nvim"

# Emacs key bindings (use -v for vi key bindings)
bindkey -e
# Use Esc+Backspace to delete the previous word (vi style)
bindkey $'^[^?' vi-backward-kill-word

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

STOW ?= stow
DIRS ?= etc tmux gpg ssh zsh
DOTDIR = $(shell pwd)
HOME = /Users/terkel
IGNORE = .DS_Store

setup: dependencies config link

link:
	@$(STOW) --target=$(HOME) --ignore=$(IGNORE) -Rv $(DIRS)

dependencies:
	./scripts/brew.sh

config:
	./scripts/terminfo.sh

STOW ?= stow
DIRS ?= etc git tmux gpg ssh bash alacritty
DOTDIR = $(shell pwd)
HOME = /Users/terkel
IGNORE = .DS_Store

bootstrap: links setup

links:
	@$(STOW) --target=$(HOME) --ignore=$(IGNORE) -Rv $(DIRS)

setup: links
	./scripts/brew.sh
	./scripts/npm.sh
	./scripts/terminfo.sh

setup-macos:
	> Setup macOS defaults
	./scripts/macos.sh

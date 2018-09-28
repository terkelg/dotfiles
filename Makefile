STOW ?= stow
DIRS ?= etc git tmux gpg ssh bash
DOTDIR = $(shell pwd)
HOME = /Users/terkel
IGNORE = .DS_Store
ccyellow=$(echo -e "\033[0;33m")

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

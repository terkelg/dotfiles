STOW ?= stow
DIRS ?= etc git tmux gpg ssh bash
DOTDIR = $(shell pwd)
HOME = /Users/terkel
IGNORE = .DS_Store

links:
	@$(STOW) --target=$(HOME) --ignore=$(IGNORE) -Rv $(DIRS)

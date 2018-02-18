#!/usr/bin/env bash

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Pretty important for this setup to work
brew install stow
brew install pinentry-mac

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Awesome tools
brew install fzf
brew install z 
brew install node
brew install git
brew install git-lfs
brew install ack
brew install ripgrep
brew install tree
brew install wget
brew install tig
brew install youtube-dl
brew install diff-so-fancy
brew install httpie
brew install highlight
brew install gnu-sed --with-default-names

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew tap caskroom/cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

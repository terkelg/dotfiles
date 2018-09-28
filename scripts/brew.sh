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

# Basics
brew install node
brew install git
brew install git-lfs
brew install tmux

# Tools
brew install fzf           # Fuzzy search
brew install diff-so-fancy # Fancy git diffing
brew install z             # Fast directory change
brew install httpie        # HTTP Client
brew install ripgrep       # Recursively searches directories with regex
brew install tig           # Git Client
brew install bat           # Better 'cat'
brew install highlight     # Code highlighting (Used by fzf)
brew install tree          # List dirs as tree graphs
brew install ack           # Grep-like text finder
brew install wget          # Download stuff from the web
brew install youtube-dl    # Download videos
brew install prettyping    # Nicer ping command
brew install htop          # Better top (quickly diagnosing CPU)
brew install tldr          # Useful help
brew install fd            # A simple, fast and user-friendly alternative to 'find'
brew install bash-completion
brew install gnu-sed --with-default-names
brew install reattach-to-user-namespace # Copy and Paste with tmux on macos

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew tap caskroom/cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Neovim and Python
brew install python3
pip3 install neovim

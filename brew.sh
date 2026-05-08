#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -sf "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Java version manager
brew install jenv
brew install --cask temurin@21

# Java build tools
brew install maven
brew install gradle

# Node version manager
brew install nvm

# Go
brew install go

# pnpm
brew install pnpm

# Dock manager
brew install dockutil

# Terminal multiplexer
brew install tmux

# CLI utilities
brew install fzf
brew install ripgrep
brew install bat
brew install jq
brew install gh
brew install htop
brew install git-delta

# Python toolchain manager
brew install uv

# Containers & cloud
brew install --cask docker
brew install kubectl
brew install awscli
brew install terraform

# Apps
brew install --cask rectangle
brew install --cask mos
brew install --cask logi-options+
brew install --cask jordanbaird-ice
brew install --cask jetbrains-toolbox
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask postman
brew install --cask spotify
brew install --cask typora
brew install --cask obsidian

# Fonts
brew install --cask font-hack-nerd-font

# Remove outdated versions from the cellar.
brew cleanup

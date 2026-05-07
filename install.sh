#!/usr/bin/env bash

DOTFILES_REPO="git@github.com:vincent-626/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# Install Homebrew if missing
if ! command -v brew &> /dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Add brew to PATH for the rest of this script (Apple Silicon)
	if [ -f "/opt/homebrew/bin/brew" ]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
fi

# Clone dotfiles repo if not already present
if [ ! -d "$DOTFILES_DIR" ]; then
	echo "Cloning dotfiles..."
	git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# Install tools and apps
echo "Installing packages..."
bash brew.sh

# Sync dotfiles and configure shell
echo "Setting up dotfiles..."
bash bootstrap.sh --force

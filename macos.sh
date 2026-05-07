#!/usr/bin/env bash

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock orientation -string "bottom"

# Finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder AppleShowAllFiles -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 1

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false

# Screenshots
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"

# Dock apps
if command -v dockutil &> /dev/null; then
	dockutil --remove all --no-restart
	dockutil --add '/Applications/Brave Browser.app' --no-restart
	dockutil --add '/Applications/Google Chrome.app' --no-restart
	dockutil --add '/Applications/Spotify.app' --no-restart
	dockutil --add '/Applications/Visual Studio Code.app' --no-restart
	dockutil --add '/Applications/iTerm.app' --no-restart
	dockutil --add '/System/Applications/Calendar.app' --no-restart
	dockutil --add '/System/Applications/Notes.app' --no-restart
	dockutil --add '/System/Applications/System Settings.app' --no-restart
	dockutil --add '/Applications' --view grid --display folder --sort name --no-restart
fi

# Apply changes
killall Dock
killall Finder

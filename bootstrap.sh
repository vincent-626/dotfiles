#!/usr/bin/env bash

cd "$(dirname "$0")";

git pull origin main;

function setupFzf() {
	if command -v fzf &> /dev/null; then
		"$(brew --prefix)/opt/fzf/install" --all --no-update-rc 2>/dev/null;
	fi;
}

function registerJdks() {
	if ! command -v jenv &> /dev/null; then
		return;
	fi;
	for jdk in /Library/Java/JavaVirtualMachines/*/Contents/Home; do
		jenv add "$jdk" 2>/dev/null;
	done;
}

function installOhMyZsh() {
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;
	fi;

	ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}";

	if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions";
	fi;

	if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting";
	fi;
}

function doIt() {
	setupFzf;
	registerJdks;
	installOhMyZsh;
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "install.sh" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

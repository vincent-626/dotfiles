#!/usr/bin/env bash

cd "$(dirname "$0")";

git pull origin main;

function installVSCodeExtensions() {
	local code_bin="code"
	if ! command -v code &> /dev/null; then
		code_bin="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
		[ ! -f "$code_bin" ] && return;
	fi;
	extensions=(
		# Git
		eamodio.gitlens
		github.vscode-pull-request-github
		github.vscode-github-actions
		# Containers & cloud
		ms-azuretools.vscode-docker
		ms-vscode-remote.remote-containers
		ms-kubernetes-tools.vscode-kubernetes-tools
		Tim-Koehler.helm-intellisense
		# Languages
		golang.go
		ms-python.python
		ms-toolsai.jupyter
		ms-vscode.vscode-typescript-next
		redhat.vscode-yaml
		ms-vscode.makefile-tools
		# Frontend
		bradlc.vscode-tailwindcss
		esbenp.prettier-vscode
		dbaeumer.vscode-eslint
		# Markdown
		yzhang.markdown-all-in-one
		cyberbiont.vscode-open-in-typora
		# UI & productivity
		vscode-icons-team.vscode-icons
		usernamehw.errorlens
		streetsidesoftware.code-spell-checker
	)
	for ext in "${extensions[@]}"; do
		"$code_bin" --install-extension "$ext" --force;
	done;
}

function installNode() {
	local nvm_sh="$(brew --prefix)/opt/nvm/nvm.sh"
	[ ! -f "$nvm_sh" ] && return;
	export NVM_DIR="$HOME/.nvm"
	\. "$nvm_sh"
	nvm install --lts;
	nvm alias default node;
}

function installClaudeCode() {
	if command -v npm &> /dev/null; then
		npm install -g @anthropic-ai/claude-code;
	fi;
}

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
	mkdir -p "$HOME/Work";
	installNode;
	installVSCodeExtensions;
	installClaudeCode;
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

# dotfiles

Personal macOS dotfiles and machine setup.

## Fresh machine setup

> **Before you start:** make sure your SSH key is added to GitHub, as the dotfiles repo is cloned over SSH.

Run the one-liner below — it installs Homebrew, clones this repo, installs all packages, and syncs the dotfiles:

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/vincent-626/dotfiles/main/install.sh)"
```

## What gets installed

**Shell**
- oh-my-zsh with `eastwood` theme
- Plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`

**Languages & version managers**
- Node.js via `nvm`, pnpm
- Go
- Python via `uv`
- Java via `jenv`, Temurin JDK 17 & 21

**CLI tools**
- `fzf`, `ripgrep`, `bat`, `jq`, `gh`, `htop`, `git-delta`

**Cloud & containers**
- Docker Desktop, `kubectl`, `awscli`, `terraform`

**Apps**
- iTerm2, VS Code, Google Chrome, Brave

**Fonts**
- Hack Nerd Font

## Scripts

| Script | Description |
|--------|-------------|
| `install.sh` | Full setup from scratch — run this on a new machine |
| `brew.sh` | Installs Homebrew packages and casks |
| `bootstrap.sh` | Syncs dotfiles to `~` and configures the shell |

## Updating

To pull the latest dotfiles and re-sync:

```sh
cd ~/dotfiles && bash bootstrap.sh
```

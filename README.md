# dotfiles

Personal macOS dotfiles and machine setup.

## Fresh machine setup

### 1. Generate an SSH key and add it to GitHub

```sh
ssh-keygen -t ed25519 -C "vincentminghan26@gmail.com"
```

Copy the public key:

```sh
cat ~/.ssh/id_ed25519.pub
```

Then add it to GitHub at [github.com/settings/keys](https://github.com/settings/keys).

### 2. Run the setup

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/vincent-626/dotfiles/main/install.sh)"
```

This installs Homebrew, clones this repo, installs all packages, and syncs the dotfiles.

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
- iTerm2, VS Code, JetBrains Toolbox, Google Chrome, Brave, Spotify, Typora, Obsidian, Claude Code

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

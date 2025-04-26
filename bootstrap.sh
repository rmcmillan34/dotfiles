# bootstrap.sh — Core CLI setup
#!/usr/bin/env bash
set -euxo pipefail

# Ensure GNU stow is installed
if ! command -v stow &>/dev/null; then
  sudo apt-get update -qq
  sudo apt-get install -yq stow
fi

# Install core tools non‑interactively
sudo apt-get install -yq \
  tmux zsh curl git unzip ripgrep fd-find fzf

# Symlink all modules under setup/
stow --dir=setup --target="$HOME" nvim
stow --dir=setup --target="$HOME" tmux
stow --dir=setup --target="$HOME" zsh
stow --dir=setup --target="$HOME" git
stow --dir=setup --target="$HOME" starship

# Set zsh as default shell if not already
if [[ "$SHELL" != *"zsh" ]]; then
  chsh -s "$(command -v zsh)"
fi

# Install Neovim Co-Pilot package
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

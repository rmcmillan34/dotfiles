# scripts/install-fonts.sh — Nerd-fonts installer
#!/usr/bin/env bash
set -euxo pipefail

# This script installs the JetBrains Mono and Hack Nerd Fonts.

# On macOS (Homebrew)
if command -v brew &>/dev/null; then
  brew tap homebrew/cask-fonts
  brew install --cask font-jetbrains-mono-nerd-font \
                   font-hack-nerd-font \
                   font-iosevka-nerd-font
else
  # On Debian/Ubuntu
  sudo apt-get update -qq
  sudo apt-get install -yq fonts-jetbrains-mono fonts-firacode
fi

# On Arch Linux
yay -S nerd-fonts-jetbrains-mono nerd-fonts-hack

# On Fedora
sudo dnf install -yq \
  nerd-fonts-jetbrains-mono \
  nerd-fonts-hack

# ---------- Install Iosvka Nerd Font -------------
# On macOS (Homebrew)
brew tap homebrew/cask-fonts
brew install --cask font-iosvka-nerd-font

# scripts/install-fonts.sh — Nerd-fonts installer
#!/usr/bin/env bash
set -euxo pipefail

# On macOS (Homebrew)
if command -v brew &>/dev/null; then
  brew tap homebrew/cask-fonts
  brew install --cask font-jetbrains-mono-nerd-font \
                   font-hack-nerd-font
else
  # On Debian/Ubuntu
  sudo apt-get update -qq
  sudo apt-get install -yq fonts-jetbrains-mono fonts-firacode
fi

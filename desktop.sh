# desktop.sh — GUI environment (i3, ly, fonts, etc.)
#!/usr/bin/env bash
set -euxo pipefail

sudo apt-get update -qq
sudo apt-get install -yq \
  i3 i3status i3lock dmenu feh rofi xbacklight \
  picom x11-xserver-utils pulseaudio-utils ly
echo "[✓] i3 and ly configured. Restart your session to see the changes."

# Symlink i3 and ly configs
stow --dir=setup --target="$HOME" i3
stow --dir=setup --target="$HOME" ly

# Install Nerd Fonts (via script)
bash scripts/install-fonts.sh
echo "[✓] Fonts installed. Restart your terminal to see the changes."

echo "[✓] Desktop environment ready. Log out and select ‘ly’ on login screen."


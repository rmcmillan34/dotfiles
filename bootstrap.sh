# Ensure stow is installed
if ! command -v stow &>/dev/null; then
  echo "[*] Installing stow..."
  sudo apt install -y stow
fi

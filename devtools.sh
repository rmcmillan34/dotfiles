# devtools.sh — Developer tools setup
#!/usr/bin/env bash
set -euxo pipefail

# Install Neovim
sudo apt-get update -qq
sudo apt-get install -yq neovim

# Install Node.js (needed for Copilot, LSPs)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -yq nodejs

# Install lazygit
LAZYGIT_VERSION=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
  | grep -Po '"tag_name": "\K.*?(?=")')
curl -fsSL -Lo lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar -xzf lazygit.tar.gz lazygit
sudo install -m 755 lazygit /usr/local/bin/lazygit
rm lazygit lazygit.tar.gz

# Install ChatGPT CLI
#sudo npm install -g chatgpt-cli
# Install Copilot CLI


echo "[✓] Developer environment ready."
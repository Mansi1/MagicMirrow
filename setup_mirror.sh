#!/bin/bash

echo "--- Step 1: Boosting RAM (Swap) for the Zero 2 W ---"
sudo apt install dphys-swapfile -y
sudo dphys-swapfile swapoff
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

echo "--- Step 2: Updating System ---"
sudo apt update && sudo apt upgrade -y

echo "--- Step 3: Install nodejs and npm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

echo "--- Step 4: clone project MagicMirror ---"
git clone https://github.com/MagicMirrorOrg/MagicMirror.git ~/MagicMirror

# Using the community installer for Node/Electron management
echo "--- Step 4: Configuring Server-Only Mode ---"
cd ~/MagicMirror/config
cp config.js.sample config.js
# Change address to 0.0.0.0 and clear whitelist
sed -i 's/address: "localhost",/address: "0.0.0.0",/' config.js
sed -i 's/ipWhitelist: \[[^]]*\]/ipWhitelist: []/' config.js

echo "--- FINISHED ---"
echo "To start your mirror in server mode, run: cd ~/MagicMirror && node serveronly"
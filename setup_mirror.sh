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

echo "--- Step 5: install x server for graphix"
sudo apt install --no-install-recommends xserver-xorg xinit x11-xserver-utils chromium -y
#!/bin/bash

# Update the system and install packages
sudo apt update
sudo apt full-upgrade -y
sudo apt install gnome-shell-extension-ubuntu-tiling-assistant gnome-tweaks mangohud gamemode flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install bottles flatseal net.davidotek.pupgui2 com.mattjakeman.ExtensionManager -y
sudo snap install discord

# Download and install AppImageLauncher
cd /tmp/
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install ./appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb -y

# Install Steam
wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
sudo apt install ./steam.deb -y

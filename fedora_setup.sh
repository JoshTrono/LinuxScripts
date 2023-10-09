#!/bin/bash

# Update the system and install packages
sudo dnf upgrade -y
sudo dnf install gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock gnome-shell-extension-dash-to-panel gnome-shell-extension-user-theme gnome-tweaks snapd steam mangohud gamemode -y
flatpak install bottles flatseal net.davidotek.pupgui2 com.mattjakeman.ExtensionManager -y

# Configure Snap and install Snap applications
sudo ln -s /var/lib/snapd/snap /snap
sudo systemctl enable --now snapd
sudo snap install snap-store
sudo snap install discord

# Download and install AppImageLauncher
cd /tmp/
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
sudo dnf install ./appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm -y

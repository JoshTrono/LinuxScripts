# LinuxScripts
### Ubuntu Setup
```
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
```

#### Summary
It's to update and install some requirements like steam flatpak and some other programs. Adds flatpak support and appimagelauncher 2.2.0 for app images. Requires a restart for flatpak.


## Fedora Setup

```
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
```

#### Summary
It also updates and add snap onto fedora which discord works better as a snap and opera browser (if I use it) addes app images as well. Requires a restart for snap to work.
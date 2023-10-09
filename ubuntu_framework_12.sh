#!/bin/bash

# Update the system and upgrade packages
sudo apt update
sudo apt upgrade -y

# Refresh Snap
sudo snap refresh

# Configure sound settings
echo "options snd-hda-intel model=dell-headset-multi" | sudo tee -a /etc/modprobe.d/alsa-base.conf

# Enable the "scale-monitor-framebuffer" experimental feature
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Update GRUB settings
sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash module_blacklist=hid_sensor_hub"/g' /etc/default/grub
sudo update-grub

# Configure WiFi power saving settings
echo "[connection]" | sudo tee /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
echo "wifi.powersave = 2" | sudo tee -a /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf

# Disable and remove the power-profiles-daemon
sudo systemctl stop power-profiles-daemon.service
sudo systemctl disable power-profiles-daemon.service
sudo apt remove power-profiles-daemon

# Install and enable TLP (power management tool)
sudo apt install tlp tlp-rdw
sudo systemctl enable tlp
sudo systemctl start tlp
sudo systemctl status tlp

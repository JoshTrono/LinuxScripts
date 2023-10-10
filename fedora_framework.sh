#!/bin/bash

# Framework 12th gen
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
sudo grubby --update-kernel=ALL --args="module_blacklist=hid_sensor_hub"

## Battery

sudo systemctl stop power-profiles-daemon.service

sudo systemctl disable power-profiles-daemon.service

sudo dnf remove power-profiles-daemon

sudo dnf install tlp tlp-rdw

sudo systemctl enable tlp

sudo systemctl start tlp

sudo systemctl status tlp

sudo systemctl mask systemd-rfkill.service

sudo systemctl mask systemd-rfkill.socket

#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use sudo."
    exit 1
fi

# Set your desired values for TLP parameters
TLP_ENABLE=1
TLP_WARN_LEVEL=3
CPU_SCALING_GOVERNOR_ON_AC=performance
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_ENERGY_PERF_POLICY_ON_AC=performance
CPU_ENERGY_PERF_POLICY_ON_BAT=power
CPU_MIN_PERF_ON_AC=0
CPU_MAX_PERF_ON_AC=100
CPU_MIN_PERF_ON_BAT=0
CPU_MAX_PERF_ON_BAT=30
CPU_BOOST_ON_AC=1
CPU_BOOST_ON_BAT=0
CPU_HWP_DYN_BOOST_ON_AC=1
CPU_HWP_DYN_BOOST_ON_BAT=0
PLATFORM_PROFILE_ON_AC=performance
PLATFORM_PROFILE_ON_BAT=low-power
INTEL_GPU_MIN_FREQ_ON_AC=100
INTEL_GPU_MIN_FREQ_ON_BAT=100
INTEL_GPU_MAX_FREQ_ON_AC=1500
INTEL_GPU_MAX_FREQ_ON_BAT=800
INTEL_GPU_BOOST_FREQ_ON_AC=1500
INTEL_GPU_BOOST_FREQ_ON_BAT=1000
WIFI_PWR_ON_BAT=off
PCIE_ASPM_ON_BAT=powersupersave
RUNTIME_PM_DRIVER_DENYLIST=""
# Add more parameters as needed

# Update /etc/tlp.conf with the desired values
sed -i "s/^TLP_ENABLE=.*/TLP_ENABLE=$TLP_ENABLE/" /etc/tlp.conf
sed -i "s/^TLP_WARN_LEVEL=.*/TLP_WARN_LEVEL=$TLP_WARN_LEVEL/" /etc/tlp.conf
sed -i "s/^CPU_SCALING_GOVERNOR_ON_AC=.*/CPU_SCALING_GOVERNOR_ON_AC=$CPU_SCALING_GOVERNOR_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_SCALING_GOVERNOR_ON_BAT=.*/CPU_SCALING_GOVERNOR_ON_BAT=$CPU_SCALING_GOVERNOR_ON_BAT/" /etc/tlp.conf
sed -i "s/^CPU_ENERGY_PERF_POLICY_ON_AC=.*/CPU_ENERGY_PERF_POLICY_ON_AC=$CPU_ENERGY_PERF_POLICY_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_ENERGY_PERF_POLICY_ON_BAT=.*/CPU_ENERGY_PERF_POLICY_ON_BAT=$CPU_ENERGY_PERF_POLICY_ON_BAT/" /etc/tlp.conf
sed -i "s/^CPU_MIN_PERF_ON_AC=.*/CPU_MIN_PERF_ON_AC=$CPU_MIN_PERF_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_MAX_PERF_ON_AC=.*/CPU_MAX_PERF_ON_AC=$CPU_MAX_PERF_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_MIN_PERF_ON_BAT=.*/CPU_MIN_PERF_ON_BAT=$CPU_MIN_PERF_ON_BAT/" /etc/tlp.conf
sed -i "s/^CPU_MAX_PERF_ON_BAT=.*/CPU_MAX_PERF_ON_BAT=$CPU_MAX_PERF_ON_BAT/" /etc/tlp.conf
sed -i "s/^CPU_BOOST_ON_AC=.*/CPU_BOOST_ON_AC=$CPU_BOOST_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_BOOST_ON_BAT=.*/CPU_BOOST_ON_BAT=$CPU_BOOST_ON_BAT/" /etc/tlp.conf
sed -i "s/^CPU_HWP_DYN_BOOST_ON_AC=.*/CPU_HWP_DYN_BOOST_ON_AC=$CPU_HWP_DYN_BOOST_ON_AC/" /etc/tlp.conf
sed -i "s/^CPU_HWP_DYN_BOOST_ON_BAT=.*/CPU_HWP_DYN_BOOST_ON_BAT=$CPU_HWP_DYN_BOOST_ON_BAT/" /etc/tlp.conf
sed -i "s/^PLATFORM_PROFILE_ON_AC=.*/PLATFORM_PROFILE_ON_AC=$PLATFORM_PROFILE_ON_AC/" /etc/tlp.conf
sed -i "s/^PLATFORM_PROFILE_ON_BAT=.*/PLATFORM_PROFILE_ON_BAT=$PLATFORM_PROFILE_ON_BAT/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_MIN_FREQ_ON_AC=.*/INTEL_GPU_MIN_FREQ_ON_AC=$INTEL_GPU_MIN_FREQ_ON_AC/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_MIN_FREQ_ON_BAT=.*/INTEL_GPU_MIN_FREQ_ON_BAT=$INTEL_GPU_MIN_FREQ_ON_BAT/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_MAX_FREQ_ON_AC=.*/INTEL_GPU_MAX_FREQ_ON_AC=$INTEL_GPU_MAX_FREQ_ON_AC/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_MAX_FREQ_ON_BAT=.*/INTEL_GPU_MAX_FREQ_ON_BAT=$INTEL_GPU_MAX_FREQ_ON_BAT/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_BOOST_FREQ_ON_AC=.*/INTEL_GPU_BOOST_FREQ_ON_AC=$INTEL_GPU_BOOST_FREQ_ON_AC/" /etc/tlp.conf
sed -i "s/^INTEL_GPU_BOOST_FREQ_ON_BAT=.*/INTEL_GPU_BOOST_FREQ_ON_BAT=$INTEL_GPU_BOOST_FREQ_ON_BAT/" /etc/tlp.conf
sed -i "s/^WIFI_PWR_ON_BAT=.*/WIFI_PWR_ON_BAT=$WIFI_PWR_ON_BAT/" /etc/tlp.conf
sed -i "s/^PCIE_ASPM_ON_BAT=.*/PCIE_ASPM_ON_BAT=$PCIE_ASPM_ON_BAT/" /etc/tlp.conf
sed -i "s/^RUNTIME_PM_DRIVER_DENYLIST=.*/RUNTIME_PM_DRIVER_DENYLIST=\"$RUNTIME_PM_DRIVER_DENYLIST\"/" /etc/tlp.conf
# Add more sed commands for additional parameters

# Restart TLP to apply the changes
systemctl restart tlp

echo "TLP configuration updated successfully."

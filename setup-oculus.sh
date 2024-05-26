sudo pacman -Syu
sudo pacman -S corectrl unzip tar android-tools --needed --noconfirm
paru -S sidequest-bin --needed --noconfirm
sudo mkdir -p /etc/udev/rules.d
if grep -q "SUBSYSTEM" /etc/udev/rules.d/50-oculus.rules; then
  echo "Rules already applied"
else
  echo "SUBSYSTEM="usb", ATTR{idVendor}=="2833", ATTR{idProduct}=="0186", MODE="0660" group="plugdev", symlink+="ocuquest%n"" | sudo tee -a /etc/udev/rules.d/50-oculus.rules
fi

# Start ALVR Setup
mkdir ~/ALVR
cd ~/ALVR

# Download ADB Forwarder for ALVR
wget https://github.com/alvr-org/ADBForwarder/releases/download/v1.3.1/ADBForwarder-linux-x64.zip
unzip ADBForwarder-linux-x64.zip
rm ADBForwarder-linux-x64.zip

echo "Now run alvr-install-amd.sh or alvr-install-nvidia.sh (or install from the AUR) and download the apk"

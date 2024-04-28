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

# Download APK
wget https://github.com/alvr-org/ALVR-nightly/releases/download/v21.0.0-dev00%2Bnightly.2024.04.25/alvr_client_android.apk

read -p "$*ALVR standalone[1] or compile alvr-git[2]? [1/2]: " re
case $re in
  [1]*) ;;
  [2]*) paru -S alvr-git --needed ;return 1 2>/dev/null; exit 1;;
esac

# Download ALVR
wget https://github.com/alvr-org/ALVR-nightly/releases/download/v21.0.0-dev00%2Bnightly.2024.04.25/alvr_streamer_linux.tar.gz
tar -xvzf alvr_streamer_linux.tar.gz
rm alvr_streamer_linux.tar.gz


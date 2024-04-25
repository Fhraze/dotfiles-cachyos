_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

sudo pacman -S \
thunar \
thunar-volman \
fd \
zoxide \
wine-ge-custom \
ttf-sazanami \
ttf-baekmuk \
ttf-hannom \
opendoas \
rustup \
--needed --noconfirm

paru -S \
ttf-twemoji-color \
ttf-ancient-fonts \
ttf-ubraille \
wofi-emoji \
--needed --noconfirm

rustup default stable

package="hyprnome"
if [[ $(_isInstalled "${package}") == 1 ]]; then
  echo "$package not installed. Building $package..."
  git clone https://github.com/donovanglover/hyprnome -b 0.2.0
  cd hyprnome
  makepkg -si
  cd ..
  rm -rf hyprnome
fi

if [[ $(_isInstalled "${package}") == 0 ]]; then
  echo "$package installed!"
else
  echo "Failed to install $package :/, you'll have to install it on your own."
fi

read -p "$*Do you want to remove rust? [y/n]: " yn
case $yn in
  [Yy]*) rustup self uninstall ;;
  [Nn]*) ;;
esac

# Setting up SDDM theme
sudo pacman -S cachyos-themes-sddm --needed --noconfirm
cat sddm-config | sudo tee -a /etc/sddm.conf

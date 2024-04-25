paru -S ttf-twemoji-color --needed --noconfirm
sudo pacman -Rd --nodeps noto-fonts-emoji --noconfirm
mkdir -p ~/.config/fonts
cp local.conf ~/.config/fonts/
fc-cache -f -v

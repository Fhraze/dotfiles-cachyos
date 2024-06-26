sudo pacman -Syu
paru -S ttf-twemoji --needed --noconfirm
sudo pacman -Rd --nodeps noto-fonts-emoji --noconfirm
mkdir -p ~/.config/fonts
cp local.conf ~/.config/fonts/
fc-cache -f -v
sudo ln -sf /usr/share/fontconfig/conf.avail/75-twemoji.conf /etc/fonts/conf.d/75-twemoji.conf

sudo pacman -Syu

sudo pacman -S thunar thunar-volman fd zoxide wine-ge-custom ttf-sazanami ttf-baekmuk ttf-hannom opendoas --needed

paru -S ttf-twemoji ttf-ancient-fonts ttf-ubraille wofi-emoji hyprnome --needed

# Setting up SDDM theme
sudo pacman -S cachyos-themes-sddm --needed --noconfirm
if grep -wq "Theme" /etc/sddm.conf; then
  echo "Could not apply SDDM theme!! sddm.conf already has a [Theme] section"
else
  cat sddm-config | sudo tee -a /etc/sddm.conf
fi

#!/bin/bash
PACKAGES="$HOME/packages"

cd
sudo pacman -Syyuu

mkdir ${PACKAGES}
pacman -Q >> ${PACKAGES}/base.txt

##################################
## yay
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -csi
cd
sudo rm -r yay
pacman -Q >> ${PACKAGES}/0.yay.txt

##################################
## 1 nvidia
yay -S nvidia
pacman -Q >> ${PACKAGES}/1.1.nvidia.txt

yay -S nvidia-settings
pacman -Q >> ${PACKAGES}/1.2.nvidia-settings.txt

yay -S nvidia-utils
pacman -Q >> ${PACKAGES}/1.3.nvidia-utils.txt

##################################
## 2 xorg
yay -S xorg-server
pacman -Q >> ${PACKAGES}/2.1.xorg-server.txt

yay -S xorg-xinit
pacman -Q >> ${PACKAGES}/2.2.xorg-xinit.txt

yay -S xorg-xrandr
pacman -Q >> ${PACKAGES}/2.3.xorg-xrandr.txt
sudo cp $HOME/arch/programs/xorg.conf /etc/X11

##################################
## 3 i3
yay -S i3-gaps
pacman -Q >> ${PACKAGES}/3.1.i3-gaps.txt

yay -S i3blocks
pacman -Q >> ${PACKAGES}/3.2.i3blocks.txt

yay -S i3lock-color
pacman -Q >> ${PACKAGES}/3.3.i3lock-color.txt

yay -S i3status
pacman -Q >> ${PACKAGES}/3.4.i3status.txt
echo exec i3 >> ~/.xinitrc
cp -R $HOME/arch/programs/.config $HOME
##################################
## 4 nitrogen picom rofi
yay -S nitrogen
pacman -Q >> ${PACKAGES}/4.1.nitrogen.txt

yay -S picom
pacman -Q >> ${PACKAGES}/4.2.picom.txt
mkdir -p ~/.config/picom && cp /etc/xdg/picom.conf.example ~/.config/picom/picom.conf

yay -S rofi
pacman -Q >> ${PACKAGES}/4.3.rofi.txt

##################################
## 5 sddm
yay -S sddm
pacman -Q >> ${PACKAGES}/5.1.sddm.txt
sudo systemctl enable sddm.service

yay -S gst-libav gst-plugins-good
pacman -Q >> ${PACKAGES}/5.2.gst-libav.txt

yay -S phonon-qt5-gstreamer
pacman -Q >> ${PACKAGES}/5.3.phonon.txt

yay -S qt5-quickcontrols qt5-graphicaleffects qt5-multimedia
pacman -Q >> ${PACKAGES}/5.4.qt5.txt

git clone git@github.com:3ximus/aerial-sddm-theme.git
sudo mv aerial-sddm-theme /usr/share/sddm/themes
sudo sed -i "s/^Current=.*/Current=aerial-sddm-theme/g" /etc/sddm.conf

##################################
## 6 browsers
yay -S google-chrome
pacman -Q >> ${PACKAGES}/6.1.google-chrome.txt

##################################
## 7 fonts
yay -S ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono ttf-hack ttf-ubuntu-font-family
pacman -Q >> ${PACKAGES}/7.1.fonts.txt

##################################
## 8 sounds
yay -S alsa-firmware
pacman -Q >> ${PACKAGES}/8.1.alsa-firmware.txt

yay -S alsa-utils
pacman -Q >> ${PACKAGES}/8.2.alsa-utils.txt

yay -S paprefs
pacman -Q >> ${PACKAGES}/8.3.paprefs.txt

yay -S pavucontrol
pacman -Q >> ${PACKAGES}/8.4.pavucontrol.txt

yay -S pulseaudio
pacman -Q >> ${PACKAGES}/8.5.pulseaudio.txt

yay -S pulseaudio-alsa
pacman -Q >> ${PACKAGES}/8.6.pulseaudio-alsa.txt

##################################
## 9 reflector
yay -S reflector
pacman -Q >> ${PACKAGES}/9.1.reflector.txt

mirrorlist="/etc/pacman.d/mirrorlist"
if find $mirrorlist -mtime +1 | grep -q '.'; then
  echo "Updating $mirrorlist..."
  if ! reflector \
    --protocol https \
    --country "Russia" \
    --latest 32 \
    --sort rate \
    --save $mirrorlist; then
    echo "Unable to update $mirrorlist"
    exit 1
  fi
fi
echo "$mirrorlist is up to date!"

##################################
## 10 pamac-aur
yay -S pamac-aur-git
pacman -Q >> ${PACKAGES}/10.1.pamac-aur-git.txt

##################################
## 12 nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
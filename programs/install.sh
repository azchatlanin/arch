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
## 5 lightdm
yay -S lightdm
pacman -Q >> ${PACKAGES}/5.1.lightdm.txt

yay -S lightdm-gtk-greeter
pacman -Q >> ${PACKAGES}/5.2.lightdm-gtk-greeter.txt

yay -S lightdm-gtk-greeter-settings
pacman -Q >> ${PACKAGES}/5.3.lightdm-gtk-greeter-settings.txt
sudo systemctl enable lightdm.service

##################################
## 6 vivaldi
yay -S vivaldi
pacman -Q >> ${PACKAGES}/6.1.vivaldi.txt

##################################
## 7 fonts
yay -S ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono ttf-hack ttf-ubuntu-font-family
pacman -Q >> ${PACKAGES}/7.1.fonts.txt

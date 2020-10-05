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
## nvidia
yay -S nvidia
pacman -Q >> ${PACKAGES}/1.nvidia.txt

yay -S nvidia-settings
pacman -Q >> ${PACKAGES}/2.nvidia-settings.txt

yay -S nvidia-utils
pacman -Q >> ${PACKAGES}/3.nvidia-utils.txt

##################################
## xorg
yay -S xorg-server
pacman -Q >> ${PACKAGES}/1.xorg-server.txt

yay -S xorg-xinit
pacman -Q >> ${PACKAGES}/2.xorg-xinit.txt

yay -S xorg-xrandr
pacman -Q >> ${PACKAGES}/3.xorg-xrandr.txt

yay -S ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono ttf-hack ttf-ubuntu-font-family
pacman -Q >> ${PACKAGES}/4.fonts.txt

##################################
## i3
yay -S i3-gaps
pacman -Q >> ${PACKAGES}/5.i3-gaps.txt

yay -S i3blocks
pacman -Q >> ${PACKAGES}/8.i3blocks.txt

yay -S i3lock-color
pacman -Q >> ${PACKAGES}/9.i3lock-color.txt

yay -S i3status
pacman -Q >> ${PACKAGES}/6.i3status.txt
echo exec i3 >> ~/.xinitrc

##################################
## nitrogen picom
yay -S nitrogen
pacman -Q >> ${PACKAGES}/7.nitrogen.txt

yay -S picom
pacman -Q >> ${PACKAGES}/8.picom.txt

##################################
## lightdm
yay -S lightdm
pacman -Q >> ${PACKAGES}/9.lightdm.txt

yay -S lightdm-gtk-greeter
pacman -Q >> ${PACKAGES}/10.lightdm-gtk-greeter.txt

yay -S lightdm-gtk-greeter-settings
pacman -Q >> ${PACKAGES}/11.lightdm-gtk-greeter-settings.txt

##################################
## vivaldi
yay -S vivaldi
pacman -Q >> ${PACKAGES}/12.vivaldi.txt

sudo systemctl enable lightdm.service



# i3wn:
# ~/.config/i3/config
# set $mode Mod4
# exec --no-startup-id setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'
# exec --no-startup-id nitrogen --restore; sleep 1; compton -b
# exec --start-up-id xrandr --output DP-4 --primary --mode 1920x1080 --rotate normal --output DP-0 --mode 1920x1080 --rotate normal --left-of DP-4 --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-4
# bindsym $mod+d exec dmenu_run ---> bindsym $mod+d exec --no-startup-id rofi -theme android_notificaton -show run
# exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox'
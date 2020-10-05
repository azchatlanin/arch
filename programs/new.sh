#!/bin/bash
sudo pacman -Syyuu

cd
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -csi
cd
sudo rm -r yay

## start

yay -S xorg-server
pacman -Q >> 1.xorg-server.txt

yay -S xorg-xinit
pacman -Q >> 2.xorg-xinit.txt

yay -S xorg-xrandr
pacman -Q >> 2.xorg-xrandr.txt

yay -S ttf-font-icon ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono ttf-hack ttf-ubuntu-font-family
pacman -Q >> 3.fonts.txt

## i3
yay -S i3-gaps
pacman -Q >> 4.i3-gaps.txt

yay -S i3status
pacman -Q >> 5.i3status.txt
echo exec i3 >> ~/.xinitrc

## nitrogen picom
yay -S nitrogen
pacman -Q >> 6.nitrogen.txt

yay -S picom
pacman -Q >> 7.picom.txt

## lightdm
yay -S lightdm
pacman -Q >> 8.lightdm.txt

yay -S lightdm-gtk-greeter
pacman -Q >> 9.lightdm-gtk-greeter.txt

yay -S lightdm-gtk-greeter-settings
pacman -Q >> 10.lightdm-gtk-greeter-settings.txt

## vivaldi
yay -S vivaldi
pacman -Q >> 11.vivaldi.txt

sudo systemctl enable lightdm.service



# i3wn:
# ~/.config/i3/config
# set $mode Mod4
# exec --no-startup-id setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'
# exec --no-startup-id nitrogen --restore; sleep 1; compton -b
# exec --start-up-id xrandr --output DP-4 --primary --mode 1920x1080 --rotate normal --output DP-0 --mode 1920x1080 --rotate normal --left-of DP-4 --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-4
# bindsym $mod+d exec dmenu_run ---> bindsym $mod+d exec --no-startup-id rofi -theme android_notificaton -show run
# exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox'
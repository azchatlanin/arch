#!/bin/bash
sudo pacman -Syyuu

cd
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -csi
cd
sudo rm -r yay

## start
mkdir packages

yay -S xorg-server
pacman -Q >> packages/1.xorg-server.txt

yay -S xorg-xinit
pacman -Q >> packages/2.xorg-xinit.txt

yay -S xorg-xrandr
pacman -Q >> packages/3.xorg-xrandr.txt

yay -S ttf-font-icon ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono ttf-hack ttf-ubuntu-font-family
pacman -Q >> packages/4.fonts.txt

## i3
yay -S i3-gaps
pacman -Q >> packages/5.i3-gaps.txt

yay -S i3status
pacman -Q >> packages/6.i3status.txt
echo exec i3 >> ~/.xinitrc

## nitrogen picom
yay -S nitrogen
pacman -Q >> packages/7.nitrogen.txt

yay -S picom
pacman -Q >> packages/8.picom.txt

## lightdm
yay -S lightdm
pacman -Q >> packages/9.lightdm.txt

yay -S lightdm-gtk-greeter
pacman -Q >> packages/10.lightdm-gtk-greeter.txt

yay -S lightdm-gtk-greeter-settings
pacman -Q >> packages/11.lightdm-gtk-greeter-settings.txt

## vivaldi
yay -S vivaldi
pacman -Q >> packages/12.vivaldi.txt

sudo systemctl enable lightdm.service



# i3wn:
# ~/.config/i3/config
# set $mode Mod4
# exec --no-startup-id setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'
# exec --no-startup-id nitrogen --restore; sleep 1; compton -b
# exec --start-up-id xrandr --output DP-4 --primary --mode 1920x1080 --rotate normal --output DP-0 --mode 1920x1080 --rotate normal --left-of DP-4 --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-4
# bindsym $mod+d exec dmenu_run ---> bindsym $mod+d exec --no-startup-id rofi -theme android_notificaton -show run
# exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox'
#!/bin/bash

yay -S nvidia
pacman -Q >> 1.nvidia.txt

yay -S nvidia-settings
pacman -Q >> 2.nvidia-settings.txt

yay -S nvidia-utils
pacman -Q >> 3.nvidia-utils.txt

yay -S xorg-xinit
pacman -Q >> 4.xorg-xinit.txt

yay -S ttf-font-icon ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono
pacman -Q >> 5.fonts.txt


yay -S nitrogen
pacman -Q >> 6.nitrogen.txt

yay -S picom
pacman -Q >> 6.picom.txt


yay -S i3-gaps
pacman -Q >> 7.i3-gaps.txt

yay -S i3blocks
pacman -Q >> 8.i3blocks.txt

yay -S i3lock-color
pacman -Q >> 9.i3lock-color.txt

yay -S i3status
pacman -Q >> 10.i3status.txt


yay -S lightdm
pacman -Q >> 11.lightdm.txt

yay -S lightdm-gtk-greeter
pacman -Q >> 12.lightdm-gtk-greeter.txt

yay -S lightdm-gtk-greeter-settings
pacman -Q >> 13.lightdm-gtk-greeter-settings.txt

yay -S vivaldi
pacman -Q >> 14.vivaldi.txt

sudo systemctl enable lightdm.service

excoh exec i3 >> .xinitrc


# i3wn:
# ~/.config/i3/config
# set $mode Mod4
# exec --no-startup-id setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'
# exec --no-startup-id nitrogen --restore; sleep 1; compton -b
# exec --start-up-id xrandr --output DP-4 --primary --mode 1920x1080 --rotate normal --output DP-0 --mode 1920x1080 --rotate normal --left-of DP-4 --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-4
# bindsym $mod+d exec dmenu_run ---> bindsym $mod+d exec --no-startup-id rofi -theme android_notificaton -show run
# exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox'
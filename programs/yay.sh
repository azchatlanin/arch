#!/bin/bash

cd
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -csi
cd
sudo rm -r yay


yay xorg
yay nvidia nvidia-settings nvidia-utils

yay ttf-font-icon ttf-font-awesome ttf-clear-sans ttf-roboto ttf-roboto-mono

yay nitrogen picom
yay i3-gaps picom
yay i3blocks
yay i3lock-color
yay i3status

yay lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings


.xinitrc
  exec i3

sudo systemctl enable lightdm.service



i3wn:
  ~/.config/i3/config
    set $mode Mod4
    exec --no-startup-id setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'
    exec --no-startup-id nitrogen --restore; sleep 1; compton -b
    exec --start-up-id xrandr --output DP-4 --primary --mode 1920x1080 --rotate normal --output DP-0 --mode 1920x1080 --rotate normal --left-of DP-4 --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-4
    bindsym $mod+d exec dmenu_run ---> bindsym $mod+d exec --no-startup-id rofi -theme android_notificaton -show run
    exec --no-startup-id i3-msg 'workspace 1:Web; exec /usr/bin/firefox'
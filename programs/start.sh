#!/bin/sh

i3-msg 'workspace "web"; exec google-chrome-stable'
sleep 5
i3-msg 'workspace "l: 2"; exec alacritty'

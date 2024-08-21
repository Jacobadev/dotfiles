#!/bin/zsh
xrandr --output VGA-0 --primary --rate 60 --mode 1920x1080 --pos 1360x00 --rotate normal --output VGA-1 --off --output HDMI-0 --mode 1360x768 --pos 0x0 --rotate normal --output DVI-D-0 --off --output None-1-1 --off
sleep 1 
bspc wm -r

#!/bin/zsh
xrandr --output VGA-0 --primary --rate 75.02 --mode 1280x1024 --pos 1920x371 --rotate normal --output VGA-1 --off --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-D-0 --off --output None-1-1 --off
sleep 1 
bspc wm -r

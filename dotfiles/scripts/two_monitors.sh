#!/bin/sh
xrandr --output VGA-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output VGA-1 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-D-0 --off && sleep 0.5 && bspc wm -r

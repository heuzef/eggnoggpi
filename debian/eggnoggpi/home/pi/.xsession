#!/bin/bash
xset -dpms
xset s off
xrandr --output HDMI-1 --auto

exec /usr/local/games/eggnoggplus-linux/eggnoggplus

# Hide mouse
unclutter -display :0.0 -idle 1


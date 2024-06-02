#!/bin/bash
xset -dpms
xset s off
xrandr --output HDMI-1 --auto

exec /usr/bin/xterm

# Hide mouse
unclutter -display :0.0 -idle 1


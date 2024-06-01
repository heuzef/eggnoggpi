#!/bin/bash
xset -dpms
xset s off
xrandr --output HDMI --auto

exec /usr/bin/antimicrox

# Hide mouse
unclutter -display :0.0 -idle 1


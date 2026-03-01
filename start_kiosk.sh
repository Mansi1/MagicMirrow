#!/bin/bash
# Disable screen blanking
xset s noblank
xset s off
xset -dpms

# Start the window manager
matchbox-window-manager -use_titlebar no &

# Start Surf (The Lightweight King)
# -K = Kiosk mode, -F = Fullscreen
surf -K -F http://localhost:8080
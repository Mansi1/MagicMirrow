#!/bin/bash
# Disable screen blanking
xset s noblank
xset s off
xset -dpms

# Start the Window Manager
matchbox-window-manager -use_titlebar no &

# Start Chromium in Kiosk Mode
chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:8080
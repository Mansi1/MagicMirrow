#!/bin/bash

# 1. Wait 15 seconds for the MagicMirror server to fully breathe
sleep 15

# 2. Disable screen blanking/sleeping
xset s noblank
xset s off
xset -dpms

# 3. Start the Window Manager (Required for Firefox to go Fullscreen)
matchbox-window-manager -use_titlebar no &

# 4. Start Firefox in Kiosk Mode
# --no-remote prevents "already running" errors
# --kiosk forces it to fill the screen
firefox-esr --kiosk --no-remote http://localhost:8080
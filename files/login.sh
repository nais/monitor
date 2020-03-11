#!/usr/bin/env bash
email="$1"
pw="$2"

if [ -z "$email" ]; then
        echo must provide email as firt argument
        exit 1
fi

if [ -z "$pw" ]; then
        echo must provide password as second argument
        exit 1
fi

systemctl --user stop chromium.service

killall chromium-browser-v7 || pkill chromium-browser-v7
killall chromium-browser || pkill chromium-browser

rm -rf ~/.config/chromium
chromium-browser portal.office.com &
sleep 15
xdotool type $email
xdotool key Return
sleep 10
xdotool type $pw
xdotool key Return
sleep 10
xdotool key Return
sleep 10
xdotool key Ctrl+w

killall chromium-browser-v7 || pkill chromium-browser-v7
killall chromium-browser || pkill chromium-browser

systemctl --user start chromium.service

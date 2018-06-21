#!/usr/bin/env bash
sudo raspi-config nonint do_overscan 1

sudo apt update
sudo apt install -y --no-install-recommends xserver-xorg xinit
sudo apt install -y i3 suckless-tools lxterminal vim chromium-browser xdotool
echo '#!/bin/sh
exec i3' > ~/.xinitrc

mkdir -p ~/.config/i3/ && cp /etc/i3/config ~/.config/i3/config
echo 'exec --no-startup-id xset s 00 && xset s noblank && xset s noexpose && xset dpms 0 0 0' >> ~/.config/i3/config
echo 'exec --no-startup-id ~/chromium.sh' >> ~/.config/i3/config

echo '[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx' >> ~/.profile

echo '[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin pi --noclear %I 38400 linux' | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

sudo reboot

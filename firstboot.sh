#!/bin/bash -e

sed -i 's/#Port 22/Port 80/' /etc/ssh/sshd_config
systemctl enable ssh

echo "ip addr" >> /etc/rc.local
chmod 755 /etc/rc.local

rm /boot/firstboot.sh

reboot

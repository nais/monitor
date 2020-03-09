#!/bin/bash -e
#format the SD card
diskutil eraseDisk MS-DOS NO\ NAME MBRFormat /dev/disk2
#unzip and flash system from this folder(sdcard) to sdcard(noname)
wget -N https://github.com/FooDeas/raspberrypi-ua-netinst/releases/download/v2.4.0/raspberrypi-ua-netinst-v2.4.0.zip
unzip -o raspberrypi-ua-netinst-v2.4.0.zip -d /Volumes/NO\ NAME/
rsync -rv sdcard/ /Volumes/NO\ NAME/
#ask for WiFi credentials
echo -n "enter SSID: "
read SSID
echo -n "enter PSK: "
read -s PSK
#enter wifi credentials in installer-config file
sed -i '' "s/\#wlan_psk=/wlan_psk=${PSK}/g" /Volumes/NO\ NAME/raspberrypi-ua-netinst/config/installer-config.txt
sed -i '' "s/\#wlan_ssid=/wlan_ssid=${SSID}/g" /Volumes/NO\ NAME/raspberrypi-ua-netinst/config/installer-config.txt
#Unmount SD card
diskutil unmount /Volumes/NO\ NAME/

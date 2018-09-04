#!/usr/bin/env bash
export DISPLAY=:0.0

high_limit=740 # Normally around 100, white screen is ~750
low_limit=50

import -window root screen.png
sum=`convert screen.png -resize 1x1 txt:- | grep -o "srgb\(.*\)" | grep -oP "\d+,\d+,\d+" | sed 's/,/+/g' | bc`
if [[ ${sum} -gt ${high_limit} -o ${sum} -lt ${low_limit} ]]; then
	echo "Screen too bright color (sum of rgb channels: ${sum}), something is probablt wrong. Pressing F5."
	xdotool key F5
else
	echo "Everything looks perfect (sum of rgb channels: ${sum})."
fi

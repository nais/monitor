#!/bin/sh
#
# Use tmux-cssh to connect to all hosts
# https://github.com/zinic/tmux-cssh
#

CSSH="cssh"

inventory=`mktemp`
yq r inventory.yaml 'all.hosts.*.ansible_host' | awk '{print "pi@" $2}' > $inventory

$CSSH -f $inventory

rm $inventory

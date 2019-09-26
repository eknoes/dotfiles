#!/bin/bash
swaylock -F -l &
SWAY_PID=$!
grim -s 1 /tmp/lock-fancy.png
convert /tmp/lock-fancy.png -blur 0x8 /tmp/lock-fancy.png
kill $SWAY_PID
swaylock -F -i /tmp/lock-fancy.png -l                                                      

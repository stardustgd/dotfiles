#!/bin/bash

IMG=~/Pictures/screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png 
notification_timeout=3000

# Main function
case $1 in
    area)
    grim -g "$(slurp)" $IMG && wl-copy < $IMG && notify-send "Screenshot" "Selection saved" -i $IMG -t $notification_timeout
    ;;

    screen)
    grim $IMG
    wl-copy < $IMG
    notify-send "Screenshot" "Entire screen" -i $IMG -t $notification_timeout
    ;;
esac

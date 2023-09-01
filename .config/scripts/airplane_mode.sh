#!/bin/bash

# Check if wifi status
STATUS=`nmcli radio all | awk 'FNR == 2 {print $2}'`
notification_timeout=3000
notification_id=9989

if [ $STATUS == "enabled" ]; then 
    notify-send "Airplane Mode" -i ~/.local/share/icons/airplane-off.png -t $notification_timeout -r $notification_id
else
    notify-send "Airplane Mode" -i ~/.local/share/icons/airplane.png -t $notification_timeout -r $notification_id
fi

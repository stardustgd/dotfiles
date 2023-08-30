#!/bin/bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

STATUS=`pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}'`
notification_timeout=3000
notification_id=9990

if [ $STATUS == "yes" ]; then 
    notify-send "Microphone" "Muted" -i ~/.local/share/icons/microphone-off.png -t $notification_timeout -r $notification_id 
else 
    notify-send "Microphone" "Unmuted" -i ~/.local/share/icons/microphone.png -t $notification_timeout -r $notification_id
fi

#!/bin/bash

function get_percent {
    acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)'
}

function get_remaining {
    acpi -b | awk '{print $5}'
}

function get_discharge_icon {
    percent=$(get_percent)

    if [ "$percent" -gt 95 ] ; then
        icon=~/.local/share/icons/battery.png
    elif [ "$percent" -gt 90 ] ; then
        icon=~/.local/share/icons/battery-90.png
    elif [ "$percent" -gt 80 ] ; then
        icon=~/.local/share/icons/battery-80.png
    elif [ "$percent" -gt 70 ] ; then
        icon=~/.local/share/icons/battery-70.png
    elif [ "$percent" -gt 60 ] ; then
        icon=~/.local/share/icons/battery-60.png
    elif [ "$percent" -gt 50 ] ; then
        icon=~/.local/share/icons/battery-50.png
    elif [ "$percent" -gt 40 ] ; then
        icon=~/.local/share/icons/battery-40.png
    elif [ "$percent" -gt 30 ] ; then
        icon=~/.local/share/icons/battery-30.png
    elif [ "$percent" -gt 20 ] ; then
        icon=~/.local/share/icons/battery-20.png
    else
        icon=~/.local/share/icons/battery-10.png
    fi

    echo $icon
}

function show_discharge {
    get_discharge_icon
    time_remaining=$(get_remaining)

    notify-send "Battery" "$time_remaining remaining" -i "$icon" -u low -r 9991 -t 3000
}

function show_charge {
    # get_discharge_icon
    icon=~/.local/share/icons/battery-charging.png
    time_remaining=$(get_remaining)

    notify-send "Battery" "$time_remaining until charged" -i "$icon" -u low -r 9991 -t 3000
}

case $1 in
    discharging)
        show_discharge
    ;;

    charging)
        show_charge
    ;;

    get_icon)
        get_discharge_icon
    ;;
esac

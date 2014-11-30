#!/bin/bash

battery_level = `upower -d | grep percentage | head -1 | grep -o '[0-9]*'`

if [[ "$battery_level" -le 3 ]] 
    then
    notify-send "Battery level is criticaly low, going to suspend."
    sleep 5
    systemctl suspend
fi

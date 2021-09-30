#!/bin/bash
#Toggles between two screens. Assuming only one external screen is connected

monitors=`xrandr | grep -P ' connected' | grep -o '^[^ ]*'`
set -- "$monitors"
#monArr contains an array of the id's of the connected screens
declare -a monArr=($*)

#onMon holds the id of the *first* on screen found
onMon=`xrandr --listmonitors | head -2 | grep -oP "[a-zA-Z]*-[0-9]$"`

#offMon holds the id of the other monitor, which is not on
if [ "$onMon" = "${monArr[0]}" ]

then
    offMon=${monArr[1]}
else
    offMon=${monArr[0]}
fi

#Switches the on screen off and vice versa
xrandr --output $offMon --auto --output $onMon --off

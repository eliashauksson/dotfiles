#!/bin/bash

volume_high="墳"
volume_medium="奔"
volume_low="奄"
volume_off="婢"

volume_str=$(amixer get Master | grep "Mono:" | awk '{print $4}')
volume=${volume_str:1:2}

if [[ $volume_str == "[100%]" ]]
then
    volume=100
fi

volume_mute_str=$(amixer get Master | grep "Mono:" | awk '{print $6}')
volume_mute=${volume_mute_str:1:2}

if [[ $volume_mute == "on" ]]
then
    if [[ $volume > 66 ]]
    then
        icon=$volume_high
    elif [[ $volume > 33 ]]
    then
        icon=$volume_medium
    else
        icon=$volume_low
    fi
else
    icon=$volume_off
    volume=0
fi

printf -v output "$icon $volume%%"

echo $output

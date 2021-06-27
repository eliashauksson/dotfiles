#!/bin/bash

battery_percentage=$(acpi | awk '{printf("%d"), $4}')
battery_icons=(          )

if [[ $battery_percentage > 95 ]]
then
    battery_icon=${battery_icons[0]}
elif [[ $battery_percentage > 85 ]]
then
    battery_icon=${battery_icons[1]}
elif [[ $battery_percentage > 75 ]]
then
    battery_icon=${battery_icons[2]}
elif [[ $battery_percentage > 65 ]]
then
    battery_icon=${battery_icons[3]}
elif [[ $battery_percentage > 55 ]]
then
    battery_icon=${battery_icons[4]}
elif [[ $battery_percentage > 45 ]]
then
    battery_icon=${battery_icons[5]}
elif [[ $battery_percentage > 35 ]]
then
    battery_icon=${battery_icons[6]}
elif [[ $battery_percentage > 25 ]]
then
    battery_icon=${battery_icons[7]}
elif [[ $battery_percentage > 15 ]]
then
    battery_icon=${battery_icons[8]}
elif [[ $battery_percentage > 5 ]]
then
    battery_icon=${battery_icons[9]}
else
    battery_icon=${battery_icons[10]}
fi

printf -v output "$battery_icon $battery_percentage%%"

echo $output

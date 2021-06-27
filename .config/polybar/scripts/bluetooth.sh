#!/bin/bash

bluetooth_on=""
bluetooth_off=""

bluetooth_status=$(hcitool dev | grep hci0)

if [[ $bluetooth_status ]]
then
    icon=$bluetooth_on
    paired_devices=$(bluetoothctl info | grep Name | wc -l)
else
    icon=$bluetooth_off
    paired_devices=""
fi

printf -v output "$icon $paired_devices"

echo $output

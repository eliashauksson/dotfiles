#!/bin/bash

wifi_icon="直"
nowifi_icon="睊"

wifi_status=$(nmcli dev | grep "wifi " | awk '{print $3}')

if [[ $wifi_status == "connected" ]]
then
    icon=$wifi_icon
else
    icon=$nowifi_icon
fi

echo $icon

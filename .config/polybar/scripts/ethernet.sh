#!/bin/bash

ethernet_icon=""
noethernet_icon=""

ethernet_status=$(nmcli dev | grep "ethernet " | awk '{print $3}')

if [[ $ethernet_status == "connected" ]]
then
    icon=$ethernet_icon
else
    icon=$noethernet_icon
fi

echo $icon

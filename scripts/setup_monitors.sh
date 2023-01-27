#!/bin/bash

TOTAL_DESKTOPS=9

mapfile -t monitors < <(xrandr -q | grep " connected" | awk '{print $1;}')
mapfile -t monitors_off < <(xrandr -q | grep "disconnected" | awk '{print $1;}')

n_desktops=$(("$TOTAL_DESKTOPS" / "${#monitors[@]}"))
n_extras=$(("$TOTAL_DESKTOPS" % "${#monitors[@]}"))

for monitor in "${monitors_off[@]}"; do
    xrandr --output "$monitor" --off
done

i=0
n=1
prev_monitor=""
for monitor in "${monitors[@]}"; do
    monitor_addr=$(bspc query -M -m "$monitor")

    if [[ "$i" == 0 ]]; then
	xrandr --output "$monitor" --primary --auto

	this_n_desktops=$(("$n_desktops" + "$n_extras"))
    else
	xrandr --output "$monitor" --auto --right-of "$prev_monitor"

	this_n_desktops="$n_desktops"
    fi

    bspc monitor "$monitor" -d $(seq $n $((n + this_n_desktops - 1)))

    prev_monitor="$monitor"
    n=$((n + this_n_desktops))
    i=$((i + 1))
done

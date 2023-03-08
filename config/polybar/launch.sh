#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do
    sleep 1
done

COLORFILE="$HOME/.colortheme"

if [[ -f "$COLORFILE" ]]; then
    theme=$(cat "$COLORFILE")
else
    theme="nano-light"
fi

if [ "$theme" == "nano-light" ]; then
    cp ~/.config/polybar/themes/nano-light.ini ~/.config/polybar/themes/current-theme.ini
else
    cp ~/.config/polybar/themes/nano-dark.ini ~/.config/polybar/themes/current-theme.ini
fi

if type "xrandr"; then
    for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	MONITOR=$monitor polybar --reload top &
    done
else
    polybar --reload top &
fi

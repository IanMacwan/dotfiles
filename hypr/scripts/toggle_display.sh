#!/usr/bin/env bash

LAPTOP="eDP-1"

EXTERNAL=$(hyprctl -j monitors all | jq -r ".[] | select(.name != \"$LAPTOP\") | .name" | head -n 1)

if [ -z "$EXTERNAL" ] || [ "$EXTERNAL" = "null" ]; then
    hyprctl dispatch dpms on "$LAPTOP"
    notify-send "Display System" "Rescue Mode: Laptop display woken up" -i display
    exit 0
fi

LAPTOP_STATUS=$(hyprctl -j monitors all | jq -r ".[] | select(.name == \"$LAPTOP\") | .dpmsStatus")

if [ "$LAPTOP_STATUS" = "false" ] || [ "$LAPTOP_STATUS" = "0" ]; then
    hyprctl dispatch dpms on "$LAPTOP"
    
    for i in {1..4}; do
        hyprctl dispatch moveworkspacetomonitor "$i" "$LAPTOP"
    done
    
    notify-send "Display System" "Extended desktop layout restored" -i display
else
    ACTIVE_WORKSPACES=$(hyprctl -j workspaces | jq -r ".[].id")
    for ws in $ACTIVE_WORKSPACES; do
        hyprctl dispatch moveworkspacetomonitor "$ws" "$EXTERNAL"
    done

    hyprctl dispatch dpms off "$LAPTOP"
    
    notify-send "Display System" "Workspaces moved. Laptop panel asleep." -i display
fi

#!/usr/bin/env bash

LAPTOP="eDP-1"

move_ws_to_monitor() { # $1 = workspace id, $2 = monitor name
    hyprctl dispatch "hl.dsp.workspace.move({ workspace = $1, monitor = \"$2\" })"
}

set_dpms() { # $1 = enable | disable, $2 = monitor name
    hyprctl dispatch "hl.dsp.dpms({ action = \"$1\", monitor = \"$2\" })"
}

EXTERNAL=$(hyprctl -j monitors all | jq -r ".[] | select(.name != \"$LAPTOP\") | .name" | head -n 1)

if [ -z "$EXTERNAL" ] || [ "$EXTERNAL" = "null" ]; then
    set_dpms enable "$LAPTOP"
    notify-send "Display System" "Rescue Mode: Laptop display woken up" -i display
    exit 0
fi

LAPTOP_STATUS=$(hyprctl -j monitors all | jq -r ".[] | select(.name == \"$LAPTOP\") | .dpmsStatus")

if [ "$LAPTOP_STATUS" = "false" ] || [ "$LAPTOP_STATUS" = "0" ]; then
    set_dpms enable "$LAPTOP"

    for i in {1..4}; do
        move_ws_to_monitor "$i" "$LAPTOP"
    done

    notify-send "Display System" "Extended desktop layout restored" -i display
else
    # id > 0 skips special workspaces (negative ids like -99)
    ACTIVE_WORKSPACES=$(hyprctl -j workspaces | jq -r ".[] | select(.id > 0) | .id")
    for ws in $ACTIVE_WORKSPACES; do
        move_ws_to_monitor "$ws" "$EXTERNAL"
    done

    set_dpms disable "$LAPTOP"

    notify-send "Display System" "Workspaces moved. Laptop panel asleep." -i display
fi

#!/bin/bash

# Check if Spotify is running and responding
status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    playerctl --player=spotify metadata --format '  {{title}} - {{artist}}'
fi

#!/bin/bash


CONFIG="$HOME/.config/hypr/hyprland.conf"
CACHE="$HOME/.cache/hypr-gaps"

if [ ! -f "$CACHE" ]; then
    echo "6" > "$CACHE"
fi

GAP=$(cat "$CACHE")

if [ "$1" = "increase" ]; then
    GAP=$((GAP + 3))
    echo "$GAP" > "$CACHE"
    hyprctl keyword general:gaps_in "$GAP"
    hyprctl keyword general:gaps_out "$((GAP + 2))"
elif [ "$1" = "decrease" ]; then
    [ "$GAP" -gt 2 ] && GAP=$((GAP - 3))
    echo "$GAP" > "$CACHE"
    hyprctl keyword general:gaps_in "$GAP"
    hyprctl keyword general:gaps_out "$((GAP + 2))"
elif [ "$1" = "save" ]; then

    sed -i "s/^\s*gaps_in = .*/    gaps_in = $GAP/" "$CONFIG"
    sed -i "s/^\s*gaps_out = .*/    gaps_out = $((GAP + 2))/" "$CONFIG"
fi

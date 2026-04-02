#!/bin/bash
case "$1" in
    up)   hyprctl hyprsunset gamma +5 ;;
    down) hyprctl hyprsunset gamma -5 ;;
esac

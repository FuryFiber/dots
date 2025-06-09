#!/bin/bash

# Initialize state variable
bar_visible=false
# Monitor cursor position
while true; do
    # Get cursor position using hyprctl
    read Y < <( hyprctl cursorpos -j | sed -n '4p' | cut -d":" -f2)
    if [ "$Y" -le 5 ] && [ "$bar_visible" = false ]; then
        waybar&
        bar_visible=true
    elif [ "$Y" -gt 35 ] && [ "$bar_visible" = true ]; then      
        pkill waybar
        bar_visible=false
    fi
    sleep 0.5
done

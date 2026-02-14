#!/bin/bash
# Battery display with color based on percentage

# Get battery info from pmset (macOS)
battery_info=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Get charging status
charging=$(pmset -g batt | grep -q "AC Power" && echo "charging" || echo "discharging")

# Get icon from tmux-battery plugin
if [ "$charging" = "charging" ]; then
    icon="⚡"
elif [ "$battery_info" -ge 75 ]; then
    icon="󰁹"
elif [ "$battery_info" -ge 50 ]; then
    icon="󰁾"
elif [ "$battery_info" -ge 25 ]; then
    icon="󰁼"
else
    icon="󰁺"
fi

# Set color based on percentage
if [ "$battery_info" -le 15 ]; then
    color="#f38ba8"  # Red
elif [ "$battery_info" -le 30 ]; then
    color="#fab387"  # Orange
else
    color="#a6e3a1"  # Catppuccin green pastel
fi

echo "#[fg=$color]$icon $battery_info%"

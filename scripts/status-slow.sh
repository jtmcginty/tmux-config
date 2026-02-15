#!/bin/bash
# Slow status components - weather, battery, pomodoro

weather=$(~/tmux-config/scripts/weather-safe.sh)
battery=$(~/tmux-config/scripts/battery-color.sh)

echo "#[fg=#89dceb]$weather #[fg=#6e6a86]| $battery"

#!/bin/bash
# Slow status components - weather, battery, pomodoro

weather=$(~/tmux-config/scripts/weather-safe.sh)
battery=$(~/tmux-config/scripts/battery-color.sh)
pomodoro=$(tmux show-option -gqv "@pomodoro_status")

echo "#[fg=#f9e2af]$pomodoro#[fg=#89dceb]$weather #[fg=#6e6a86]| $battery"

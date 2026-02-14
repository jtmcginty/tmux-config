#!/bin/bash
# Responsive status bar - shows full info on wide screens, minimal on narrow

width=$(tmux display-message -p "#{window_width}")

if [ "$width" -ge 120 ]; then
    # Full status bar
    dots=$(~/tmux-config/scripts/session-dots.sh)
    weather=$(~/tmux-config/scripts/weather-safe.sh)
    battery=$(~/tmux-config/scripts/battery-color.sh)
    pomodoro=$(tmux show-option -gqv "@pomodoro_status")
    datetime=$(date +'%b %d %I:%M %p')
    
    echo "#[fg=#f5c2e7]$dots #[fg=#6e6a86]| #[fg=#f9e2af]$pomodoro#[fg=#89dceb]$weather #[fg=#6e6a86]| $battery #[fg=#6e6a86]| #[fg=#cba6f7]$datetime"
else
    # Minimal - just time
    echo "#[fg=#cba6f7]$(date +'%I:%M %p')"
fi

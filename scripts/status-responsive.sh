#!/bin/bash
# Responsive status bar

width=$(tmux display-message -p "#{window_width}")

if [ "$width" -ge 120 ]; then
    # Full status bar
    slow=$(~/tmux-config/scripts/status-slow.sh)
    datetime=$(date +'%b %d %I:%M %p')
    echo "$slow #[fg=#6e6a86]| #[fg=#cba6f7]$datetime"
else
    # Mobile - just time
    datetime=$(date +'%I:%M %p')
    echo "#[fg=#cba6f7]$datetime"
fi

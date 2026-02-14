#!/bin/bash
# Fast status components only - time

width=$(tmux display-message -p "#{window_width}")

if [ "$width" -ge 120 ]; then
    datetime=$(date +'%b %d %I:%M %p')
    echo "#[fg=#cba6f7]$datetime"
else
    echo "#[fg=#cba6f7]$(date +'%I:%M %p')"
fi

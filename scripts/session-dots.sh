#!/bin/bash
# Fast session dots with caching

CACHE="/tmp/tmux-session-dots-$$"
CACHE_TIME=0.5

if [ -f "$CACHE" ] && [ $(echo "$(date +%s.%N) - $(stat -f %m "$CACHE") < $CACHE_TIME" | bc) -eq 1 ]; then
    cat "$CACHE"
else
    current=$(tmux display-message -p '#S')
    tmux list-sessions -F '#{session_name}' 2>/dev/null | while read -r session; do
        if [ "$session" = "$current" ]; then
            echo -n "●"
        else
            echo -n "○"
        fi
    done > "$CACHE"
    cat "$CACHE"
fi

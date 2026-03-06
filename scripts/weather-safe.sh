#!/bin/bash
# Wrapper for weather that suppresses errors and caches results

CACHE_FILE="/tmp/tmux-weather-cache"
CACHE_TTL=900  # 15 minutes

# Return cache if it's fresh
if [ -f "$CACHE_FILE" ]; then
    age=$(( $(date +%s) - $(stat -f %m "$CACHE_FILE") ))
    if [ "$age" -lt "$CACHE_TTL" ]; then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# Fetch with a 5-second timeout
weather_output=$(curl -s --max-time 5 "wttr.in/?format=%c%f+💨%w+💧%h+🌧️%p" 2>/dev/null | sed 's/  */ /g')

if [[ "$weather_output" == *"Sorry"* ]] || [[ "$weather_output" == *"error"* ]] || [[ -z "$weather_output" ]]; then
    [ -f "$CACHE_FILE" ] && cat "$CACHE_FILE"
else
    echo "$weather_output" | tee "$CACHE_FILE"
fi

#!/bin/bash
# Wrapper for weather that suppresses errors

weather_output=$(curl -s "wttr.in/?format=%c%f+💨%w+💧%h+🌧️%p" 2>/dev/null | sed 's/  */ /g')

# If output contains error messages or is empty, show nothing
if [[ "$weather_output" == *"Sorry"* ]] || [[ "$weather_output" == *"error"* ]] || [[ -z "$weather_output" ]]; then
    echo ""
else
    echo "$weather_output"
fi

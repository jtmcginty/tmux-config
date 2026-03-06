#!/bin/bash
# Slow status components - weather, battery

weather=$(~/tmux-config/scripts/weather-safe.sh)
battery=$(~/tmux-config/scripts/battery-color.sh)

sep=" #[fg=#6e6a86]| "
result=""
for part in "${weather:+#[fg=#89dceb]$weather}" "$battery"; do
    [ -z "$part" ] && continue
    [ -n "$result" ] && result+="$sep"
    result+="$part"
done
echo "$result"

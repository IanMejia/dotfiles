#! /bin/bash
DIR="$HOME/.config/polybar/"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q mybar -c "$DIR"/config.ini &

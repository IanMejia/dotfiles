#! /bin/bash
NAME=~/Pictures/Screenshots/$(date +%y-%m-%d-%T)-shot.png

case "$1" in
    --window)
        maim -i $(xdotool getactivewindow) $NAME;;
    --sel)
        maim -s -u $NAME;;
    *)
        maim $NAME;;
esac

notify-send "Shot saved at ~/Pictures"

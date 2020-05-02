#! /bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 3 -yoffset 25 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) i3lock-fancy ;;
                *Logout) bspc quit;;
                *Reboot) reboot;;
                *Shutdown) poweroff;;
            esac

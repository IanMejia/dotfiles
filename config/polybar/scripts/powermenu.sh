#! /bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p 'Power' -theme menu -location 3 -yoffset 25 <<< " Lock| Logout| Reboot| Shutdown|")"
            case "$MENU" in
                *Lock) slock ;;
                *Logout) bspc quit;;
                *Reboot) reboot;;
                *Shutdown) poweroff;;
            esac

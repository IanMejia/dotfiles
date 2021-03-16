#! /bin/bash

#
# battery notification
#

bat_level=$(cat /sys/class/power_supply/BAT0/capacity)
bat_energy=$(cat /sys/class/power_supply/BAT0/energy_now)
bat_status=$(cat /sys/class/power_supply/BAT0/status)

# send notification on low level
if [[ $bat_energy -eq 739000 && $bat_status == "Discharging" ]]; then
    notify-send -u critical "Battery about to run out."
elif [[ $bat_status == "Full" ]]; then
    notify-send -u critical "Battery at full capacity."
fi

level() {
    printf $bat_level
    echo "%"
}

# report to polybar
if [[ $bat_status == "Charging" ]]; then
    printf "%s" "%{F#98971a} %{F-}"
    level
elif [[ $bat_status == "Discharging" ]]; then
    printf "%s" "%{F#83a598} %{F-}"
    level
else
    printf "%s" "%{F#b8bb26}%{F-}"
fi

#!/usr/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

BASEDIR=$(pwd)

if [ "$EUID" != 0 ]; then
    echo "Root access required for the next steps."
    sudo "$0" "$@"
    exit $?
fi

echo "Do you want to install the pacman packages?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "Installing pacman packages..."
            sudo pacman -S $(cat $BASEDIR/pacman-packages)
            break;;
        No ) break;;
        *  ) echo "Please answer yes or no."
    esac
done

echo "Do you want to install the window manager packages?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "Installing pacman packages..."
            sudo pacman -S $(cat $BASEDIR/wm-packages)
            break;;
        No ) break;;
        *  ) echo "Please answer yes or no."
    esac
done

echo "Do you want to copy the system files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            sudo cp -r $BASEDIR/system/xorg.conf.d/* /etc/X11/xorg.conf.d/
            #sudo cp $BASEDIR/system/pacman.conf /etc/
            break;;
        No  ) break;;
        *   ) echo "Please answer yes or no."
    esac
done

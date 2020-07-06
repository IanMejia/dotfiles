#!/usr/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

BASEDIR=$(pwd)

echo "Do you want to install Yay?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "Installing polybar"
            git clone https://aur.archlinux.org/polybar.git $BASEDIR/poly
            cd $BASEDIR/poly
            makepkg -si
            cd $BASEDIR
            rm -rf $BASEDIR/poly
            break;;
        No  ) break;;
        *   ) echo "Please answer yes or no." ;;
    esac
done

echo "Do you want to install Yay?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            git clone https://aur.archlinux.org/yay.git $BASEDIR/yay
            cd $BASEDIR/yay
            makepkg -si
            cd $BASEDIR
            rm -rf $BASEDIR/yay
            break;;
        No  ) break;;
        *   ) echo "Please answer yes or no." ;;
    esac
done

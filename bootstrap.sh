#!/usr/bin/bash
# bootstraps every config file

cd "$(dirname "${BASH_SOURCE[0]}")"

BASEDIR=$(pwd)

#create config and neovim dirs
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    mkdir $HOME/.config/nvim/pack
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
fi

if [ ! -d "$HOME/.local" ]; then
    mkdir $HOME/.local/
fi

if [ ! -d "$HOME/.local/share" ]; then
    mkdir $HOME/.local/share
fi

# ---------------------------
# common
# ---------------------------
# zsh
ln -s $BASEDIR/zsh/zpreztorc $HOME/.zpreztorc
ln -s $BASEDIR/zsh/zprofile $HOME/.zprofile
ln -s $BASEDIR/zsh/zlogin $HOME/.zlogin
ln -s $BASEDIR/zsh/zshrc $HOME/.zshrc

# config files
ln -s $BASEDIR/config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -s $BASEDIR/config/nvim/lua $HOME/.config/nvim/
ln -s $BASEDIR/config/alacritty $HOME/.config/
ln -s $BASEDIR/config/zellij $HOME/.config/
ln -s $BASEDIR/config/kitty $HOME/.config/

# fonts
ln -s $BASEDIR/fonts $HOME/.local/share/

# ---------------------------
# os-related additions
# ---------------------------
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # config files
    ln -s $BASEDIR/config/zathura $HOME/.config/
    ln -s $BASEDIR/config/rofi $HOME/.config
    ln -s $BASEDIR/config/picom $HOME/.config
    ln -s $BASEDIR/config/dunst $HOME/.config

    # x-stuff
    ln -s $BASEDIR/Xresources $HOME/.Xresources
    ln -s $BASEDIR/xinit $HOME/.xinitrc

    # bspwm
    ln -s $BASEDIR/config/bspwm $HOME/.config/
    ln -s $BASEDIR/config/sxhkd $HOME/.config/
    ln -s $BASEDIR/config/polybar $HOME/.config/

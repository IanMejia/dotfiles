#!/usr/bin/bash
# bootstraps every config file

cd "$(dirname "${BASH_SOURCE[0]}")"

BASEDIR=$(pwd)

#create config and neovim dirs
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
fi

# config files
ln -s $BASEDIR/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $BASEDIR/config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $BASEDIR/config/zathura $HOME/.config/
ln -s $BASEDIR/config/kitty $HOME/.config/

# zsh
ln -s $BASEDIR/zsh/zpreztorc $HOME/.zpreztorc
ln -s $BASEDIR/zsh/zprofile $HOME/.zprofile
ln -s $BASEDIR/zsh/p10k.zsh $HOME/.p10k.zsh
ln -s $BASEDIR/zsh/zlogin $HOME/.zlogin
ln -s $BASEDIR/zsh/zshrc $HOME/.zshrc

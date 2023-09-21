#!/bin/bash

cd $HOME/.local/poj/rice

cp $XDG_STATE_HOME/bash/git .bash_git

cp .bashrc $HOME/.bashrc
cp .profile $HOME/.profile

cp -r .config/alsa $XDG_CONFIG_HOME
cp -r .config/i3 $XDG_CONFIG_HOME
cp -r .config/mpd $XDG_CONFIG_HOME
cp -r .config/ncmpcpp $XDG_CONFIG_HOME
cp -r .config/neofetch $XDG_CONFIG_HOME
cp -r .config/nvim $XDG_CONFIG_HOME
cp -r .config/polybar $XDG_CONFIG_HOME
cp -r .config/tmux $XDG_CONFIG_HOME
cp -r .config/x11 $XDG_CONFIG_HOME

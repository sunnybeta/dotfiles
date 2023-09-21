#!/bin/bash

cd $HOME/.local/poj/rice

cp $XDG_STATE_HOME/bash/git .bash_git

cp $HOME/.bashrc .bashrc
cp $HOME/.profile .profile

cp -r $XDG_CONFIG_HOME/alsa .config
cp -r $XDG_CONFIG_HOME/i3 .config
cp -r $XDG_CONFIG_HOME/mpd .config
cp -r $XDG_CONFIG_HOME/ncmpcpp .config
cp -r $XDG_CONFIG_HOME/neofetch .config
cp -r $XDG_CONFIG_HOME/nvim .config
cp -r $XDG_CONFIG_HOME/polybar .config
cp -r $XDG_CONFIG_HOME/tmux .config > /dev/null 2>&1
cp -r $XDG_CONFIG_HOME/x11 .config

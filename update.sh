#!/bin/bash

cp $XDG_STATE_HOME/bash/git .bash_git

cp $HOME/.bashrc .bashrc
cp $HOME/.profile .profile

cp -r $XDG_CONFIG_HOME/alsa .config/alsa
cp -r $XDG_CONFIG_HOME/i3 .config/i3
cp -r $XDG_CONFIG_HOME/mpd .config/mpd
cp -r $XDG_CONFIG_HOME/ncmpcpp .config/ncmpcpp
cp -r $XDG_CONFIG_HOME/neofetch .config/neofetch
cp -r $XDG_CONFIG_HOME/nvim .config/nvim
cp -r $XDG_CONFIG_HOME/polybar .config/polybar
cp -r $XDG_CONFIG_HOME/tmux .config/tmux
cp -r $XDG_CONFIG_HOME/x11 .config/x11

#!/bin/bash

# Remove Defaults
rm $HOME/.bashrc
rm $HOME/.profile
rm $HOME/.bash_profile

# Bashrc
ln -s $HOME/.local/projects/dotfiles/.bashrc  $HOME/.bashrc
ln -s $HOME/.local/projects/dotfiles/.profile $HOME/.profile

# Check additional directories
mkdir -p $HOME/.config
mkdir -p $HOME/.local/share

# Configuration
ln -s $HOME/.local/projects/hypr    $HOME/.config/hypr
ln -s $HOME/.local/projects/mpd     $HOME/.config/mpd
ln -s $HOME/.local/projects/ncmpcpp $HOME/.config/ncmpcpp
ln -s $HOME/.local/projects/rofi    $HOME/.config/rofi
ln -s $HOME/.local/projects/kitty   $HOME/.config/kitty
ln -s $HOME/.local/projects/tmux    $HOME/.config/tmux
ln -s $HOME/.local/projects/git     $HOME/.config/git
ln -s $HOME/.local/projects/nvim    $HOME/.config/nvim

ln -s $HOME/.local/projects/bin    $HOME/.local/bin
ln -s $HOME/.local/projects/fonts  $HOME/.local/share/fonts

echo "Complete!"

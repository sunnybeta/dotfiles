#!/bin/bash

# Install Libraries
sudo pacman -S ncmpcpp mpd mpc mpv vivaldi pipwire wireplumber hyprland hyprlock git python waybar tmux feh ranger zathura-pdf-poppler cmake btop dunst gcc hyprshot htop kitty less jq man-db npm steam gimp rofi-wayland ttf-cascadia-code brightnessctl unzip


# Config
mkdir $HOME/.config
cp -r .config/* $HOME/.config


# hyprpaper
git clone https://github.com/neovim/neovim # clone from aur
cd neovim


# neovim
git clone https://github.com/neovim/neovim
cd neovim
# make

# Python Custom Version
# download
# untar
# cd
# configure
# make
# altinstall


# Fonts
mkdir -p $HOME/.local/share/fonts
cp -r fonts/* $HOME/.local/share/fonts
fc-cache


echo "Install yt-dlp in a global new python environment"

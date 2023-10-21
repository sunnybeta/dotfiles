#                   __ _ _      
#  _ __  _ __ ___  / _(_) | ___ 
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|                           

# If not interactive, don't do anything
[[ $- != *i* ]] && return

# Basic
export BROWSER=firefox
export TERMINAL=urxvt
export WM=i3
export EDITOR=nvim
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000
export HISTSIZE=1000

# XDG Specification

## User
export LOCAL=$HOME/.local
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$LOCAL/state
export XDG_DATA_HOME=$LOCAL/share

## System
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# Derived
export BUN_INSTALL="$XDG_CONFIG_HOME/bun"
export ENV=HOME/.bashrc
export FEHBG_HOME=$XDG_CONFIG_HOME/fehbg
export HISTFILE=$XDG_STATE_HOME/bash/history
export PROJECT_HOME=$LOCAL/poj
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export XAUTHORITY=$XDG_CONFIG_HOME/x11/xauthority
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export npm_config_cache=$XDG_CACHE_HOME/npm
export npm_config_userconfig=$XDG_CONFIG_HOME/npm/config


# Path
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:$LOCAL/bin
PATH=$PATH:/usr/local/go/bin
export PATH

# Git
git config --global color.ui true
git config --global format.pretty oneline

# Load Bashrc
[[ $0 == -* ]] && . $HOME/.bashrc

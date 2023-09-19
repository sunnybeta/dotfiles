#                   __ _ _      
#  _ __  _ __ ___  / _(_) | ___ 
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|                           

# if not interactive, dont do anything
[[ $- != *i* ]] && return

# export
export BROWSER=firefox
export TERMINAL=urxvt
export WM=i3
export EDITOR=nvim
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000
export HISTSIZE=1000
export LOCAL=$HOME/.local
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$LOCAL/state
export BUN_INSTALL="$XDG_CONFIG_HOME/bun"
export ENV=$XDG_STATE_HOME/bash/bashrc
export FEHBG_HOME=$XDG_CONFIG_HOME/fehbg
export HISTFILE=$XDG_STATE_HOME/bash/history
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background
export PROJECT_HOME=$LOCAL/poj
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export XAUTHORITY=$XDG_CONFIG_HOME/x11/xauthority

# path
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:$LOCAL/bin
export PATH

# git
git config --global color.ui true
git config --global format.pretty oneline

[[ $0 == -* ]] && . .bashrc

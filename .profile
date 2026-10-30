# BASIC
export BROWSER=firefox
export TERMINAL=kitty
export TERM=tmux-256color
export WM=hyprland
export EDITOR=nvim
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000
export HISTSIZE=1000
export CHROME_EXECUTABLE=$BROWSER
export MOZ_ENABLE_WAYLAND = 1

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
export FEHBG_HOME=$XDG_CONFIG_HOME/fehbg
export HISTFILE=$XDG_STATE_HOME/bash/history
export PROJECT_HOME=$LOCAL/poj
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export npm_config_cache=$XDG_CACHE_HOME/npm
export npm_config_userconfig=$XDG_CONFIG_HOME/npm/config
export MPDCONF=$XDG_CONFIG_HOME/mpd/mpd.conf
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export ANDROID_HOME=$LOCAL/opt/Android/Sdk
export FLUTTER_HOME=$LOCAL/opt/Flutter
export ANDROID_SDK_ROOT=$LOCAL/opt/Android/Sdk
export WATERFOX_HOME=$LOCAL/opt/Waterfox
export OLLAMA_MODELS=$XDG_DATA_HOME/ollama/models
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export JUPYTER_DATA_DIR=$XDG_DATA_HOME/jupyter
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export RUSTUP_HOME=$XDG_CONFIG_HOME/rustup
export GOPATH=$XDG_DATA_HOME/go
export NPM_CACHE_HOME=$XDG_CACHE_HOME/npm
export GHCUP_HOME=$HOME/.ghcup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATH
PATH=$PATH:$CARGO_HOME/bin
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:$LOCAL/bin
PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
PATH=$PATH:$FLUTTER_HOME/bin
PATH=$PATH:$WATERFOX_HOME/
PATH=$PATH:$GOPATH/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$HOME/.config/opencode/bin

export PATH

[ -f ~/.bashrc ] && . ~/.bashrc

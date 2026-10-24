#!/bin/sh

# Basic
export BROWSER=firefox
export TERMINAL=kitty
export TERM=tmux-256color
export WM=hyprland
export EDITOR=nvim
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000
export HISTSIZE=1000
export CHROME_EXECUTABLE=$BROWSER

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
# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
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
export GHCUP_HOME=$HOME/.ghcup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path
PATH=$PATH:$CARGO_HOME/bin
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:$LOCAL/bin
PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
PATH=$PATH:$FLUTTER_HOME/bin
PATH=$PATH:$WATERFOX_HOME/
PATH=$PATH:$GOPATH/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$HOME/.opencode/bin
export PATH

# Prompt
setopt PROMPT_SUBST
# autoload -Uz vcs_info
# Git
NEWLINE=$'\n'
PROMPT='%F{green} %n %F{red}%~ %F{magenta}$(parse_git_branch)%f%k${NEWLINE} %F{yellow}λ %f%k'

# History Cache
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Vim Mode
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/beta/.config/zsh/.zshrc'

# End of lines added by compinstall
autoload -Uz compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots)
compinit

unsetopt autocd nomatch
unsetopt LIST_BEEP

# alias
alias pycc='rm -r __pycache__ */__pycache__ */*/__pycache__ >> /dev/null 2>&1'
alias air='$(go env GOPATH)/bin/air'
alias ls='ls --color=auto --group-directories-first'
# alias byebye='mpv $XDG_CONFIG_HOME/x11/shutdown.mp3 > /dev/null && sudo shutdown now' # add to hyprland configuration
alias mount='sudo mount'
alias umount='sudo umount'
alias dnf='sudo dnf'
# alias mpstrt='pactl load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1' # ubuntu
alias graph='git log --all --oneline --decorate --graph'
alias dox='cd $LOCAL/dox'
alias pix='cd $LOCAL/pix'
alias mix='cd $LOCAL/mix'
alias vid='cd $LOCAL/vid'
alias poj='cd $LOCAL/poj'
alias home='cd $LOCAL && ls'
alias greatest='touch $LOCAL/dox/todo && nvim $LOCAL/dox/todo'
alias todo='nvim todo'
alias goals='touch $LOCAL/dox/goals && nvim $LOCAL/dox/goals'
alias dot='cd $LOCAL/projects/dotfiles'
alias vfg='nvim $XDG_CONFIG_HOME/nvim/init.lua'
alias hypr='nvim $XDG_CONFIG_HOME/hypr/hyprland.conf'
alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'
alias neofetch='fastfetch'
alias uv='~/.local/share/python/bin/uv'

grepp() {
	grep -ri $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv' --exclude-dir='.ruff_cache/' --exclude-dir='node_modules' --exclude-dir='.pytest_cache/' --exclude-dir='dist/'
}

# recursive file grepper
grepl() {
	grep -ril $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv' --exclude-dir='.ruff_cache/' --exclude-dir='node_modules' --exclude-dir='.pytest_cache/' --exclude-dir='dist/'
}

# download music
ytdl() {
	$XDG_CONFIG_HOME/venv/bin/yt-dlp -x --audio-format=mp3 --audio-quality=0 $1
}

# SLOC
clocc() {
	cloc . --exclude-dir='__pycache__,.venv,.pytest_cache,.ruff_cache,node_modules,.next'
}

# password generator
passgen() {
	LEN=$1
	if [ -z $LEN ]; then
		LEN=15
	fi
	< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()' | head -c $LEN; echo
}
clear


# git branch
parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "(${BRANCH}${STAT})"
	else
		echo ""
	fi
}

# git status
parse_git_dirty() {
	gs=$(git status 2>&1 | tee)
	dirty=`echo -n "${gs}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${gs}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${gs}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${gs}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${gs}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${gs}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits="± ${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="󰠠 ${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits=" ${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="≡ ${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits=" ${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits=" ${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# bun completions
[ -s "/home/beta/.config/bun/_bun" ] && source "/home/beta/.config/bun/_bun"

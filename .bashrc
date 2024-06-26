#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 

# if not interactive, dont do anything
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
export ENV=$HOME/.bashrc
export FEHBG_HOME=$XDG_CONFIG_HOME/fehbg
export HISTFILE=$XDG_STATE_HOME/bash/history
export PROJECT_HOME=$LOCAL/poj
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export XAUTHORITY=$XDG_CONFIG_HOME/x11/xauthority
export XINITRC=$XDG_CONFIG_HOME/x11/xinitrc
export npm_config_cache=$XDG_CACHE_HOME/npm
export npm_config_userconfig=$XDG_CONFIG_HOME/npm/config
export MPDCONF=$XDG_CONFIG_HOME/mpd/mpd.conf
export JAVA_HOME=/usr
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export RUSTUP_HOME=$XDG_CONFIG_HOME/rustup
# export GHCUP_HOME=$HOME/.ghcup
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Rust
source $CARGO_HOME/env

# Haskell
# source $GHCUP_HOME/env

# Path
PATH=$PATH:$CARGO_HOME/bin
PATH=$PATH:$BUN_INSTALL/bin
PATH=$PATH:$LOCAL/bin
PATH=$PATH:/usr/local/go/bin
export PATH

# Git
git config --global color.ui true
git config --global format.pretty oneline

# vim
set -o vi

# alias
alias pycc='rm -r __pycache__ */__pycache__ */*/__pycache__ >> /dev/null 2>&1'
alias ls='ls --color=auto --group-directories-first'
alias byebye='mpv $XDG_CONFIG_HOME/x11/shutdown.mp3 > /dev/null && sudo shutdown now'
alias mount='sudo mount'
alias umount='sudo umount'
alias pacman='sudo pacman'
alias mpstrt='pactl load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1'
alias make='clear && make'
alias graph='git log --all --oneline --decorate --graph'
alias dox='cd $LOCAL/dox'
alias pix='cd $LOCAL/pix'
alias mix='cd $LOCAL/mix'
alias vid='cd $LOCAL/vid'
alias wrk='cd $LOCAL/wrk'
alias poj='cd $LOCAL/poj'
alias home='cd $LOCAL && ls'
alias todo='touch $LOCAL/dox/todo.md && nvim $LOCAL/dox/todo.md'
alias vfg='nvim $XDG_CONFIG_HOME/nvim/init.lua'
alias reso='nvim $XDG_CONFIG_HOME/x11/xresources'
alias i3fg='nvim $XDG_CONFIG_HOME/i3/config'
alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'
alias startx='startx > /dev/null 2>&1'

# git branch
function parse_git_branch() {
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
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
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

# prompt
export PS1="\[\e[1;30m\][\[\e[1;32m\]\W\[\e[1;30m\]]\[\e[1;35m\]\`parse_git_branch\`\[\e[00m\] "

# autocomplete
complete -cf sudo
complete -cf man

# recursive grepper
grepp() {
	grep -r $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv' --exclude-dir='.ruff_cache/'
}

# recursive file grepper
grepl() {
	grep -rl $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv' --exclude-dir='.ruff_cache/'
}

# download music
ytdl() {
	$XDG_CONFIG_HOME/venv/bin/yt-dlp -x --audio-format=mp3 --audio-quality=0 $1
}

# SLOC
clocc() {
	cloc . --exclude-dir='__pycache__,.venv,.pytest_cache,.ruff_cache'
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

#!/bin/sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt 
shopt -s promptvars
CLR_GREEN="\[\e[32m\]"
CLR_RED="\[\e[31m\]"
CLR_MAGENTA="\[\e[35m\]"
CLR_YELLOW="\[\e[33m\]"
CLR_RESET="\[\e[0m\]"
PS1="${CLR_GREEN} \u ${CLR_RED}\w ${CLR_MAGENTA}\$(parse_git_branch)${CLR_RESET}\n ${CLR_YELLOW}λ ${CLR_RESET}"

# vim
set -o vi

# alias
alias pycc='rm -r __pycache__ */__pycache__ */*/__pycache__ >> /dev/null 2>&1'
alias air='$(go env GOPATH)/bin/air'
alias ls='ls --color=auto --group-directories-first'
alias mount='sudo mount'
alias umount='sudo umount'
alias dnf='sudo dnf'
alias pacman='sudo pacman'
alias graph='git log --all --oneline --decorate --graph'
alias home='cd $LOCAL && ls'
alias todo='touch $LOCAL/Documents/todo && nvim $LOCAL/Documents/todo'
alias dot='cd $HOME/.dots'
alias vfg='nvim $XDG_CONFIG_HOME/nvim/init.lua'
alias hypr='nvim $XDG_CONFIG_HOME/hypr/hyprland.lua'
alias wget='wget --hsts-file $XDG_CONFIG_HOME/wget/hsts'
alias uv='~/.local/share/python/bin/uv'
# alias byebye='mpv $XDG_CONFIG_HOME/x11/shutdown.mp3 > /dev/null && sudo shutdown now' # add to hyprland configuration
# alias mpstrt='pactl load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1' # ubuntu

# grepper functions
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

# rust / cargo
source "$CARGO_HOME/env"


clear

#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 

# source
source ~/.bash_git

# if not interactive, dont do anything
[[ $- != *i* ]] && return

# vim
set -o vi

# path
PATH=$PATH:$HOME/.config/cargo/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/opt/mssql-tools/bin
export PATH

# export
export EDITOR=nvim
export TERM=xterm
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
export LOCAL=$HOME/.local
export WORK_HOME=$LOCAL/wrk/lolly
export PROJECT_HOME=$LOCAL/poj
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background

# propmt
export PS1="\[\e[1;30m\][\[\e[1;33m\]\W\[\e[1;30m\]]\[\e[1;32m\]\`parse_git_branch\` \[\e[00m\]"

# alias
alias ppsmii='PYTHONPATH=$WORK_HOME/FiledMessenger && cd $WORK_HOME/FiledMessenger && source ../.venv/bin/activate'
alias pycc='rm -r __pycache__ */__pycache__ */*/__pycache__ >> /dev/null 2>&1'
alias ls='ls --color=auto'
alias byebye='shutdown now'
alias mpstrt='pactl $(tail -n 1 /etc/pulse/default.pa)'
alias make='clear && make'
alias graph='git log --all --oneline --decorate --graph'
alias dox='cd $LOCAL/dox'
alias pix='cd $LOCAL/pix'
alias mix='cd $LOCAL/mix'
alias vid='cd $LOCAL/vid'
alias wrk='cd $LOCAL/wrk'
alias poj='cd $LOCAL/poj'
alias home='cd $LOCAL && ls'

# autocomplete
complete -cf sudo
complete -cf man

# git
git config --global color.ui true
git config --global format.pretty oneline

# recursive grepper
grepp() {
	grep -r $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv'
}

# recursive file grepper
grepl() {
	grep -rl $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv'
}

# download music
ytdl() {
	$HOME/.config/pyglob/bin/yt-dlp -x --audio-format=mp3 --audio-quality=0 $1
}

# SLOC
clocc() {
	cloc . --exclude-dir='__pycache__,.venv'
}

# password generator
passgen() {
	LEN=$1
	if [ -z $LEN ]; then
		LEN=15
	fi
	< /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()' | head -c $LEN; echo
}

# opts
source "$HOME/.config/cargo/env"

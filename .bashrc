#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                 

# if not interactive, dont do anything
[[ $- != *i* ]] && return

# vim
set -o vi

# alias
alias pycc='rm -r __pycache__ */__pycache__ */*/__pycache__ >> /dev/null 2>&1'
alias ls='ls --color=auto --group-directories-first'
alias byebye='sudo shutdown -h now'
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
alias vim='nvim'

# source bash_git
. $XDG_STATE_HOME/bash/git

# prompt
export PS1="\[\e[1;30m\][\[\e[1;33m\]\W\[\e[1;30m\]]\[\e[1;32m\]\`parse_git_branch\`\[\e[00m\] "

# autocomplete
complete -cf sudo
complete -cf man

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
	$XDG_CONFIG_HOME/pyglob/bin/yt-dlp -x --audio-format=mp3 --audio-quality=0 $1
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

#  _               _                           __ _ _      
# | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___ 
# | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
# |_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                      |_____|_|                           

# vim
set -o vi

# path
export PATH=$PATH:$HOME/.config/cargo/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/mssql-tools/bin

# python
export PYTHONPATH=""

# bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background
alias ls='ls --color=auto'
alias byebye='shutdown now'

# music
alias mpstrt='pactl $(tail -n 1 /etc/pulse/default.pa)'
function ytdl() {
	$HOME/.config/pyglob/bin/yt-dlp -x --audio-format=mp3 --audio-quality=0 $1
}

# rust
source "$HOME/.config/cargo/env"

# c
alias make='clear && make'

# git
git config --global color.ui true
git config --global format.pretty oneline
alias graph='git log --all --oneline --decorate --graph'

# helpers
function grepp() {
	grep -r $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv'
}

function grepl() {
	grep -rl $1 * --exclude-dir='env' --exclude-dir='__pycache__/' --exclude-dir='.venv'
}

function clocc() {
	cloc . --exclude-dir='__pycache__,.venv'
}


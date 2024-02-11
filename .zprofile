#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# General
export DEFAULT_USER="jan"

# Adds scripts folder to $PATH
export SCRIPTS="$HOME/scripts"
export PATH="$PATH:$(du "$SCRIPTS" | cut -f2 | paste -sd ':')"

# Default programs
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export FILE="nnn"
export READER="zathura"
export TERMINAL="st"

# Set default directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZPLUGINS="/usr/share/zsh/plugins"
export ABBR_USER_ABBREVIATIONS_FILE="$XDG_CACHE_HOME/zsh-abbr/user-abbreviations"
export HISTFILE=
export LESSHISTFILE="-"
export SFEED_URL_FILE="$XDG_DATA_HOME/sfeed/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Other programs
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads
export MOZ_ENABLE_WAYLAND=1

# Enable colors in less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Configure bemenu
export BEMENU_OPTS="
	--ignorecase \
	--list '16' \
	--prompt '' \
	--wrap \
	--fixed-height \
	--center \
	--border '2' \
	--bdr '#a89984' \
	--line-height '26' \
	--ch '18' \
	--cw '2' \
	--width-factor '0.4' \
	--fn 'Inter 14' \
	--fb '#1d2021' \
	--ff '#ebdbb2' \
	--nb '#1d2021' \
	--nf '#ebdbb2' \
	--hb '#a89984' \
	--hf '#1d2021' \
	--ab '#1d2021' \
	--af '#ebdbb2'
"

# Configure nnn
export NNN_PLUG='d:diffs;e:gpge;g:gpgd;i:imgthumb;j:autojump;n:bulknew;p:preview-tabbed;q:preview-tui;v:imgview'
export NNN_BMS='h:~;r:~/repositories;s:~/scripts;c:~/.config;l:~.local'
export NNN_COLORS="3621"			# Use a different color for each context
export NNN_FCOLORS='030304020000060101050505'	# Set file-type specific colors
export NNN_SSHFS="sshfs -o follow_symlinks"	# Make sshfs follow symlinks on the remote
export NNN_OPTS="e"				# Open text files using $VISUAL/$EDITOR
export NNN_FIFO='/tmp/nnn.fifo'			# Required for preview-tui/preview-tabbed

startw() {
	ssh-agent dwl -s "
		swaybg -i ~/.config/wallpaper.jpg &
		somebar
	"
}

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && [ ! $XDG_SESSION_TYPE = "wayland" ] && startw || echo > /dev/null

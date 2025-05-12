# ~/.bashrc: executed by bash(1) for non-login shells.

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

################################################################################

# source shell-agnostic environment variables, aliases, and functions
: "${XDG_CONFIG_HOME:=$HOME/.config}"
source "$XDG_CONFIG_HOME/env/system.sh"
source "$XDG_CONFIG_HOME/env/vars.sh"
source "$XDG_CONFIG_HOME/env/aliases.sh"
source "$XDG_CONFIG_HOME/env/functions.sh"

################################################################################

# base16 shell theme
# Taken from https://github.com/chriskempson/base16-shell/tree/master.
# Requires git repo to be cloned to ~/.config.
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
    source "$BASE16_SHELL/profile_helper.sh"
fi
# for reasons I don't understand this cannot be in the if-block above
if [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
    base16_custom
fi

# completion
# Likely already sourced by the system config in /etc/ .
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# history
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=2500
HISTFILESIZE=2500

# prompt: user@host:cwd $
case "$TERM" in
	# if colour terminal, get colourful
	linux|xterm*|rxvt*)
		PS1='\e[1m'
		# if root, print username in red
		if [ $EUID -eq 0 ]; then
			PS1+='\e[31m\u'
		else
			PS1+='\e[35m\u'
		fi
		PS1+='\e[34m@\h\e[36m:\w \$ \e[0m'
		;;
	# else, monochrome
	*)
		PS1='\u@\h:\w \$ '
		;;
esac

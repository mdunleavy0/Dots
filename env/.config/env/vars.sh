#
# Time for a rant about environment variables. There is no portable way to set
# environment variables in GNU/Linux, yet alone POSIX. There is no single file
# that is guaranteed to work on all distros, shells, and display managers.
#
# ~/.config/environment.d/*.conf is systemd exclusive.
#
# ~/.pam-environment looked promising but I found it wasn't read by default on
# Debian. (Either that or I misspelled environment.)
#
# ~/.profile tends to get ignored when more specific alternatives, such as a
# ~/.bashrc, are left on the system. Also GDM ignores ~/.profile for Wayland
# sessions.
#
# I've chosen to use ~/.profile because it's a shell script unlike the other
# options. This makes it more versatile and more portable. I use GDM and Wayland
# on my laptop. My solution is to modify the desktop entries in
# /usr/share/wayland-sessions/ to source ~/.profile before running the
# compositor.
#

# C-header style lock to prevent file being sourced more than once
if [ -z "$ENVVAR_LOCK" ]; then
export ENVVAR_LOCK=1

# path
# Add user bin directory.
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# xdg base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# applications
export BROWSER='firefox'
export EDITOR='emacs -nw'
export PAGER='less'
export VISUAL='emacs'

# firefox
# Enable touchscreen scrolling.
export MOZ_USE_XINPUT2=1

# hunspell
export DICTIONARY='en_GB'

# less
export LESS="-R"
[ -f /usr/bin/src-hilite-lesspipe.sh ] && \
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESSHISTFILE='/dev/null'

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

fi

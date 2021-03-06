# C-header style lock
# (It always bothered me when $PATH had duplicate entries.)
if [ -z "$ENVVAR_LOCK" ]; then
export ENVVAR_LOCK=1

# path
# Add user bin directory.
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# xdg base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

################################################################################

# emacs
if command -v emacs >/dev/null; then
    export EDITOR='emacs -nw'   # command line
    export VISUAL='emacs'       # GUI
fi

# firefox
if command -v firefox >/dev/null; then
    export BROWSER='firefox'
    export MOZ_USE_XINPUT2=1    # enable touchscreen scrolling
fi

# hunspell
export DICTIONARY='en_GB'

# less
if command -v less >/dev/null; then
    export PAGER='less'
    export LESS="-iR"
    [ -f /usr/bin/src-hilite-lesspipe.sh ] && \
        export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    export LESSHISTFILE='/dev/null'
else
    export PAGER='more'         # posix alternative
fi

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

fi

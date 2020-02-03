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
export LESS="-iR"
[ -f /usr/bin/src-hilite-lesspipe.sh ] && \
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESSHISTFILE='/dev/null'

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

fi

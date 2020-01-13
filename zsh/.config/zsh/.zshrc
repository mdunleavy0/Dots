# auto-pushd
# Push directories to the stack with cd (because I never remember to use pushd).
setopt auto_pushd

# beep
unsetopt beep

# completions
autoload -Uz compinit
compinit

# completions - colour
# Colour file completions.
if type dircolors > /dev/null; then
    eval $(dircolors -b)
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
    zstyle 'completion:*' list-colors ''
fi

# completions - grouping
# Separate completions by group.
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order \
       reserved-words aliases builtins functions commands
zstyle ':completion:*' format '%F{8}Completing %d:%f'

# completions - menu
# Make completion menu navigable with arrow keys.
zstyle ':completion:*' menu select

# environment
# Source shell-agnostic environment variables, aliases, and functions.
: "${XDG_CONFIG_HOME:=$HOME/.config}"
emulate sh -c 'source $XDG_CONFIG_HOME/env/vars.sh'
emulate sh -c 'source $XDG_CONFIG_HOME/env/aliases.sh'
emulate sh -c 'source $XDG_CONFIG_HOME/env/functions.sh'

# global aliases
# Aliases that can occur anywhere in a command, not just the first word.
alias -g ¦='| tee'
alias -g ¦¦='| tee -a'

# globbing
setopt extended_glob    # extra globbing operators
setopt glob_dots        # glob hidden files

# help
autoload -Uz run-help
unalias run-help
alias help=run-help

# history
setopt appendhistory
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=5000
SAVEHIST=5000

# key bindings
bindkey -e                  # emacs mode
source $ZDOTDIR/keys.zsh    # Delete, Home, Insert, etc.

# no-clobber
# Prevent redirection from overwriting files.
# Use >| operator to force overwrite.
setopt no_clobber

# prompt
autoload -Uz promptinit
promptinit
prompt suse

# emacs
# Tramp, aptly naming itself 'dumb', can't cope with zsh's fancy features. Unset
# the major offenders and return early.
if [ $TERM = 'dumb' ]; then
    unsetopt zle
    PS1='$ '
    return
fi

################################################################################

# auto-pushd
# Push directories to the stack with cd (because I never remember to use pushd).
setopt auto_pushd

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

# beep
unsetopt beep

# completions
autoload -Uz compinit
compinit

# completions - analogues
# Apply existing completions to new commands.
compdef fix=-
compdef lc=ls
compdef mkcd=mkdir
compdef sortip=sort

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

# completions - matching
#1 Normal completion
#2 Lower -> upper
#3 Lower <-> upper, hyphen <-> underscore
#4 Separate into sub-completions on punctuation
zstyle ':completion:*' matcher-list \
       '' \
       '+m:{[:lower:]}={[:upper:]}' \
       '+m:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' \
       '+r:|[.,_-]=** r:|=**'

# completions - menu
# Make completion menu navigable with arrow keys.
zstyle ':completion:*' menu select

# environment
# Source shell-agnostic environment variables, aliases, and functions.
: "${XDG_CONFIG_HOME:=$HOME/.config}"
emulate sh -c 'source $XDG_CONFIG_HOME/env/system.sh'
emulate sh -c 'source $XDG_CONFIG_HOME/env/vars.sh'
emulate sh -c 'source $XDG_CONFIG_HOME/env/aliases.sh'
emulate sh -c 'source $XDG_CONFIG_HOME/env/functions.sh'

# global aliases
# Aliases that can occur anywhere in a command, not just the first word.
alias -g ¦='| xargs'

# globbing
setopt extended_glob    # extra globbing operators
setopt glob_dots        # glob hidden files

# help
autoload -Uz run-help
unalias run-help 2>/dev/null
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
fpath=("$ZDOTDIR/prompts" "$fpath[@]")
autoload -Uz promptinit
promptinit
prompt suseplus

# window title
case $TERM in
    *xterm*|rxvt|alacritty)
        title_precmd() {print -Pn "\e]2;%n@%m:%~\a"}
        title_preexec() {print -Pn "\e]2;${${(Az)2}[1]}\a"}
        add-zsh-hook precmd title_precmd
        add-zsh-hook preexec title_preexec
        ;;
esac

################################################################################

# syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
# Should be configured last.
if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    highlighting="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [ -f "$HOME/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    highlighting="$HOME/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
if [ -f $highlighting ]; then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
    source $highlighting
fi
unset highlighting

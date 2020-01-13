# Set ZDOTDIR for login shells on the virtual console that won't have read
# ~/.profile.
XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

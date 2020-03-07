# base16 shell
# Presuming that this is a TTY, not a terminal emulator, we need to set our own
# colours.
theme="$XDG_DATA_HOME/base16/output/shell/scripts/base16-selected.sh"
[ -f $theme ] && source $theme
unset theme

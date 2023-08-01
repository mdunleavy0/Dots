# Dots
Personal Linux PC dotfiles
Michael Dunleavy

## Stow

This repo is organised for use with [GNU
Stow](https://www.gnu.org/software/stow/). Stow allows dotfiles to be
consolidated into one directory (i.e. this repo) by creating symlinks at their
expected location in the user's home directory.

To setup symlinks for a directory in this repo, such as *emacs/*, run *stow
--no-folding -t ~ emacs*. The *-t ~* option can be omitted if this repo is
stored directly under the home directory (e.g. ~/Dots). Add the *-v* flag for
more verbose output. Add the *-n* flag to perform a dry-run.


## Env

The *env/* directory configures a POSIX shell environment which is used by the
*bash/* and *zsh/* directories. To better adapt the environment to your system,
please copy *env/.config/env/system.sh.template* to *~/.config/env/system.sh*
and fill in its variables.

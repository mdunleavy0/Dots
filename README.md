# Dots
Personal Linux PC dotfiles


## Cloning

**Run *CONFIG.sh* after cloning this repo.** *CONFIG.sh* applies settings via
*git config*. This is necessary since *.git/config* cannot be stored remotely
for security reasons.

To be more specific about what *CONFIG.sh* does, it defines a filter. This
filter removes all text between two patterns. The text in question is a set of
colour definitions automatically defined by
[base16-builder-python](https://github.com/InspectorMustache/base16-builder-python). I
reckon colour themes and wallpapers are too contingent on changing preferences
to belong in this repo.


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

# Dots
Personal Linux PC dotfiles


## Cloning

**Run *CONFIG.sh* after cloning this repo.** *CONFIG.sh* applies settings via
*git config*. This is necessary since *.git/config* cannot be stored remotely
for security reasons.

To be more specific about what *CONFIG.sh* does, it defines a filter. This
filter removes all text between two patterns. The text in question is a set of
colour definitions automatically defined by
[base16-builder-python](https://github.com/InspectorMustache/base16-builder-python).


## Stow

This repo is organised for use with [GNU
Stow](https://www.gnu.org/software/stow/). Stow allows dotfiles to be
consolidated into one directory (i.e. this repo) by creating symlinks at their
expected location in the user's home directory.

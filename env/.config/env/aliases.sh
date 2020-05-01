# dd
case $OS in
    gnu*) alias dd='dd status=progress'
esac

# df
case $OS in
    # -h for human-readable is ubiquitous but non-posix
    gnu*|freebsd|macos) alias df='df -h'
esac

# diff
case $OS in
    gnu*) alias diff='diff --color=auto'
esac

# du
case $OS in
    gnu*|freebsd|macos) alias dush='du -sh'
esac

# editor
# Single quotes mean variable is expanded at invokation; but this behaves
# undesirably with zsh.
[ -n "$EDITOR" ] && alias e="$EDITOR" # terminal text editor
[ -n "$VISUAL" ] && alias v="$VISUAL" # GUI text editor

# emerge
# Only useful as root.
[ "$PACKAGING" = portage ] && alias emerge='emerge -a'

# free
case $OS in
    gnu*|freebsd|macos) alias free='free -h'
esac

# git
# See git-config(1) for info on git aliases.

# grep
alias g='grep'
case $OS in
    gnu*|freebsd|macos)
        alias grep='grep --color=auto'
        alias egrep='egrep --color=auto'
        alias fgrep='fgrep --color=auto'
esac
alias G='Grep'
alias Grep='grep -i'
command -v egrep >/dev/null && alias eGrep='egrep -i'
command -v fgrep >/dev/null && alias fGrep='fgrep -i'

# ls
case $OS in
    gnu*|freebsd) alias ls='ls --color=auto'
esac
alias la='ls -A'                # include hidden files
case $OS in
     # long format
    gnu*|freebsd|macos) alias ll='ls -AFhl';;
    *) alias ll='ls -AFl'
esac
alias l1='ls -1'                # one entry per line
alias l1a='ls -1A'

# man
# Because I have trouble typing 'apropos'.
alias mank='man -k'

# mkdir
case $OS in
    gnu*|freebsd|macos) alias mkdir='mkdir -pv';;
    *) alias mkdir='mkdir -p'
esac

# pager
alias p="$PAGER"

# printenv
command -v printenv >/dev/null &&
    alias printenv='printenv | sort'

# python
command -v python >/dev/null &&
    alias py='python'

# rm
case $OS in
    gnu*|freebsd) alias rm='rm -I' # prompt up to 3 times
esac
alias rr='rm -r'

# rsync
if command -v rsync >/dev/null; then
    alias rsync='rsync -r -hh --info=progress2,stats'
    alias copy='rsync'
    alias move='rsync --remove-source-files'
fi

# sudo
if command -v sudo >/dev/null; then
    alias sudo='sudo '          # allow aliases in sudo commands
    alias sudos='sudo sh -c'    # execute multiple commands
fi

# tee
alias t='tee'
alias tea='tee -a'

# tree
if command -v tree >/dev/null; then
    alias tree='tree -Cl'
    alias trea='tree -a -I .git'
fi

# whatis
command -v whatis >/dev/null &&
    alias wi='whatis'

# xargs
alias xargs='xargs '            # allow aliases in xargs commands
alias x='xargs'

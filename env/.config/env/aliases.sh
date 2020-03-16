# dd
alias dd='dd status=progress'

# df
alias df='df -h'

# diff
alias diff='diff --color=auto'

# du
alias dush='du -sh'

# editor
# Single quotes mean variable is expanded at invokation; but this behaves
# undesirably with zsh.
alias e="$EDITOR"       # terminal text editor
alias v="$VISUAL"       # GUI text editor

# emerge
# Only useful as root.
alias emerge='emerge -a'

# free
alias free='free -h'

# git
# See git-config(1) for info on git aliases.

# grep
alias g='grep'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias G='Grep'
alias Grep='grep -i'
alias eGrep='egrep -i'
alias fGrep='fgrep -i'

# ls
alias ls='ls --color=auto'
alias la='ls -A'            # include hidden files
alias ll='ls -AFhl'         # long format
alias l1='ls -1'            # one entry per line
alias l1a='ls -1A'

# man
# Because I have trouble typing 'apropos'.
alias mank='man -k'

# mkdir
alias mkdir='mkdir -pv'

# pager
alias p="$PAGER"

# printenv
alias printenv='printenv | sort'

# python
alias py='python'

# rm
alias rm='rm -I'
alias rr='rm -r'

# rsync
alias rsync='rsync -r -hh --info=progress2,stats'
alias copy='rsync'
alias move='rsync --remove-source-files'

# sudo
alias sudo='sudo '          # allow aliases in sudo commands
alias sudos='sudo sh -c'    # execute multiple commands

# tee
alias t='tee'
alias tea='tee -a'

# tree
alias tree='tree -Cl'
alias trea='tree -a -I .git'

# whatis
alias wi='whatis'

# xargs
alias x='xargs'

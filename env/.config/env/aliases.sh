# dd
alias dd='dd status=progress'

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
# only useful as root
alias emerge='emerge -a'

# free
alias free='free -h'

# git
# See git-config(1) for info on git aliases.

# grep
alias grep='grep --color=auto';     alias g='grep'
alias egrep='egrep --color=auto';   alias ge='egrep'
alias fgrep='fgrep --color=auto';   alias gf='fgrep'
alias Grep='grep -i';               alias G='Grep'
alias eGrep='egrep -i';             alias Ge='eGrep'
alias fGrep='fgrep -i';             alias Gf='fGrep'

# ls
alias ls='ls --color=auto'
alias la='ls -A'            # include hidden files
alias ll='ls -AFhl'         # long format
alias l1='ls -1'            # one entry per line
alias l1a='ls -1A'

# mkdir
alias mkdir='mkdir -pv'

# nano
alias nano='nano --mouse'

# od
alias xd='od -txz'

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

# tree
alias tree='tree -Cl'
alias trea='tree -a -I .git'

# whatis
alias wi='whatis'

# xargs
alias x='xargs'

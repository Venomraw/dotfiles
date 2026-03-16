#!/bin/bash
# =============================================================================
# ~/.bash_aliases - Custom bash aliases and functions
# =============================================================================
# Sources:
#   - https://github.com/ctrlaltvikas/awesome-bash-alias
#   - https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
#   - https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life
#   - https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
# =============================================================================

# ---------------------------------------------------------------------------
# NAVIGATION
# ---------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'

# ---------------------------------------------------------------------------
# SAFER FILE OPERATIONS - prompt before overwrite/delete
# ---------------------------------------------------------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I --preserve-root'
alias mkdir='mkdir -pv'

# Prevent dangerous chmod/chown on root
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Resume downloads by default
alias wget='wget -c'

# ---------------------------------------------------------------------------
# HISTORY
# ---------------------------------------------------------------------------
alias h='history'
alias hgrep='history | grep'

# ---------------------------------------------------------------------------
# GIT SHORTCUTS
# ---------------------------------------------------------------------------
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gpull='git pull'


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

# ---------------------------------------------------------------------------
# NETWORKING
# ---------------------------------------------------------------------------
alias myip='curl ifconfig.me'
alias ports='sudo netstat -tulanp'
alias ping5='ping -c 5'
alias update='sudo apt update && sudo apt upgrade -y'

# ---------------------------------------------------------------------------
# EXTRACT FUNCTION - from "The Ultimate .bashrc" by zachbrowne
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
# Universal archive extractor
# ---------------------------------------------------------------------------
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.tar.xz)    tar xJf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.rar)       unrar x "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1"       ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ---------------------------------------------------------------------------
# COLORED MAN PAGES - from "The Ultimate .bashrc" by zachbrowne
# Makes man pages easier to read with color highlighting
# ---------------------------------------------------------------------------
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#!/bin/bash

PATH="$HOME/.cabal/bin:$HOME/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:$HOME/bin"

export EDITOR='vim'

# Aliases
alias so='web_search duckduckgo \!so'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

# Vi command line
bindkey -v
export KEYTIMEOUT=1

# Timeout on linux ssh
export TMOUT=0

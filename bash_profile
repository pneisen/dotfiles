#!/bin/sh
# Exec fish for systems where I can't change my shell from bash.

if [ ! -f /usr/bin/ctags ] && [ ! -f /usr/local/bin/ctags ]; then
  exec $(which fish) 
fi

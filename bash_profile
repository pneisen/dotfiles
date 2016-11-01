#!/bin/sh
# Exec fish for systems where I can't change my shell from bash.

if [ -f /usr/local/bin/fish -o -f /usr/bin/fish ]; then
  exec $(which fish) 
fi

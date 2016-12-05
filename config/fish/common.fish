# Configuration shared with all hosts.

# Golang GOPATH. Need this before the path.
set -gx GOPATH $HOME/projects/golang

set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/go/bin $HOME/bin $GOPATH/bin $HOME/.local/bin

set -gx TERM xterm-256color
set -gx EDITOR vim

# Abbreviations
abbr fig docker-compose
abbr sshaws ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
abbr .plan vim ~/.plan/README.md

# Timeout on linux ssh
set -gx TMOUT 0

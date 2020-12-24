# Configuration shared with all hosts.

set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /snap/bin /usr/games /usr/local/go/bin $HOME/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.platformio/penv/bin

set -gx TERM xterm-256color
set -gx EDITOR vim

set -gx DOCKER_HOST tcp://0.0.0.0:2375

set -gx MANGOHUD 1

# Set the umask. This is really needed for WSL.
umask 077

# Abbreviations
abbr fig docker-compose
abbr sshaws ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
abbr fish_reload source ~/.config/fish/config.fish

# Timeout on linux ssh
set -gx TMOUT 0

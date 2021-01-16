# Skip the welcome message
set fish_greeting ""

# Path
set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /snap/bin /usr/games /usr/local/go/bin $HOME/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.platformio/penv/bin

# Set bindings to Vi
set fish_key_bindings fish_user_key_bindings

# Load utility functions
source $HOME/.config/fish/util.fish

# Load my contacts functions
source $HOME/.config/fish/contacts.fish

# Start the ssh agent
if test -z (pgrep ssh-agent)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

# Common settings
set -gx TERM xterm-256color
set -gx EDITOR vim
set -gx BROWSER firefox

# Turn on Mangohud for Vulkan Games
set -gx MANGOHUD 1

# Set the umask. This is really needed for WSL.
umask 077

# Abbreviations
abbr sshaws ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
abbr fish_reload source ~/.config/fish/config.fish

# Timeout on linux ssh
set -gx TMOUT 0# Run the common script.

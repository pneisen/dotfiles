# Skip the welcome message
set fish_greeting ""

# Set bindings to Vi
set fish_key_bindings fish_user_key_bindings

# Load the tab color and title functions
source $HOME/.config/fish/iterm2_tab.fish

# Load utility functions
source $HOME/.config/fish/util.fish

# Load my contacts functions
source $HOME/.config/fish/contacts.fish

# If at work, run the work script.
set -l host_match (string match '^dev[0-9]+$' (hostname -s))
if test -n "$host_match"
  source $HOME/.config/fish/work.fish
end

# If on OSX, run the osx script.
if test (uname) = "Darwin"
  source $HOME/.config/fish/osx.fish
end

# Run the common script.
source $HOME/.config/fish/common.fish

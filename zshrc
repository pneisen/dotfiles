# Load Antigen
source ~/dotfiles/antigen/antigen.zsh

# Load oh-my-zsh library.
antigen use oh-my-zsh

# Bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle wd
antigen bundle git
antigen bundle vi-mode
antigen bundle vagrant
antigen bundle docker
antigen bundle web-search

# Theme
antigen theme miloshadzic

antigen apply

# If we are on a work vm, source the work setup script.
if [[ `hostname -s` =~ ^dev[0-9]+$ ]] then
  source $HOME/.work
fi

# If we are on a mac, source the osx setup script
if [[ `uname` == 'Darwin' ]]
then
  source $HOME/.osx
fi

# Common setup
source $HOME/.common


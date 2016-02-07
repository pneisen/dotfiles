#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory
# to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="bash_profile git gitconfig vimrc vim zshrc common osx work" # list of files/folders to symlink in homedir

##########

# install ctags if we are on linux and it isn't there already
if [ ! -f /usr/bin/ctags ] && [ ! -f /usr/local/bin/ctags ]; then
  if [[ $(uname) == 'Linux' ]]; then
    echo "Installing ctags..."
    sudo apt-get install -y ctags
  fi  
fi

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Init and update the git submodules
echo "Initing and updating git submodules"
git submodule init
git submodule update
echo "done"

# Install vundle plugins
vim +PluginInstall +qall

# Create symlinks from the homedir to any files in the ~/dotfiles directory specified
#in $files
for file in $files; do
    rm ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install -y zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

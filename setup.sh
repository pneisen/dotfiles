#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory
# to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
files="config bash_profile git gitconfig gitignore vimrc vim" # list of files/folders to symlink in homedir

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

# Create symlinks from the homedir to any files in the ~/dotfiles directory specified
#in $files
for file in $files; do
    rm -rf ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install Plug
if [ ! -f vim/autoload/plug.vim ]; then
  echo "Installing Vim Plug"
  curl -fLo vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Vim plugins
vim +PlugInstall +qall

# Test to see if fish is installed.  If it is:
if [ -f /usr/local/bin/fish -o -f /usr/bin/fish ]; then
    # Set the default shell to fish if it isn't currently set to fish
    if [[ ! $(echo $SHELL) == $(which fish) ]]; then
      if ! grep -Fxq $(which fish) /etc/shells
      then
        echo $(which fish) | sudo tee -a /etc/shells
      fi
      chsh -s $(which fish)
    fi
else
  echo "Please install fish shell and re-run"
fi


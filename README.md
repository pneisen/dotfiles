## Pete's dot files

My dot files for linux and OSX. I use zsh and vim with antigen and vundle doing the plugin management. Below are notes for myself
because I always forget these things. Might as well put them in the readme.

#### To setup a new machine:
1. Clone this repo in home dir
2. cd dotfiles
3. setup.sh

#### To add a new submodule:
1. cd dotfiles
2. git submodule add *plugin-repo-url* vim/bundle/*plugin-name*
3. setup.sh

#### To update all submodules
1. cd dotfiles
2. git submodule foreach git pull origin master
3. git add --all
4. git commit
5. git push

#### To bring submodules current on other host after update
1. cd dotfiles
2. git pull
3. git submodule update --recursive

#### Custom vim binds I have setup
* \\p - Open the current file in the default program on OSX for a preview
* \\n - Toggle line numbers
* \\s - Toggle spell check

#### Zsh aliases I have setup
* fig - Alias for docker-compose
* so - Do a duckduckgo search of stackoverflow
* glog - Nice git log

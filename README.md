## Pete's dot files

My dot files for linux and OSX. I use fish and vim with plug doing the plugin management. Below are notes for myself
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
* `space p` - Open the current file in the default program on OSX for a preview (requires [Markdown Reader Chrome Extension](https://chrome.google.com/webstore/detail/markdown-reader/gpoigdifkoadgajcincpilkjmejcaanc) or similar)
* `space n` - Toggle line numbers
* `space r` - Toggle relative line numbers
* `space s` - Toggle spell check
* `space c` - Clear the highlight for the current search
* `space j` - Change to the previous buffer
* `space k` - Change to the next buffer
* `space d` - Delete the current buffer
* `space tc` - Run the golang code coverage from vim-go
* `space e` - Launch netrw directory browser (:Explore)

#### fish aliases I have setup
* fig - Alias for docker-compose
* sshaws - Alias to ssh, but don't write to known_hosts file. Used for connecting to AWS where the host changes almost every time.
* vi - Alias for vim
* .plan - Edits my .plan file (repo must be checked out in my home directory)

#### fish functions I have setup
* tree - Display a bash style directory tree
* tab_title - Set the title on the current iterm2 tab
* tab_color <red> <green> <blue> - Set the current iterm2 tab to the color indicated by the RGB values (0-255)
* tab_nocolor - Set the current iterm2 tab back to default
* tab_red - Shortcut for calling *tab_color 255 0 0* - These exist for standard ROYGBIV colors as well as black, white, and brown 

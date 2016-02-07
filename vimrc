set nocompatible "Require vim and not vi

" Turn off filetype detection and loading of plugins before we run Pathogen
filetype off
filetype plugin indent off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" The vundle plugin
Plugin 'VundleVim/Vundle.vim'

" Vim plugins.
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'gabrielelana/vim-markdown'

" Turn on filetype detection, indent scripts, filetype plugins, and syntax
" highlighting
call vundle#end()
filetype plugin indent on
syntax on

" Color scheme
colorscheme distinguished

" Two space indention
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" No line wrap
set nowrap

" Highlight search results
set hlsearch

" Add the current branch to the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Airline
set laststatus=2
set ttimeoutlen=50

" Line number toggle
nmap <leader>n :setlocal number!<cr>

" Search up the tree for the tags file
set tags+=tags;/

" Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Open current file in default program on OSX for a preview.
nmap <leader>p :exe ':silent !open -g %'<cr> <bar> :redraw!<cr>

" Spell check toggle
nmap <leader>s :setlocal spell!<cr>


set nocompatible

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Color scheme
colors distinguished

" Syntax highlighting
syntax on

" Two space indention
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" No line wrap
set nowrap

" Indicate where 80 chars is
set colorcolumn=80

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

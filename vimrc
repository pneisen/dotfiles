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

" Indicate where 80 chars is
set colorcolumn=80

" Add the current branch to the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

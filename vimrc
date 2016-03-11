set nocompatible "Require vim and not vi

" Vim plugins.
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'gabrielelana/vim-markdown'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'elmcast/elm-vim'
call plug#end()

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

" Set leader to space
let mapleader = " "

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

" Remove the preview window for YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Setup UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Manage imports on save in go
let g:go_fmt_command = "goimports"

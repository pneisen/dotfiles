set nocompatible "Require vim and not vi

" Vim plugins.
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'gabrielelana/vim-markdown'
Plug 'Valloric/YouCompleteMe'
Plug 'elmcast/elm-vim', { 'for': 'elm' }
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
nmap <leader>r :setlocal relativenumber!<cr>

" Search up the tree for the tags file
set tags+=tags;/

" Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Open current file in default program on OSX for a preview.
nmap <leader>p :exe ':silent !open -g %'<cr> <bar> :redraw!<cr>

" Spell check toggle
nmap <leader>s :setlocal spell!<cr>

" Clear the current search
nmap <leader>c :noh<cr>

" Remove the preview window for YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Manage imports on save in go
let g:go_fmt_command = "goimports"

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" Code coverage from aws
au FileType go nmap <leader>tc :!clear && pushd $(dirname $(go test -coverprofile=coverage.out &>/dev/null && go tool cover -html=coverage.out 2>&1 \| awk '{print $5}')); echo "Coverage report: `hostname --fqdn`/coverage.html"; sudo python -m SimpleHTTPServer 80 &>/dev/null; popd<CR>

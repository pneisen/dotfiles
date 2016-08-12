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
Plug 'lambdatoast/elm.vim'
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

" No .swp files
set noswapfile

" Persistent undo
set undodir=~/.vim/undo
set undofile

" Highlight search results
set hlsearch

" Add the current branch to the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Airline
set laststatus=2
set ttimeoutlen=50
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set leader to space
let mapleader = " "

" Buffers
nmap <leader>k :bn<cr>
nmap <leader>j :bp<cr>
nmap <leader>d :bd<cr>

" Line number
nmap <leader>n :setlocal number!<cr>
nmap <leader>r :setlocal relativenumber!<cr>
set relativenumber
set number

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

" Format rust files on save
let g:rustfmt_autosave = 1

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_php_checkers = ['php', 'phpmd']

" vim-go code coverage toggle
au FileType go nmap <leader>tc :GoCoverageToggle<cr>

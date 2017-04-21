set nocompatible "Require vim and not vi

if &shell =~# 'fish$'
  set shell=bash
endif

" Vim plugins.
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'elmcast/elm-vim'
" Needed for ghcmod
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" Color scheme
colorscheme distinguished

" Two space indention by default
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Set the indent to 4 for elm and docs
augroup four_space
  autocmd!
  autocmd BufNewFile,BufRead *.elm setlocal ts=4 sw=4 sts=4 expandtab
"  autocmd Filetype pandoc setlocal ts=4 sw=4 sts=4 expandtab
augroup END

" Set the indent to 2 spaces for haskell
augroup two_space
  autocmd!
  autocmd Filetype haskell setlocal ts=2 sw=2 expandtab
augroup END


" Unfold on startup
augroup open_folds
  autocmd Filetype pandoc normal zR
augroup END

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
set noshowmode
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set leader to space
let mapleader = " "

" Buffers
nnoremap <leader>k :bn<cr>
nnoremap <leader>j :bp<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>l :ls<CR>:b<Space>

" Line number
nnoremap <leader>n :setlocal number!<cr>
nnoremap <leader>r :setlocal relativenumber!<cr>
set relativenumber
set number

" Search up the tree for the tags file
set tags+=tags;/

" Open current file in default program on OSX for a preview.
nnoremap <leader>p :exe ':silent !open -g %'<cr> <bar> :redraw!<cr>

" Spell check toggle
nnoremap <leader>s :setlocal spell!<cr>

" Clear the current search
nnoremap <leader>c :noh<cr>

" netrw options
let g:netrw_liststyle = 3
let g:netrw_banner = 0
nnoremap <leader>e :Explore<cr>

" Remove the preview window for YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Manage imports on save in go
let g:go_fmt_command = "goimports"

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_go_checkers = ['go1.8rc2', 'golint', 'govet']
let g:syntastic_php_checkers = ['php', 'phpmd']

" vim-go code coverage toggle
augroup go_settings
  autocmd!
  autocmd FileType go nnoremap <leader>tc :GoCoverageToggle<cr>
augroup END

" Elm
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1
let g:ycm_semantic_triggers = {
      \ 'elm' : ['.'],
      \}

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

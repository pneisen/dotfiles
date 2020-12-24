set nocompatible "Require vim and not vi

if &shell =~# 'fish$'
  set shell=bash
endif

" Vim plugins.
call plug#begin('~/.vim/plugged')
"Plug 'w0rp/ale'
"Plug 'natebosch/vim-lsc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" Needed for ghcmod
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'junegunn/vim-emoji'

call plug#end()

" Color scheme
colorscheme distinguished

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Two space indention by default
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

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

" Turn off the preview window for omnicomplete
:set completeopt-=preview

" Add the current branch to the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ALE
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" LSC
" let g:lsc_server_commands = {'go': 'bingo'}
" let g:lsc_auto_map = v:true
" let g:lsc_enable_autocomplete = v:false
" let g:lsc_trace_level = 'verbose'

" Airline
set laststatus=2
set ttimeoutlen=50
set noshowmode
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

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
" set tags+=tags;/

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

" Manage imports on save in go
let g:go_fmt_command = "goimports"

" vim-go code coverage toggle
augroup go_settings
  autocmd!
  autocmd FileType go nnoremap <leader>tc :GoCoverageToggle<cr>
augroup END

" coc.nvim settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Vimwiki
let g:vimwiki_list =[{'path': '~/vimwiki/',
                    \ 'path_html': '~/vimwiki_html/'}]

" Rust
let g:rustfmt_autosave = 1

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

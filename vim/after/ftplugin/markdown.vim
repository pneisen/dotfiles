" Soft wrapping
setlocal wrap
setlocal linebreak
setlocal nolist

" No line numbers and show breaks
setlocal nonumber
setlocal norelativenumber
setlocal showbreak=.

" Turn off the whitespace detection for airline
let g:airline#extensions#whitespace#enabled = 0

" Trailing whitespace as dots
setlocal listchars=trail:.
setlocal list

" Remap movement keys
vnoremap <buffer> j gj
vnoremap <buffer> k gk
vnoremap <buffer> $ g$
vnoremap <buffer> 0 g0
vnoremap <buffer> ^ g^
nnoremap <buffer> j gj
nnoremap <buffer> k gk
nnoremap <buffer> $ g$
nnoremap <buffer> 0 g0
nnoremap <buffer> ^ g^


setlocal formatoptions=tcqw
setlocal textwidth=120
setlocal wrapmargin=0
setlocal autoindent

setlocal nonumber
setlocal norelativenumber

" Turn off the whitespace detection for airline
let g:airline#extensions#whitespace#enabled = 0

augroup prose
  autocmd InsertEnter * setlocal formatoptions+=a
  autocmd InsertLeave * setlocal formatoptions-=a
augroup END

" Reflow paragraph
nnoremap <buffer> <leader>q gqip

" Trailing whitespace as dots
setlocal listchars=trail:.
setlocal list

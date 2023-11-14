augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END
" function! GoToLastEdit()
"   if &ft =~ 'fugitive'
"     return
"   endif
"   if line("'\"") > 0 && line("'\"") <= line("$") |
"       exe "silent! normal! g`\"" |
"   endif
" endfunction
" autocmd BufReadPost * call GoToLastEdit()

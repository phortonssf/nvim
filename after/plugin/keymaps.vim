map <silent> <leader>Ex :Lexplore<CR>
nnoremap <space><space> :%sm/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <leader>vqsr :cdo %s/<search term>/<replace term>/gc<Left><Left><Left><Left><Left><Left>
" map <C-k> :bnext<CR>
" map <C-j> :bprev<CR>
function! IsQFOpen ()
   if empty(filter(getwininfo(), 'v:val.quickfix'))
     echo 1
     return 1
   else
     return 0
   endif
endfunction
nnoremap <expr> <C-j> IsQFOpen() ? ':bnext<CR>' : ':cnext<CR>'
nnoremap <expr> <C-k> IsQFOpen() ? ':bprev<CR>' : ':cprev<CR>'

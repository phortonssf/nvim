map <silent> <leader>Ex :Lexplore<CR>
nnoremap <space><space> :%sm/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <leader>vqsr :cdo %s/<search term>/<replace term>/gc<Left><Left><Left><Left><Left><Left>
" map <C-k> :bnext<CR>
" map <C-j> :bprev<CR>
function! IsQFOpen ()
     return 1
   else
     return 0
   endif
endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>
map <silent> <leader>Ex :Lexplore<CR>
nnoremap <silent> <leader>d% :norm %x`'x<CR>
" nnoremap <expr> <C-j> IsQFOpen() ? ':bnext<CR>' : ':cnext<CR>'
" nnoremap <expr> <C-k> IsQFOpen() ? ':bprev<CR>' : ':cprev<CR>'

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <silent> <leader>gcd :Gcd<CR> \| :pwd<CR>
" log variable under cursor
" nnoremap <Leader>L "ayiwoconsole.log('','<C-R>a:', <C-R>a);<Esc>T(li


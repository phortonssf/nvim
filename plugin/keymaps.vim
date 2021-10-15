noremap <A-j> :m .+2<CR>==
noremap <A-k> :m .-2<CR>==
noremap <A-j> <Esc>:m .+1<CR>==gi
noremap <A-k> <Esc>:m .-2<CR>==gi
noremap <A-j> :m '>+1<CR>gv=gv
noremap <A-k> :m '<-2<CR>gv=gv

"Leader + o to add space normal mode
nnoremap <leader>o o<esc>

" Alias for find all occurences *****
"nnoremap <leader>s :%s//gI<Left><Left><Left>
noremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

"ctrl Q to quit"
map <C-Q> :qa!<CR>

"Shift U to undo to last write"
nnoremap U :ea 1f<CR>

" MOVE character alt-h/l
noremap <M-l> <Nop>
noremap <M-h> <Nop>

" set jj and kk leave insert mode
imap jj <Esc><Right>
imap kk <Esc>

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

"Map Leader to space bar
"let mapleader = " "
noremap <SPACE> <Nop>
let mapleader="\<Space>"

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Leader + o to add space normal mode
nnoremap <leader>o <S-i><CR><esc>k
"ss space in normal mode
noremap <leader><space> i<space><esc>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
xnoremap <leader>p "_dP

"maps Ctrl-c to system register
vnoremap <C-c> "+y

"Maps Ctrl v to ctrl m - to copy paste
 nnoremap <c-m> <c-v>
 nnoremap <c-m> <c-q>
 
 " Alias for commenting a block of code
" nnoremap <leader>c <c-v>}I
" nnoremap <leader>" <c-v>}kI"<space><esc>

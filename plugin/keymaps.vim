noremap <A-j> :m .+2<CR>==
noremap <A-k> :m .-2<CR>==
noremap <A-j> <Esc>:m .+1<CR>==gi
noremap <A-k> <Esc>:m .-2<CR>==gi
noremap <A-j> :m '>+1<CR>gv=gv
noremap <A-k> :m '<-2<CR>gv=gv

"Yank to end of line"
noremap Y y$
noremap Q @q
"telescope"
map <leader>rf :G 
map <leader>gc :G commit


"Map Leader to space bar
noremap <SPACE> <Nop>
let mapleader=" "

" Alias for find all occurences *****
"nnoremap <leader>s :%s//gI<Left><Left><Left>
noremap <leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
"Q to quit"
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


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Leader + o to add space normal mode
nnoremap <leader>o <S-i><CR><esc>k
"ss space in normal mode
noremap <leader><space> i<space><esc>

" delete without yaing
nnoremap <leader>d "_d
vnoremap <leader>d "_d
xnoremap <leader>p "_dP

"maps Ctrl-c to system register
vnoremap <C-c> "+y

"Maps Ctrl v to ctrl m - to copy paste
 nnoremap <c-m> <c-v>
 nnoremap <c-m> <c-q>
 
 vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" GREATest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d
 " Alias for commenting a block of code
" nnoREMAP <leader>c <c-v>}I
" nnoremap <leader>" <c-v>}kI"<space><esc>

"Tmux Ctrl-A unbind
map <C-a> <Nop>

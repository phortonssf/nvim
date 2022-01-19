"Map Leader to space bar
noremap <SPACE> <Nop>
let mapleader = "\<Space>"
nnoremap <C-_> :Commentary <CR>
vnoremap <C-_> :Commentary <CR>
xnoremap <C-_> :Commentary <CR>
"Alt move line "
noremap <A-j> :m .+2<CR>==
noremap <A-k> :m .-2<CR>==
noremap <A-j> <Esc>:m .+1<CR>==gi
noremap <A-k> <Esc>:m .-2<CR>==gi
noremap <A-j> :m '>+1<CR>gv=gv
noremap <A-k> :m '<-2<CR>gv=gv


"Bufferline go to buffer"
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
"unbinds F1 key for help"
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

"Yank to end of line"
noremap Q @q


" Alias for find all occurences *****
"nnoremap <leader>s :%s//gI<Left><Left><Left>
" noremap <eader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

"Q to quit"
cnoremap <C-Q> <C-e><C-u><Esc>
nnoremap <C-Q> <Esc>:qa!<CR>
"Shift U to undo to last write"
nnoremap U :ea 1f<CR>

" MOVE character alt-h/l
noremap <M-l> <Nop>
noremap <M-h> <Nop>

" set jj and kk leave insert mode
imap jj <Esc><Right>
imap kk <Esc>

" move among buffers with CTRL
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Leader + o to add space normal mode
nnoremap <leader>o <S-i><CR><esc>k
"ss space in normal mode
noremap <leader><space> i<space><esc>


"Maps Ctrl v to ctrl m - to copy paste
nnoremap <A-v> <c-v>
 
 " nnoremap <c-m> <c-q>
 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Prime binds"
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Split line shift K
nmap K m'a<CR><Esc>`'
"Breaks undo sequence"
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap } }<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u
inoremap = =<c-g>u
inoremap <Bslash> <Bslash><c-g>u
inoremap <Space> <Space><c-g>u


"Jump List"
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

"maps Ctrl-c to system register
vnoremap <C-c> "+y
 
" next greatest remap ever : asbjornHaland
nnoremap Y yg$
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" x doesnt overide register
vnoremap x "_x
nnoremap x "_x

"c doesnt overide register
vnoremap c "_c
nnoremap c "_c
vnoremap C "_C
nnoremap C "_C

"delete to blackhole register
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap D "_D
xnoremap d "_d
xnoremap D "_D

" cut to system clipboard
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
xnoremap <leader>d "+d
" paste below shift-p
nnoremap P  o<Esc>p

" copy paragraph
nnoremap <leader>vcp yap<S-}>p
" past last insert
nnoremap <leader>vpi ".p

" paste from clipboard insert mode
inoremap <C-v> <C-r>+
"Formatter vim key
nnoremap <silent> <leader>f :Format<CR>

" map cursor history to match vimium
nnoremap <S-h> <C-o> 
nnoremap <S-l> <C-i> 

" console.log worder under cursor
" console.log('',cursor:', cursor);
" console.log('cursor:', cursor);
" console.log('cursor:', cursor);
nnoremap <Leader>L "ayiwoconsole.log('','<C-R>a:', <C-R>a);<Esc>T(li
" terminal esc mode
tnoremap <Esc> <C-\><C-n

" close all buffers but current
nmap <Leader>\c :call CloseAllBuffersButCurrent()<CR>
" search and replace
nnoremap gs :%sm/
xnoremap gs :sm/
" close buffer
nnoremap <Leader>x :bd<CR>

" first character on line
nnoremap <C-h> ^

"go to end of line
nnoremap <C-l> $

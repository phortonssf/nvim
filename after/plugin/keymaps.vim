"Map Leader to space bar
noremap <SPACE> <Nop>
let mapleader = "\<Space>"
nnoremap <C-_> :Commentary <CR>
vnoremap <C-_> :Commentary <CR>
xnoremap <C-_> :Commentary <CR>

"Alt move line "
noremap <A-j> :m .+2<CR>==
noremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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

" apply macro
noremap Q @q

" Alias for find all occurences *****
"nnoremap <leader>s :%s//gI<Left><Left><Left>
" noremap <eader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

"Q to quit"
cnoremap <C-Q> <C-e><C-u><Esc>
nnoremap <C-Q> <Esc>:qa!<CR>

"Shift U to undo to last write"
nnoremap U :ea 1f<CR> :echo 'Undo until last write'<CR>

" nnoremap U :ea 1f<CR> :call Log("<cword>")<CR>

" MOVE character alt-h/l
noremap <M-l> <Nop>
noremap <M-h> <Nop>

" set jj and kk leave insert mode
imap jj <Esc><Right>
imap kk <Esc>

" move among buffers with CTRL
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
" enter in wild mode accepts like ctrl-y
cnoremap <expr> <CR> wildmenumode() ? "\<C-y>" : "\<CR>"
" make ctrlp ctrln work in wildmode
cnoremap <expr> <C-p>    pumvisible() ? "\<Left>"  : "\<C-p>"
cnoremap <expr> <C-n>  pumvisible() ? "\<Right>" : "\<C-n>"
cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" if &wildoptions =~ "pum"
"     cnoremap <expr>  <C-p> pumvisible() ? "<C-p>" : "\\<left>"
"     cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\\<down>"
" endif

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Leader + o to add space normal mode
nnoremap <leader>o <S-i><CR><esc>k
"ss space in normal mode
noremap <leader><space> i<space><esc>


"Maps Ctrl v to ctrl m - to copy paste
nnoremap <A-v> <c-v>

" nnoremap <c-m> <c-q>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Prime binds center on scroll"
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"Split line shift K
nmap K m'i<CR><Esc>`'
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
" vnoremap <C-c> "+y

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
" xnoremap \ "_d

nnoremap s "_s

" cut to system clipboard
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
xnoremap <leader>d "+d

" paste below shift-p
nnoremap <leader>p  o<Esc>p

" copy paragraph
nnoremap <leader>vcp yap<S-}>p

" past last insert
nnoremap <leader>vpi ".p

" paste from clipboard insert mode
 " inoremap <C-v> <C-r>+

 "Formatter vim key
nnoremap <silent> <leader>f :Format<CR>

" map cursor history to match vimium
nnoremap <S-h> <C-o>
nnoremap <S-l> <C-i>

"log word under cursor
" console.log('cursor:', cursor);
 nnoremap <Leader>L "ayiwoconsole.log('','<C-R>a:', <C-R>a);<Esc>T(li

" terminal esc mode
tnoremap <Esc> <C-\><C-n

" close all buffers but current
nnoremap <Leader>xa :call CloseAllBuffersButCurrent()<CR>

nnoremap <Leader>T :Telescope<CR>
" testch and replace word under cursor
 " nnoremap <expr> <R> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
 " nnoremap R :%sm/\<<C-r><C-w>\>//gc<Left><Left><Left>
" project search and replace
nnoremap <leader>vqsr :cdo %s/<search term>/<replace term>/gc<Left><Left><Left><Left><Left><Left>
" search and replace
 nnoremap sr :%sm//gc<Left><Left><Left>
 xnoremap sr :%sm//gc<Left><Left><Left>

" close buffer
nnoremap <Leader>x :bd<CR>

" first character on line
nnoremap <C-h> ^

"go to end of line
nnoremap <C-l> $

"move to first character and change line
nnoremap S ^"_C
" undo current line only
nnoremap <leader>ul :call Undoline()<CR>

" nnoremap <leader>tt :call  moreFiles()
" how to maka command in vim
" command! Vb normal! <C-v>
" nnoremap <C-v> Vb
" let g:tmuxline_preset = 'lightline'
" let g:vimIsInTmux = 1

" surround word
nmap sw( csw(
nmap sw) csw)
nmap sw{ csw{
nmap sw} csw}
nmap sw[ csw[
nmap sw] csw]
nmap sw" csw"
nmap sw' csw'
nmap sw` csw`

nnoremap vw viw
"surround Word include breaks
nmap sW( csW(
nmap sW) csW)
nmap sW{ csW{
nmap sW} csW}
nmap sW[ csW[
nmap sW] csW]
nmap sW" csW"
nmap sW' csW'
nmap sW` csW`
" vim surround word commands
" make default targets inner
" onoremap ` i`
" onoremap { i{
" onoremap } i}
" onoremap ( i(
" onoremap [ i[
" onoremap ] i]
" onoremap ) :<c-u>normal! f)vs(<cr>
" onoremap ' i'
" onoremap " i"
onoremap w iw
onoremap p ip

" vim surround line commands
map sl( yss(
map sl) yss)
map sl{ yss{
map sl} yss}
map sl[ yss[
map sl] yss]
map sl' yss'
map sl" yss"
map sl` yss`

" wip=better visual movement
" vmap 44 5j
" vmap 55 5k

" (asdfasdf) {asdfasf} {wscfasf}
" source https://vim.fandom.com/wiki/Get_the_name_of_the_current_file
" open all files with same name in same dir or up one
nnoremap <leader>vos :args **/%:t:r.*<CR>
" open css file with same name
nnoremap <leader>voc :args **/%:t:r.css<CR>
" open spec files with same name
nnoremap <leader>vot :args **/**/%:t:r.spec.%:e<CR>
" open all values files that match pattern
nnoremap <leader>voa :args ./values-*.yaml<CR>
"
"yank to vim buffer
" WIP sorta works with regular
vmap <leader>vyb :d \| ene \| e

" **** FAILED ****:
 " vmap <leader>vyb :""d \| ene \| e
 " vmap <leader>vyb : <C-U>exe 'norm! ""d' \| ene \| e \| exec 'norm! ""p'
 " vmap <leader>vyb :"_d \| ene \| e sdfasdf
 "Doesnt work
" vmap <leader>vy : \|<C-U>NormLead d  \| ene \| e
"
"
"

nnoremap <leader>X :bd!<CR>

nnoremap <leader>vz :Telescope zoxide list<CR>
 com! FormatJSON %!python -mjson.tool


nnoremap <leader>tfb :Telescope file_browser<CR>
" map <C-c>  <Nop>
vnoremap <leader>p "_dP

" keeps visual selection after moving
vnoremap < <gv
vnoremap > >gv

" visual copy all code put file name at top
vnoremap <leader>cy :call functions#CompleteYank()<cr>
nnoremap <esc><esc> :silent! nohls<cr>
nnoremap <leader>F :ZenMode<CR>

" highlight last paste
noremap <expr> gV '`[' . getregtype()[0] . '`]'
" terminal mode
if has('nvim')
   tnoremap <Esc> <C-\><C-n>
endi
" copy file path of buffer to clipboard
nmap cp :let @+ = expand("%:p")<cr>

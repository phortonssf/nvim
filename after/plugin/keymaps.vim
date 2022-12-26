
""Bufferline go to buffer"
"nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
"nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
"nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
"nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
"nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
"nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
"nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
"nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
"nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

""unbinds F1 key for help"
"nmap <F1> :echo<CR>
"imap <F1> <C-o>:echo<CR>


"" Alias for find all occurences *****
""nnoremap <leader>s :%s//gI<Left><Left><Left>
"" noremap <eader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

""Q to quit"
"cnoremap <C-Q> <C-e><C-u><Esc>
"nnoremap <C-Q> <Esc>:quitall<CR>

"" nnoremap U :ea 1f<CR> :call Log("<cword>")<CR>

"" MOVE character alt-h/l
"noremap <M-l> <Nop>
"noremap <M-h> <Nop>

"" set jj and kk leave insert mode
"imap jj <Esc><Right>
"imap kk <Esc>

"" move among buffers with CTRL
"map <C-k> :bnext<CR>
"map <C-j> :bprev<CR>


"cnoremap <expr> <CR> wildmenumode() ? "\<C-y>" : "\<CR>"
"" make ctrlp ctrln work in wildmode
" cnoremap <expr> <C-p>    pumvisible() ? "\<Left>"  : "\<C-p>"
" cnoremap <expr> <C-n>  pumvisible() ? "\<Right>" : "\<C-n>"
"cnoremap <expr> <Left>  pumvisible() ? "\<Up>"    : "\<Left>"
"cnoremap <expr> <Right> pumvisible() ? "\<Down>"  : "\<Right>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"" if &wildoptions =~ "pum"
""     cnoremap <expr>  <C-p> pumvisible() ? "<C-p>" : "\\<left>"
""     cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\\<down>"
"" endif

"" Use <Tab> and <S-Tab> to navigate through popup menu
"" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""ss space in normal mode
"noremap <leader><space> i<space><esc>

vnoremap <M-j> :m '>+1<cr>gv=gv
vnoremap <M-k> :m '<-2<cr>gv=gv


""Split line shift K
"nmap K m'i<CR><Esc>`'

""Breaks undo sequence"
"inoremap , ,<c-g>u
"inoremap ` `<c-g>u
"inoremap { {<c-g>u
"inoremap ) )<c-g>u
"inoremap ] ]<c-g>u
"inoremap . .<c-g>u
"inoremap ! !<c-g>u
"inoremap & &<c-g>u
"inoremap + +<c-g>u
"inoremap - -<c-g>u
"inoremap ? ?<c-g>u
"inoremap } }<c-g>u
"inoremap : :<c-g>u
"inoremap ; ;<c-g>u
"inoremap = =<c-g>u
"inoremap <Bslash> <Bslash><c-g>u
"inoremap <Fslash> <Fslash><c-g>u
"inoremap <Space> <Space><c-g>u


"imaps
" {" ,"," <c-g>u"},
" {" `"," `<c-g>u"},
" {" {"," {<c-g>u"},
" {" )"," )<c-g>u"},
" {" ]"," ]<c-g>u"},
" {" ."," .<c-g>u"},
" {" !"," !<c-g>u"},
" {" &"," &<c-g>u"},
" {" +"," +<c-g>u"},
" {" -"," -<c-g>u"},
" {" ?"," ?<c-g>u"},
" {" }"," }<c-g>u"},
" {" :"," :<c-g>u"},
" {" ;"," ;<c-g>u"},
" {" ="," =<c-g>u"},
" {" <Bslash>","<Bslash><c-g>u"},
" {" <Fslash>", "<Fslash><c-g>u"},
" {" <Space>"," <Space><c-g>u"},
" {" <C-v>", "<C-r>+"},
"
















""maps Ctrl-c to system register
"" vnoremap <C-c> "+y

"" next greatest remap ever : asbjornHaland
"nnoremap Y yg$
"nnoremap <leader>y "+y
"vnoremap <leader>y "+y
"nnoremap <leader>Y gg"+yG
"" x doesnt overide register
"vnoremap x "_x
"nnoremap x "_x

""c doesnt overide register
"vnoremap c "_c
"nnoremap c "_c
"vnoremap C "_C
"nnoremap C "_C

""delete to blackhole register
"nnoremap d "_d
"nnoremap d "_d
"vnoremap d "_d
"vnoremap d "_d
"xnoremap d "_d
"xnoremap d "_d
"" xnoremap \ "_d

"nnoremap s "_s

"" cut to system clipboard
"nnoremap <leader>d "+d
"nnoremap <leader>D "+D
"vnoremap <leader>d "+d
"xnoremap <leader>d "+d

"" paste below shift-p
"nnoremap <leader>p  o<Esc>p

"" copy paragraph
"nnoremap <leader>vcp yap<S-}>p
"" past last insert
"nnoremap <leader>vpi ".p

"" map cursor history to match vimium
"nnoremap <S-h> <C-o>
"nnoremap <S-l> <C-i>

""log word under cursor
"" console.log('cursor:', cursor);
" nnoremap <Leader>L "ayiwoconsole.log('','<C-R>a:', <C-R>a);<Esc>T(li

"" terminal esc mode
"tnoremap <Esc> <C-\><C-n

"" close all buffers but current
"nnoremap <Leader>xa :call CloseAllBuffersButCurrent()<CR>

"nnoremap <Leader>T :Telescope<CR>
"" testch and replace word under cursor
" " nnoremap <expr> <R> ':%s/\<'.expand('<cword>').'\>/<&>/g<CR>'
" nnoremap R :%sm/\<<C-r><C-w>\>//gc<Left><Left><Left>
"" project search and replace
"nnoremap <leader>vqsr :cdo %s/<search term>/<replace term>/gc<Left><Left><Left><Left><Left><Left>
"" search and replace
" nnoremap sr :%sm//gc<Left><Left><Left>
" xnoremap sr :%sm//gc<Left><Left><Left>

"" close buffer
"nnoremap <Leader>x :bd<CR>

"" first character on line
"xmap <C-h> ^
"nmap <C-h> ^
""go to end of line
"xmap <C-l> g_
"nmap <C-l> g_

"" undo current line only
"nnoremap <leader>ul :call Undoline()<CR>

"" nnoremap <leader>tt :call  moreFiles()
"" how to maka command in vim
"" command! Vb normal! <C-v>
"" nnoremap <C-v> Vb
"" let g:tmuxline_preset = 'lightline'
"" let g:vimIsInTmux = 1

"" surround word
""nmap sw( csw(
""nmap sw) csw)
""nmap sw{ csw{
""nmap sw} csw}
""nmap sw[ csw[
""nmap sw] csw]
""nmap sw" csw"
""nmap sw' csw'
""nmap sw` csw`

""" xnoremap u <esc>
""nnoremap vw viw
"""surround word include breaks
""nmap sW( csW(
""nmap sW) csW)
""nmap sW{ csW{
""nmap sW} csW}
""nmap sW[ csW[
""nmap sW] csW]
""nmap sW" csW"
""nmap sW' csW'
""nmap sW` csW`
"" vim surround word commands
"" make default targets inner
"" onoremap ` i`
"" onoremap { i{
"" onoremap } i}
"" onoremap ( i(
"" onoremap [ i[
"" onoremap ] i]
"" onoremap ) :<c-u>normal! f)vs(<cr>
"" onoremap ' i'
"" onoremap " i"
"" onoremap w iw
"" onoremap p ip

"" better visual mappings
"nnoremap <s-v> :normal! vg_<cr>
"nnoremap vv :silent! normal! <s-v><cr>

"" map sl) yss)
"" map sl( yss(
"" map sl{ yss{
"" map sl} yss}
"" map sl[ yss[
"" map sl] yss]
"" map sl' yss'
"" map sl" yss"
"" map sl` yss`

"" wip=better visual movement
"" vmap 44 5j
"" vmap 55 5k

"" (asdfasdf) {asdfasf} {wscfasf}
"" source https://vim.fandom.com/wiki/Get_the_name_of_the_current_file
"" open all files with same name in same dir or up one
"nnoremap <leader>vos :args **/%:t:r.*<CR>
"" open css file with same name
"nnoremap <leader>voc :args **/%:t:r.css<CR>
"" open spec files with same name
"nnoremap <leader>vot :args **/**/%:t:r.spec.%:e<CR>
"" open all values files that match pattern
"nnoremap <leader>voa :args ./values-*.yaml<CR>
""
""yank to vim buffer
"" WIP sorta works with regular
"vmap <leader>vyb :d \| ene \| e

"nnoremap <leader>X :bd!<CR>

"nnoremap <leader>vz :Telescope zoxide list<CR>
" com! FormatJSON %!python -mjson.tool


"nnoremap <leader>tfb :Telescope file_browser<CR>
"" map <C-c>  <Nop>





"" visual copy all code put file name at top
"vnoremap <leader>cy :call functions#CompleteYank()<cr>
"nnoremap <esc><esc> :silent! nohls<cr>

"nnoremap <leader>F :ZenMode<CR>


"" terminal mode
"if has('nvim')
"   tnoremap <Esc> <C-\><C-n>
" endif
"" copy file path of buffer to clipboard
"nmap yfp :let @+ = expand("%:p")<cr>
"" quit visual mode
"xnoremap u <esc>
"" onoremap <Ctrl-l> :norm $
"map s <Nop>
"nnoremap <leader>db :lua require('digitaldive.utils.diff')()<CR>

" nnoremap <leader>hw :help <C-r><C-w><CR>

"" create new text obj, first visual then obj
"xnoremap <Ctrl-l> g_
"onoremap  L :normal vg-
"xnoremap al $o^
"onoremap al :normal val<CR>
"


" CWD to buffer director
function! ChangeToLocalDir()
  lchdir %:p:h
  return ''
endfunction
nnoremap <expr> _c ChangeToLocalDir()

" ToggleQuickFix
function! ToggleQuickFix()
   if empty(filter(getwininfo(), 'v:val.quickfix'))
       copen
   else
       cclose
   end
 endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>
" https://stackoverflow.com/questions/16743112/open-item-from-quickfix-window-in-vertical-split
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L


function! SaveJump(motion)
  if exists('#SaveJump#CursorMoved')
    autocmd! SaveJump
  else
    normal! m'
  endif
  let m = a:motion
  if v:count
    let m = v:count.m
  endif
  execute 'normal!' m
endfunction

function! SetJump()
  augroup Savejump
    autocmd!
    autocmd cursormoved * autocmd! savejump
  augroup end
endfunction

" nnoremap <silent> <C-u> :<C-u>call SaveJump("\<lt>C-u>")<CR>:call SetJump()<CR>
" nnoremap <silent> <C-d> :<C-u>call SaveJump("\<lt>C-d>")<CR>:call SetJump()<CR>
" DONE
"Jump List"
" nnoremap <expr> k (v:count > 4 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

"""replace in visual mode
"vnoremap <leader>p "_dP
""Map Leader to space bar
"noremap <SPACE> <Nop>
"let mapleader = "\<Space>"
" nnoremap <C-_> :Commentary <CR>
" vnoremap <C-_> :Commentary <CR>
" xnoremap <C-_> :Commentary <CR>


""Alt move line "
"noremap <A-j> :m .+2<CR>==
"noremap <A-k> :m .-2<CR>==
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

""" apply macro
"noremap Q @q

""Shift U to undo to last write"
"nnoremap u :ea 1f<cr> :echo 'undo until last write'<CR>


""Prime binds center on scroll"
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z

""Leader + o to add space normal mode
"nnoremap <leader>o <S-i><CR><esc>k
"
"
"
" match quotes https://github.com/airblade/vim-matchquote
if exists("g:loaded_matchquote") || &cp
  finish
endif
let g:loaded_matchquote = 1

if has('nvim')
  let loaded_matchit = 1
endif

" Different versions of the matchit plugin map % to
" either a <SID> function or a <Plug> function.
"
"     nnoremap <silent> % :<C-U>call <SID>Match_wrapper('',1,'n') <CR>
"     vnoremap <silent> % :<C-U>call <SID>Match_wrapper('',1,'n') <CR>m'gv``
"     nmap <silent> % <Plug>MatchitNormalForward
"     nmap <silent> % <Plug>(MatchitNormalForward)
"
let s:matchit_n_rhs = maparg('%', 'n')
let s:matchit_x_rhs = maparg('%', 'x')

if s:matchit_n_rhs =~# 'Match_wrapper'
  " Make the function easier to call ourselves.
  let s:matchit_n_rhs = s:matchit_n_rhs[6:]  " drop leading :<C-U>
  let s:matchit_n_rhs = substitute(s:matchit_n_rhs, '<CR>', '', '')  " drop trailing <CR>

  let s:matchit_x_rhs = s:matchit_x_rhs[6:]  " drop leading :<C-U>
  let s:matchit_x_rhs = substitute(s:matchit_x_rhs, '\s\?<CR>', '', '')  " drop trailing <CR>
  if s:matchit_x_rhs[-1:] != ')'
    let s:matchit_x_rhs = substitute(s:matchit_x_rhs, ')', ') | normal! ', '')
  endif
endif

if s:matchit_n_rhs =~# '<Plug>'
  " drop <Plug> so we can escape it later
  let s:matchit_n_rhs = s:matchit_n_rhs[6:]
  let s:matchit_x_rhs = s:matchit_x_rhs[6:]
endif


let s:quotes = ['"', '''', '`', '|']


function! s:matchquote(mode)
  if a:mode == 'x'
    normal! gv
  endif
  let c = s:character_at_cursor()
  execute "normal! \<Esc>"

  if index(s:quotes, c) == -1
    call s:fallback_to_original(a:mode)
    return
  endif

  let num = len(split(getline('.'), c, 1)) - 1
  if num % 2 == 1
    return
  endif

  " is quotation mark under cursor odd or even?
  let col = getpos('.')[2]
  let num = len(split(getline('.')[0:col-1], c, 1)) - 1

  let mvmt = num % 2 == 0 ? 'F' : 'f'
  execute 'normal!' a:mode == 'n' ? mvmt.c : mvmt.c.'m>gv'
endfunction


" NOTE: see here for an alternative way to invoke an overridden mapping:
" https://vi.stackexchange.com/a/27763/1643
function! s:fallback_to_original(mode)
  " Matchit plugin inactive.
  if empty(s:matchit_n_rhs)
    if a:mode == 'n'
      normal! %
    else
      normal! gv%
    endif
    return
  endif

  if s:matchit_n_rhs =~# 'Match_wrapper'
    if a:mode == 'n'
      execute s:matchit_n_rhs
    else
      execute s:matchit_x_rhs
    endif
    return
  endif

  if a:mode == 'n'
    execute "normal \<Plug>".s:matchit_n_rhs
  else
    execute "normal gv\<Plug>".s:matchit_x_rhs
  endif
endfunction


" Capture character under cursor in a way that works with multi-byte
" characters.  Credit to http://stackoverflow.com/a/23323958/151007.
function! s:character_at_cursor()
  return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction


nnoremap <silent> <expr> % (v:count == 0 ? ":call <SID>matchquote('n')<CR>" : '%')
xnoremap <silent> % : m' \| <C-U>call <SID>matchquote('x')<CR>
onoremap <silent> % :normal v%<CR>

if empty(maparg('i<Bar>', 'x')) && empty(maparg('a<Bar>', 'x'))
  xnoremap i<Bar> :<C-U>normal! T<Bar>vt<Bar><CR>
  onoremap i<Bar> :normal vi<Bar><CR>
  xnoremap a<Bar> :<C-U>normal! F<Bar>vf<Bar><CR>
  onoremap a<Bar> :normal va<Bar><CR>
endif

let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/nvim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +206 ~/.dotfiles/nvim/nvim.bak/lua/digitaldive/packer.lua
badd +1 ~/.dotfiles/nvim/nvim.bak/after/plugin/autopairs.lua
badd +1 lua/digitaldive/plugins/autopairs.lua
badd +79 lua/digitaldive/packer.lua
argglobal
%argdel
edit lua/digitaldive/packer.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 67 + 107) / 215)
exe 'vert 2resize ' . ((&columns * 147 + 107) / 215)
argglobal
balt lua/digitaldive/plugins/autopairs.lua
let s:l = 79 - ((18 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 79
let s:c = 62 - ((60 * winwidth(0) + 33) / 67)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 62 . '|'
else
  normal! 062|
endif
wincmd w
argglobal
if bufexists(fnamemodify("lua/digitaldive/plugins/autopairs.lua", ":p")) | buffer lua/digitaldive/plugins/autopairs.lua | else | edit lua/digitaldive/plugins/autopairs.lua | endif
if &buftype ==# 'terminal'
  silent file lua/digitaldive/plugins/autopairs.lua
endif
balt lua/digitaldive/packer.lua
let s:l = 2 - ((1 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 67 + 107) / 215)
exe 'vert 2resize ' . ((&columns * 147 + 107) / 215)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

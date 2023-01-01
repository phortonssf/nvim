setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal suffixesadd^=.lua
setlocal suffixesadd^=init.lua
let &l:path .= ','.stdpath('config').'/lua'
nnoremap <buffer> <Leader>yh :norm yiw<CR>

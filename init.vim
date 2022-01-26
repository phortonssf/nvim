let g:config_files = [
      \ 'globals.vim',
      \ 'keymaps.vim',
      \ 'sets.vim',
      \ 'autocmd.vim',
      \ 'functions.vim',
      \ 'netrw.vim'
      \ ]

for s:fname in g:config_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

lua require("digitaldive")

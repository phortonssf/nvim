autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

"Got to last edit"
" autocmd VimEnter * execute "normal \g;" 
autocmd BufReadPost * execute "normal \g;" 

"Sets Color for vim, not airline
autocmd vimenter * colorscheme gruvbox-material

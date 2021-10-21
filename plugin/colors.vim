
"CMP COLORS
autocmd ColorScheme * hi PmenuSel cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3 
autocmd ColorScheme * hi CmpItemAbbMatch gui=bold  guifg=#a074c4 

" Sets Cursor Number Color and background, hi to get colors
"Brownish Number Line 
autocmd ColorScheme * highlight CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984 
"Bluish Number line 
autocmd InsertEnter *  highlight CursorLineNr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3   
autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984 

"Sets Visual mode hightlight"
" hi Visual cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd ColorScheme * hi Visual  guifg=#a074c4 gui=none

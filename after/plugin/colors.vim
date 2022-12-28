"CMP COLORS
autocmd ColorScheme * hi PmenuSel cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd ColorScheme * hi CmpItemAbbMatch gui=bold  guifg=#a074c4

" Sets Cursor Number Color and background, hi to get colors
"Brownish Number Line
" autocmd ColorScheme * highlight CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#7daea3
autocmd ColorScheme * highlight CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984
"Bluish Number line
autocmd InsertEnter *  highlight CursorLineNr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3

" highlight number on number line
" autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984
autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#7daea3
"Sets Visual mode hightlight"
" hi Visual cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd Colorscheme * hi Visual  guifg=#a074c4 gui=none
"highlight on yank
autocmd Colorscheme * hi Incsearch cterm=bold ctermfg=208 guibg=#3c3836 guifg=#e78a4e
autocmd Colorscheme * hi TelescopeSelection  ctermbg=bold gui=bold guifg=#a074c4 guibg=#45403d

" show number line only for active window
augroup bghighlight
    autocmd!
     " show column line for line length
    " autocmd WinEnter * set colorcolumn=80
    " autocmd WinLeave * set colorcolumn=0

    " only show number line on active window
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
" matching blocks for matchup highlight
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen guifg=#f38ba8
augroup END
"make numberline stand out more
" autocmd ColorScheme * highlight LineNr guifg=#928374
" autocmd ColorScheme * highlight LineNr guifg=#928374

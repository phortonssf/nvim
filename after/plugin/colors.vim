
"CMP COLORS
autocmd ColorScheme * hi PmenuSel cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd colorscheme * hi cmpitemabbmatch gui=bold  guifg=#a074c4

" sets cursor number color and background, hi to get colors
"brownish number line
autocmd colorscheme * highlight cursorlinenr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984
"bluish number line
autocmd insertenter *  highlight cursorlinenr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd insertleave * hi cursorlinenr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984

"sets visual mode hightlight"
" hi visual cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd colorscheme * hi visual  guifg=#a074c4 gui=none
"highlight on yank
autocmd colorscheme * hi incsearch cterm=bold ctermfg=208 guibg=#3c3836 guifg=#e78a4e
autocmd colorscheme * hi telescopeselection  ctermbg=237 guifg=#a074c4 guibg=#45403d

" show number line only for active window
augroup bghighlight
    autocmd!
     " show column line for line length
    " autocmd winenter * set colorcolumn=80
    " autocmd WinLeave * set colorcolumn=0

    " only show number line on active window
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

"make numberline stand out more
autocmd ColorScheme * highlight LineNr guifg=#928374

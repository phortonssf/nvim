 hi Visual cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
 hi FlashMatch guifg=#232634 guibg=#ca9ee6
  " hi FlashCurrent guifg=#232634 guibg=#f2d5cf
  "
autocmd colorscheme * highlight cursorlinenr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984
"bluish number line matches mode on line
autocmd insertenter *  highlight cursorlinenr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#a6d189
autocmd insertleave * hi cursorlinenr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#8caaee
autocmd WinEnter *  hi cursorlinenr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#8caaee


"make numberline stand out more
" autocmd ColorScheme * highlight LineNr guifg=#928374


"sets visual mode hightlight"
" hi visual cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3
autocmd colorscheme * hi visual  guifg=#a074c4 gui=none


" show number line only for active window
augroup bghighlight
    autocmd!
     " show column line for line length
    " autocmd winenter * set colorcolumn=80
    " autocmd WinLeave * set colorcolumn=0

    " only show number line on active window
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    
    " relavive numbers on active window only
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber!
augroup END

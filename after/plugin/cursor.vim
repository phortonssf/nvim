"For workaround for windows terminal
" Better default curosor Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

if !empty($WT_SESSION)
    " guicursor will leave reverse to the terminal, which won't work in WT.
    " therefore we will set bg and fg colors explicitly in an autocmd.
    " however guicursor also ignores fg colors, so fg color will be set
    " with a second group that has gui=reverse.
    hi! WindowsTerminalCursorFg gui=none
    hi! WindowsTerminalCursorBg gui=none
    set guicursor+=n-v-sm:block-WindowsTerminalCursorBg
    set guicursor+=c:ver20

    function! WindowsTerminalFixHighlight()
        " reset match to the character under cursor
        silent! call matchdelete(99991)
        call matchadd('WindowsTerminalCursorFg', '\%#.', 100, 99991)

        " find fg color under cursor or fall back to Normal fg then black
        let bg = synIDattr(synIDtrans(synID(line("."), col("."), 1)), 'fg#')
        if bg == "" | let bg = synIDattr(synIDtrans(hlID('Normal')), 'fg#') | endif
        if bg == "" | let bg = "black" | endif
        exec 'hi WindowsTerminalCursorBg guibg=' . bg
        " reset this group so it survives theme changes
        hi! WindowsTerminalCursorFg gui=reverse
    endfunction

    function! WindowsTerminalFixClear()
        " hide cursor highlight
        silent! call matchdelete(99991)

        " make cursor the default color or black in insert mode
        let bg = synIDattr(synIDtrans(hlID('Normal')), 'fg#')
        if bg == "" | let bg = "black" | endif
        exec 'hi WindowsTerminalCursorBg guibg=' . bg
    endfunction

    augroup windows_terminal_fix
        autocmd!
        autocmd FocusLost * call WindowsTerminalFixClear()
        autocmd FocusGained * if mode(1) != "i" | call WindowsTerminalFixHighlight() | endif

        autocmd InsertEnter * call WindowsTerminalFixClear()
        autocmd InsertLeave * call WindowsTerminalFixHighlight()
        autocmd CursorMoved * call WindowsTerminalFixHighlight()
    augroup END
endif
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set scrolloff
"Cursor line
set cul
call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-ts-autotag'

Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/highlight.lua'

Plug 'glepnir/lspsaga.nvim'
"Plug 'simrat39/symbols-outline.nvim'
Plug 'L3MON4D3/LuaSnip'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'
Plug 'sainnhe/gruvbox-material'

"Sessions
" Plug 'rmagatti/auto-session'
" Plug 'rmagatti/session-lens'
Plug 'shatur/neovim-session-manager'


" prettier
Plug 'sbdchd/neoformat'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'L3MON4D3/LuaSnip'


" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground' 

"Cursor
Plug 'edluffy/specs.nvim'

"Git
Plug 'tpope/vim-fugitive'

"Comment
Plug 'terrortylor/nvim-comment'

Plug 'sudormrfbin/cheatsheet.nvim'
"Scrolling
Plug 'karb94/neoscroll.nvim'

"Floating context
Plug 'romgrk/nvim-treesitter-context'

"TABS OUT OF {} ETC
Plug 'abecodes/tabout.nvim'
Plug 'ahmedkhalf/lsp-rooter.nvim'

call plug#end()


lua require('neoscroll').setup()
lua require("digitaldive")
lua require('nvim_comment').setup()
lua require('tabout').setup()
lua require('lsp-rooter').setup()
lua require('nvim-ts-autotag').setup()
lua require('nvim-autopairs').setup{}


augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" inverted cursor workaround for windows terminal
if !empty($WT_SESSION)
    " guicursor will leave reverse to the terminal, which won't work in WT.
    " therefore we will set bg and fg colors explicitly in an autocmd.
    " however guicursor also ignores fg colors, so fg color will be set
    " with a second group that has gui=reverse.
    hi! WindowsTerminalCursorFg gui=none
    hi! WindowsTerminalCursorBg gui=none
    set guicursor+=n-v-c-sm:block-WindowsTerminalCursorBg

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

"Works to not override terminal cursor
" set guicursor=

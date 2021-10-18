

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

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mattn/emmet-vim'
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

call plug#end()


lua require("digitaldive")
lua require('nvim_comment').setup()
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
set cul
" Sets Cursor Number Color and background, hi to get colors
"autocmd ColorScheme * highlight CursorLineNr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3 
"Brownish Number Line 
autocmd ColorScheme * highlight CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984 
"Bluis Number line 
autocmd InsertEnter *  highlight CursorLineNr cterm=bold ctermfg=236 ctermbg=109 gui=bold guifg=#32302f guibg=#7daea3   
autocmd InsertLeave * hi CursorLineNr ctermfg=236 ctermbg=246 guifg=#32302f guibg=#a89984 
"Toggle Number Line
" autocmd InsertLeave * set nocul
" autocmd InsertEnter * set cul

" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" autocmd VimLeave set guicursor=
" augroup END


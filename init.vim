

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
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'rmagatti/auto-session'
" prettier
Plug 'sbdchd/neoformat'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground' 

"Cursor
Plug 'edluffy/specs.nvim'

"Git
Plug 'tpope/vim-fugitive'
"Comment
Plug 'terrortylor/nvim-comment'

call plug#end()

lua require("digitaldive")
lua require('nvim_comment').setup()
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


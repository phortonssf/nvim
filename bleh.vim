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



"Works to not override terminal cursor
" set guicursor=
   
"Toggle Number Line
" autocmd InsertLeave * set nocul
" autocmd InsertEnter * set cul

" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" autocmd VimLeave set guicursor=
" augroup END



"Toggle Number Line
" autocmd InsertLeave * set nocul
" autocmd InsertEnter * set cul

" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" autocmd VimLeave set guicursor=
" augroup END



" I dont know

" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)

" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

"Garbage

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7k"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" autocmd VimLeave * silent 

"  if &term =~ "xterm\\|rxvt"
"    " use an orange cursor in insert mode
"    let &t_SI = "\<Esc>]12;orange\x7"
"    " use a red cursor otherwise
"    let &t_EI = "\<Esc>]12;red\x7"
"    silent !echo -ne "\033]12;red\007"
"    " reset cursor when vim exits
"    autocmd VimLeave * silent !echo -ne "\033]112\007"
"    " use \003]12;gray\007 for gnome-terminal
" endif

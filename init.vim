"load external files

set wildmode=longest,list,full
set wildmenu

if !exists('g:vscode')

call plug#begin('~/.vim/plugged')
  

Plug 'terrortylor/nvim-comment'
 
"Visual Mode Moves Code ALT-J/K
Plug 'matze/vim-move'
Plug 'unblevable/quick-scope'
  
"Scrolling"
Plug 'yuttie/comfortable-motion.vim'

"Plug 'prabirshrestha/async.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

  
" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'

" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" telescope requirements"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'sbdchd/neoformat'

"Themes"
Plug 'morhetz/gruvbox'          
Plug 'sainnhe/gruvbox-material'

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'ThePrimeagen/vim-be-good'

"session "
Plug 'rmagatti/auto-session'

Plug 'pwntester/octo.nvim'
" requires
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

""Plug 'folke/which-key.nvim' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'ekalinin/Dockerfile.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'takac/vim-hardtime' "makes you slow down with hjkl
" Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'neovim/nvim-lsp'
" Plug 'ryanolsonx/vim-lsp-typescript'
call plug#end()

lua require("theprimeagen") 

endif

source ~/.vimrc
source ~/.config/nvim/plugin/keymaps.vim

 inoremap ( ()<Esc>i
 inoremap { {}<Esc>i
 inoremap {<CR> {<CR>}<Esc>O
 inoremap [ []<Esc>i
 inoremap < <><Esc>i
 inoremap ' ''<Esc>i
 inoremap " ""<Esc>i

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

set t_Co=256

set termguicolors

if has('nvim')
   tnoremap <Esc> <C-\><C-n>
endif

if !has('nvim')
    set ttymouse=xterm2
endif

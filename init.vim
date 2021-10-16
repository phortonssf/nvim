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



""Plug 'folke/which-key.nvim' 
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
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

lua << EOF
  require'lspconfig'.tsserver.setup{}
EOF

 inoremap ( ()<Esc>i
 inoremap { {}<Esc>i
 inoremap {<CR> {<CR>}<Esc>O
 inoremap [ []<Esc>i
 inoremap < <><Esc>i
 inoremap ' ''<Esc>i
 inoremap " ""<Esc>i

"FireNVIM
if exists('g:started_by_firenvim')
  set laststatus=0 
  let mapleader = "\<Space>"
  "au BufEnter :AirlineToggle<CR>
  set columns=100
  autocmd vimenter * :AirlineToggle <CR>
  au BufEnter github.com_*.txt set filetype=markdown 
  "set laststatus=0
"DISABLE AIRLINE IN FIRENVIM
  let g:airline_section_b = ''
  let g:airline_section_c = ''
  let g:airline_section_y = ''
  
  let g:airline_section_z = ''
  
  set guifont=CaskaydiaCove\ NF:h18
  
  " let g:airline#extensions#tabline#enabled = 0
  " let airline#extensions#tabline#show_buffers = 0
  
  let g:firenvim_config = {
    \ 'globalSettings': {
        \ '<C-w>': 'noop',
        \ '<C-n>': 'default',
    \ 'ignoreKeys': {
        \ 'all': ['<C-v>']
        \}
    \ }
\ }
  
else
  set laststatus=2
endif
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction 

" function! OnUIEnter(event) abort
"   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
"     set wrap linebreak nolist
"     set laststatus=0
"     set lines=30
"     set columns=100
"   endif
" endfunction
function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
   " autocmd VimResized * :wincmd =
    set lines=20
    set columns=100
  endif
endfunction

autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

set t_Co=256

set termguicolors

"Sets Color for vim, not airline
autocmd vimenter * colorscheme gruvbox-material

if has('nvim')
   tnoremap <Esc> <C-\><C-n>
endif

if !has('nvim')
    set ttymouse=xterm2
endif

let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_typescript_prettier= {
     \ 'exe': 'prettier',
      \ 'args': ['--write --single-quote --trailing-comma es5 --no-bracket-spacing --no-semi --print-width 70'],
      \ 'replace': 1
      \ }
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


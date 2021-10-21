

set shell=/bin/zsh
set clipboard=unnamedplus
set sessionoptions+=globals
"Search Settings
set incsearch
set nohlsearch
set hidden
set noerrorbells
set expandtab
set encoding=utf-8

" **** Line Numbers
"Line numbers relative
set relativenumber
"Current Line
set nu
set rnu
set signcolumn=yes
set nowrap
set cursorline

" Searching
set smartcase
set incsearch

" Space setting
set list
set shiftround
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set smarttab

" Caching buffers 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"scroll before hitting bottom
set scrolloff=8
set ttimeoutlen=50

" first, enable status line always
set laststatus=2
set background=dark

" Format on paste
set pastetoggle=<F2>
set noshowmode
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" set guicursor+=i:block-Cursor-blinkon1-iCursor"
  " Cursor in terminal
  " https://vim.fandom.com/wiki/Configuring_the_cursor
  " 1 or 0 -> blinking block
  " 2 solid block
  " 3 -> blinking underscore
  " 4 solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
    
  " if &term =~ '^xterm'
  "   " normal mode
  "   let &t_EI .= "\<Esc>[0 q"
  "   " insert mode
  "   let &t_SI .= "\<Esc>[6 q"
  " endif

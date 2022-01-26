:set shell=/bin/zsh
set clipboard=unnamedplus
set sessionoptions+=globals

" Nice menu when typing `:find *.py`
set wildmode=longest,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set smarttab

" Caching buffers
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"scroll before hitting bottom
set scrolloff=8
set ttimeoutlen=600
set timeoutlen=350
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
set jumpoptions+=stack  " endif

" adds _ to word delmiter
 set iskeyword-=_

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
set nocompatible
syntax on
filetype plugin indent on
" External program to use for grep command
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

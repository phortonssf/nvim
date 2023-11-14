-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.wildmode = "longest,list:full"
vim.opt.wildmenu = true
-- " Ignore files
-- WIP not working for wildmenu
vim.opt.wildignore = "__pycache__"
vim.opt.wildignore:append({ "*.o", "*~", "*.pyc", "*pycache*" })
vim.opt.wildignore:append({ "**/.git/*" })
vim.opt.wildignore:append("Cargo.lock")
vim.opt.wildignore:append("*.pyc")
vim.opt.wildignore:append("*_build/*")
vim.opt.wildignore:append("**/coverage/*")
vim.opt.wildignore:append("**/node_modules/*")
vim.opt.wildignore:append("**/android/*")
--
-- "Search Settings
vim.opt.wildignore:append("**/ios/*")
vim.opt.incsearch = true
--vim.opt.nohlsearch
--vim.opt.hidden = true
--vim.opt.noerrorbells
vim.opt.expandtab = true
vim.opt.encoding = "UTF-8"
--
-- " **** Line Numbers
-- "Line numbers relative
vim.opt.relativenumber = true
-- "Current Line
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorline = true
--
-- " Searching
vim.opt.smartcase = true
vim.opt.incsearch = true
--
-- " Space setting
vim.opt.list = true
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
--
-- " Caching buffers
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir =~ "/.vim/undodir"
vim.opt.undofile = true
-- "scroll before hitting bottom
vim.opt.scrolloff = 8
vim.opt.ttimeoutlen = 600
vim.opt.timeoutlen = 300
-- " first, enable status line always
vim.opt.laststatus = 2
vim.opt.background = dark
--
-- " Format on paste
vim.opt.pastetoggle = "<F2>"
vim.opt.showmode = false
-- " Give more space for displaying messages.
vim.opt.cmdheight = 2
--
-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
vim.opt.updatetime = 50
--
--
-- " Don't pass messages to |ins-completion-menu|.
-- set shortmess+=c
--
-- " set guicursor+=i:block-Cursor-blinkon1-iCursor"
--   " Cursor in terminal
--   " https://vim.fandom.com/wiki/Configuring_the_cursor
--   " 1 or 0 -> blinking block
--   " 2 solid block
--   " 3 -> blinking underscore
--   " 4 solid underscore
--   " Recent versions of xterm (282 or above) also support
--   " 5 -> blinking vertical bar
--   " 6 -> solid vertical bar
--
--   " if &term =~ '^xterm'
--   "   " normal mode
--   "   let &t_EI .= "\<Esc>[0 q"
--   "   " insert mode
--   "   let &t_SI .= "\<Esc>[6 q"
-- set jumpoptions+=stack  " endif
--
-- " adds _ to word delmiter
--  set iskeyword-=_
-- " set hlsearch
-- " set statusline+=%#warningmsg#
-- " set statusline+=%{SyntasticStatuslineFlag()}
-- " set statusline+=%*
--
-- " let g:syntastic_always_populate_loc_list = 1
-- " let g:syntastic_auto_loc_list = 1
-- " let g:syntastic_check_on_open = 1
-- " let g:syntastic_check_on_wq = 0
--
-- " (Optional)Remove Info(Preview) window
-- set completeopt-=preview
-- " (Optional)Hide Info(Preview) window after completions
-- autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
-- autocmd InsertLeave * if pumvisible() == 0|pclose|endif
--
-- " (Optional) Enable terraform plan to be include in filter
-- let g:syntastic_terraform_tffilter_plan = 1
--
-- " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
-- let g:terraform_completion_keys = 1
--
-- " (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
-- let g:terraform_registry_module_completion = 0
-- set nocompatible
-- syntax on
vim.api.nvim_command("filetype on")
vim.api.nvim_command("filetype plugin on")
-- vim.opt.filetype.
-- filetype plugin indent on:h
-- " External program to use for grep command
-- if executable('rg')
--     set grepprg=rg\ --vimgrep
--     set grepformat=%f:%l:%c:%m
-- endif
-- vim.opt.tabline=%H/%f--
--vim.opt.grepformat = "%f:%l:%c:%m"
--vim.opt.grepprg = "rg\ --vimgrep"
function Tabline()
  local path = vim.fn.expand("%:h:t") .. "/" .. vim.fn.expand("%:t")
  return path
end

vim.opt.showtabline = 2
-- vim.opt.tabline=vim.fn.expand('%:h:t') .. '/' .. vim.fn.expand(%:t')
vim.opt.tabline = "%H/%t"
-- " auto cd to set CWD to current buffer
vim.opt.autochdir = false
-- Gives code blocks
-- vim.opt.shell = "/bin/bash"
-- vim.opt.shell = os.getenv("SHELL")
-- If the current system shell or the `shell` option is set to /usr/bin/fish then revert to sh
if os.getenv("SHELL") == "/usr/bin/fish" or vim.opt.shell == "/usr/bin/fish" then
  vim.opt.shell = "/bin/sh"
else
  -- Else default to the system current shell.
  vim.opt.shell = os.getenv("SHELL")
end
vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
vim.opt.nu = true
vim.opt.relativenumber = true
-- set shell=/bin/bash
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Gutter settings
vim.opt.signcolumn = "yes:1"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.splitright = true

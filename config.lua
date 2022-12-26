-- doom_config - doom nvim user configurationsfile
-- this file contains the user-defined configurations for doom nvim.
-- just override stuff in the `doom` global table (it's injected into scope
-- automatically).
-- vim.opt.
--local tp = require("telescope")
-- vim.opt.shell=/bin/zsh
-- vim.opt.clipboard+=unnamedplus
-- vim.opt.sessionoptions+=globals
-- vim.opt.splitright = true
--vim.opt.wcm = "<>"
-- " Nice menu when typing `:find *.py`
vim.opt.wildmode="longest,list:full"
vim.opt.wildmenu = true
-- " Ignore files
vim.opt.wildignore = "__pycache__"
vim.opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
vim.opt.wildignore:append "Cargo.lock"
vim.opt.wildignore:append "*.pyc"
vim.opt.wildignore:append "*_build/*"
vim.opt.wildignore:append "**/coverage/*"
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/android/*"
vim.opt.wildignore:append "**/ios/*"
vim.opt.wildignore:append "**/.git/*"
--
-- "Search Settings
vim.opt.incsearch = true
--vim.opt.nohlsearch
--vim.opt.hidden = true
--vim.opt.noerrorbells
vim.opt.expandtab = true
vim.opt.encoding = "utf-8"
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
vim.opt.list = true vim.opt.shiftround = true
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
vim.opt.timeoutlen = 350
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
-- filetype plugin indent on
-- " External program to use for grep command
-- if executable('rg')
--     set grepprg=rg\ --vimgrep
--     set grepformat=%f:%l:%c:%m
-- endif
--
-- " auto cd to set CWD to current buffer
 vim.opt.autochdir = false
-- Gives code blocks
vim.opt.shell = "/bin/bash"
vim.g.markdown_fenced_languages = {"html", "javascript", "typescript", "css", "scss", "lua", "vim"}
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
-- vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.mapleader = " "
-- adding a package
doom.use_package(
  { "tpope/vim-fugitive"},
  {"nvim-telescope/telescope-fzy-native.nvim"},
  { "nvim-telescope/telescope-live-grep-args.nvim"},
  { "sainnhe/gruvbox-material"},
  { "sainnhe/sonokai"},
  -- {"kylechui/nvim-surround"},
  {'folke/tokyonight.nvim'},
  { "catppuccin/nvim", as = "catppuccin" },
  { "ellisonleao/gruvbox.nvim"},
  {'luisiacc/gruvbox-baby'},
  {'andymass/vim-matchup'},
  { "terrortylor/nvim-comment"},
  { "karb94/neoscroll.nvim"},
  { "gelguy/wilder.nvim"},
  { "p00f/nvim-ts-rainbow"},
  { "edluffy/specs.nvim"},
  { "nvim-treesitter/nvim-treesitter-context"},
  { 'mbbill/undotree'},
  { "nvim-telescope/telescope-ui-select.nvim"},
  { "kevinhwang91/nvim-bqf"},
  { 'wellle/targets.vim'},
  { 'andymass/vim-matchup'},
  { 'ThePrimeagen/vim-be-good'},
  { "olimorris/persisted.nvim"},
  { 'junegunn/fzf'}
)
 require("nvim_comment").setup()
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--  end
-- })
-- okay
doom.colorscheme = "catppuccin-frappe"
local lsp = doom.features.lsp
-- lsp.settings.virtual_text = false
-- vim.cmd([[ colorscheme gruvbox-material ]])
local l = "<leader>"
local c = "<cmd>"
-- or nest.nvim
 doom.use_keybind({
 -- COMMANd
  {mode = "t", {
    {'<esc>', '<c-\\><c-n'}
  }},
   { mode = "c",
    options = {
      noremap = true,
      silent = false
    },
    {"<C-Q>","<C-e><C-u><Esc>"}
  },
-- ESPRESSIONS!!!!
  {mode = 'n', {
   options = {
      noremap = true,
      silent = true,
      expr = true
    },
    -- open fold if on fold only
    -- {"<space>",function()  local x = vim.v.foldlevel if (x == 0) then return "<CMD><Space><CR>" else return "<CMD>norm!za<CR>" end end },

    -- adds marsk so larg j and k movements are in jumplist
    {'k', function()
      if (vim.v.count > 5) then return "m'" .. vim.v.count .. 'k' else return 'k' end end},
    {'j', function()
      if (vim.v.count > 5) then return "m'" .. vim.v.count .. 'j' else return 'j' end end}
   -- {'k', function() if (v.count > 5) then return "m'" .. v.count .. 'k' else return "k" end }
  }},
  -- { mode = "c",
  --   options = {
  --
  --      expr = true
  --   },
  --   {"<C-p>", function() return vim.fn.pumvisible() == 1 and "<Left>" or "<C-p>" end},
  --   {"<C-n>", function() return vim.fn.pumvisible() == 1 and "<Right>" or "<C-n>" end},
  -- },
  --ALL MODES
  { mode = "nv", {
    options = {
      noremap = true,
      silent = true
    },
    -- black hole register
    { l .. "d", '"+d' },
    { "d",'"_d' },
    { "c",'"_c' },
    { "x",'"_x' },
    { "<c-_>",":CommentToggle<cr>" },
  }},
  -- VISUAL
   { mode = "v",
    options = {
      noremap = true,
      silent = true
    },
    { l .. 'p', '"_dP'},
    {'>', ">gv"},
    {'<', "<gv"}
  },
-- INSERT MODE
  { mode = "i",
    options = {
      noremap = true,
      silent = true
    },

    {"<C-t>", "<Ctrl-x><Ctrl-]"},
    --more undo markers
    { "jj", "<esc>" },
    { "kk", "<esc>" },
    {" ,"," <c-g>u"},
    {" `"," `<c-g>u"},
    {" {"," {<c-g>u"},
    {" )"," )<c-g>u"},
    {" ]"," ]<c-g>u"},
    {" ."," .<c-g>u"},
    {" !"," !<c-g>u"},
    {" &"," &<c-g>u"},
    {" +"," +<c-g>u"},
    {" -"," -<c-g>u"},
    {" ?"," ?<c-g>u"},
    {" }"," }<c-g>u"},
    {" :"," :<c-g>u"},
    {" ;"," ;<c-g>u"},
    {" ="," =<c-g>u"},
    {" <bslash>","<bslash><c-g>u"},
    {" <fslash>", "<fslash><c-g>u"},
    {" <space>"," <space><c-g>u"},
    {" <c-v>", "<c-r>+"},
  },
  -- NORMAL MODE
  { mode = "n",
    options = {
      silent = true,
      noremap = true
    },
    { "s", "<Nop>"},
    { l ..'d%', "<cmd> norm! %x`'x<CR>"},
    --close buffer but go back to prev
    {"<C-x>" , ":bp<Bar>bd #<Cr>"},
    {"<C-s>", ":w<cr>"},
-- Leader + o to add space normal mode
      {"<leader>o","<S-i><CR><esc>k"},
-- Prime binds center on scroll"
    {'n', 'nzzzv', name = 'Better center'},
    {'N', 'Nzzzv', name = 'Better center'},
    {"J", 'mzJ`z'},

-- undo last write
{"U", ":ea 1f<CR>  | :echo 'Undo until last write'<CR>", name = "Undo to Last Write" },
    -- quit all
    {"<C-Q>", "<Esc>:quitall<CR>"},
    {"<leader>x", ":bd!<CR>", name = " Close !!!"},
-- -help word under cursor
    { "<leader>hw", ":help <C-r><C-w><CR>", name = "Help Word Under Current" },
    --u
      {"<leader><space>", "i<space><esc>", name = "Name add space"},
    {'<leader>vpi' , '".p',  name = "Paste Last Insert"},
    { 'vp', "`[v`]", name = "Highlight last paste"},
    {'Q', "@q" , name = "Play q macro"},
    { l .. '<CR>', '$o<esc>'},
    {'<leader>p','o<Esc>p', name = "Paste over visual"},
    { "vv", "V" },
    { "V", "vg_" },
    { "<C-p>", c .. "Telescope git_files<cr>", name = "find git files" },
    { "<c-j>", ":bnext<cr>" , name = "Next Buffer"},
    { "<c-k>", ":bprev<cr>" , name = "Prev Buffer"},
    { l .. "x", c .. "bd<cr>" , name = "Close buffer"},
    { l .. "x", c .. "bd<cr>" },
  },
  {
    "<leader>u",
    name = "+user",
    {  { "s", "<cmd>Telescope git_status<cr>", name = " status" }, -- adds `<leader>us` keybind to trigger `telescope git_status`
    },
  },
  { l .. 'T', "<cmd>Telescope<CR>"},
  { "<leader>g", name = "+git", {
    { "s", "<cmd>G<cr>" },
    { "c", "<cmd>G commit<cr>" },
  }},
  { l .. 'h', name = "+help",{
       {'w', '<cmd>help <C-r><C-w><CR>' }
  }},
  {
    l .. "f",
    name = "+file",
    {
      { "g", c .. "Telescope git_files<cr>", name = "find git files" },
    },
  },
})
local wk = require("which-key.plugins.presets")
wk.operators["g"] = nilu

-- print(vim.inspect(whichkey))
-- adDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

-- vim: sw=2 sts=2 ts=2 expandtab

-- doom_config - doom nvim user configurationsfile
-- this file contains the user-defined configurations for doom nvim.
-- just override stuff in the `doom` global table (it's injected into scope
-- automatically).

--local tp = require("telescope")


-- adding a package
doom.use_package(
  { "tpope/vim-fugitive"},
  { "nvim-telescope/telescope-live-grep-args.nvim"},
  { "sainnhe/gruvbox-material"},
  { "sainnhe/sonokai"},
  {'folke/tokyonight.nvim'},
  { "catppuccin/nvim", as = "catppuccin" },
  { "ellisonleao/gruvbox.nvim"},
  {'luisiacc/gruvbox-baby'},
  {'andymass/vim-matchup'},
  { "terrortylor/nvim-comment"},
  { "karb94/neoscroll.nvim"},
  { "gelguy/wilder.nvim"},
  { "kylechui/nvim-surround"},
  { "p00f/nvim-ts-rainbow"},
  { "edluffy/specs.nvim"},
  { "nvim-treesitter/nvim-treesitter-context"},
  { "kylechui/nvim-surround"},
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

doom.colorscheme = "catppuccin-frappe"
local lsp = doom.features.lsp
-- lsp.settings.virtual_text = false
-- vim.cmd([[ colorscheme gruvbox-material ]])
local l = "<leader>"
local c = "<cmd>"
-- or use nest.nvim
doom.use_keybind({
  -- COMMAND
  { mode = "c",
    options = {
      noremap = true,
      silent = false
    },
    {"<C-Q>","<C-e><C-u><Esc>"}
  },
  { mode = "c",
    options = {
       silent = false,
       expr = true
    },
    {"<C-p>", function() return vim.fn.pumvisible() == 1 and "<Left>" or "<C-p>" end},
    {"<C-n>", function() return vim.fn.pumvisible() == 1 and "<Right>" or "<C-n>" end},
  },
  --ALL MODES
  { mode = "nvx", {
    options = {
      noremap = true,
      silent = true
    },
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
    { l .. 'p', '"_dP'}
  },
-- INSERT MODE
  { mode = "i",
    options = {
      noremap = true,
      silent = true
    },
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
    { "<space><space>", "i<space><esc>"},
    { l .. '<CR>', '$o<esc>'},
    {'<leader>p','o<Esc>p'},
    { "vv", "V" },
    { "V", "vg_" },
    { "<C-p>", c .. "Telescope git_files<cr>", name = "find git files" },
    { "<c-j>", ":bnext<cr>" },
    { "<c-k>", ":bprev<cr>" },
    { l .. "x", c .. "bd<cr>" },
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

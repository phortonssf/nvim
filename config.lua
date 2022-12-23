-- doom_config - Doom Nvim user configurationsfile
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
 doom.use_package(
  "tpope/vim-fugitive",
  "sainnhe/gruvbox-material",
  "sainnhe/sonokai",
  "terrortylor/nvim-comment"
)
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })
-- ADDING A KEYBIND
vim.cmd [[ colorscheme gruvbox-material ]]
local L = '<leader>'
local C = '<cmd>'
doom.use_keybind({
  { mode = 'i',
    { 'jj', '<esc>'},
    { 'kk', '<esc>'}
  },
  { mode = 'n',
    { '<C-j>', ":bnext<CR>"},
    { '<C-k>',  ":bprev<CR>"},
    {'<C-_>', ":CommentToggle<CR>"}
  },
  {L .. 'x', C .. "bd<CR>" },
  {L .. 'X', C .. "bd<CR>" },

  { '<leader>u', name = '+user', { -- Names this group in whichkey "+user"
    { 's', '<cmd>Telescope git_status<CR>', name = 'Git status' } -- Adds `<leader>us` keybind to trigger `Telescope git_status`
  }},
  {'<leader>g', name = '+git',{
    {'s', '<cmd>Git<CR>'}
  }},
})
require('nvim_comment').setup()
-- ADDING A COMMAND
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

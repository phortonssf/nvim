-- doom_config - Doom Nvim user configurationsfile
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
-- doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })
-- ADDING A KEYBIND
local lsp = doom.features.lsp
lsp.settings.virtual_text = false
doom.use_keybind({
  { mode = 'i',
    { 'jj', '<esc>'},
    { 'kk', '<esc>'}
  },
  { '<leader>u', name = '+user', { -- Names this group in whichkey "+user"
    { 's', '<cmd>Telescope git_status<CR>', name = 'Git status' } -- Adds `<leader>us` keybind to trigger `Telescope git_status`
  }},
  {  name = '+buffer', { -- Names this group in whichkey "+user"
    { '<C-j>',':bprev', name = 'Prev Buffer' }
  }},

})

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

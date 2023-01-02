--require('digitaldive.disable-builtin')
--require('digitaldive.globals')
--require('digitaldive.sets')
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--vim.cmd [[colorscheme catppuccin]]
-- require('digitaldive.packer')
require("config.sets")
--require("config.keymaps")
require("config.globals")
require("config.lazy")
--require("digitaldive.keymaps")

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    --  require("util").version()
    --  require("config.autocmds")
    -- require("config.keymaps")
  end,
})
--require('nvim_comment').setup()
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
--require('indent_blankline').setup {
-- char = '┊',
-- show_trailing_blankline_indent = false,
--}

-- require'navigator'.setup()
-- require('neoscroll').setup()
-- require'mind'.setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

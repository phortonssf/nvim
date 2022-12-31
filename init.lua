-- Install packer
vim.opt.runtimepath:append(',~/.local/share/nvim/site')
-- vim.api.nvim_command('set runtimepath^=~/.local/share/nvim/site')
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end


require('digitaldive.globals')
require('digitaldive.sets')
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

vim.cmd [[colorscheme catppuccin]]
require('digitaldive.packer')
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('nvim_comment').setup()
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- NEO ROOOT
local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }
-- vim.cmd'au BufEnter * NeoRoot'
vim.keymap.set('n', '<Leader>cd', function() vim.cmd('NeoRootSwitchMode') end, NOREF_NOERR_TRUNC)
vim.keymap.set('n', '<Leader>pre', function() vim.cmd('NeoRootChange') end, NOREF_NOERR_TRUNC)

-- require'navigator'.setup()
require('neoscroll').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
--
--
-- vim: ts=2 sts=2 sw=2 et

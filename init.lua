-- bootstrap lazy.nvim, LazyVim and your plugins
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.cmdheight = 2 -- This is the extra config I added
if vim.g.vscode then
  vim.opt.cmdheight = 2 -- this is the new line I addejjk
  return
end
require("config.lazy")

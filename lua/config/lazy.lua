local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
  "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup("digitaldive.plugins", {
  defaults = { lazy = false},
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = true },
--  diff = {
 --   cmd = "terminal_git",
 -- },
  performance = {
    cache = {
      enabled = false,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    custom_keys = {

      ["<localleader>d"] = function(plugin)
        dd(plugin)
      end,
    },
  },
  debug = false,
})

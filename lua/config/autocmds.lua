-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = augroup("numberline"),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
---- this is to fix bug: https://github.com/folke/which-key.nvim/issues/476
-- vim.api.nvim_create_autocmd("FileType", {
--   desc = "Set up neorg Which-Key descriptions",
--   group = vim.api.nvim_create_augroup("neorg_mapping_descriptions", { clear = true }),
--   pattern = "fugitive",
--   callback = function()
--     vim.keymap.set("n", "<localleader>", function()
--       require("which-key").show(",")
--     end, { buffer = true })
--   end,
-- })
--

local M = {
  "nyngwang/NeoRoot.lua",
}

function M.config() end

require("neo-root").setup({
  CUR_MODE = 2, -- 1 for file/buffer mode, 2 for proj-mode
})
vim.cmd("au BufEnter * NeoRoot")

vim.keymap.set("n", "<Leader>p", function()
  vim.cmd("NeoRootSwitchMode")
end, NOREF_NOERR_TRUNC)

vim.keymap.set("n", "<Leader>pre", function()
  vim.cmd("NeoRootChange")
end, NOREF_NOERR_TRUNC)

return M

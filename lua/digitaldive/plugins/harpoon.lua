local M = { "ThePrimeagen/harpoon" }

-- vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
function M.config()
  -- vim.api.nvim_set_keymap("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
  require("harpoon").setup()
end

return M

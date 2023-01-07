local M = {
  "Wansmer/treesj",
  -- lazy = true,
  keys = {
    { "J", "<cmd>TSJToggle<cr>" },
  },
  --   config = { use_default_keymaps = false },
}

function M.config()
  require("treesj").setup({ use_default_keymaps = false })
end

return M

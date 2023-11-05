local M = {
  "ThePrimeagen/refactoring.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
M.config = function()
  local wk = require("which-key")
  require("telescope").load_extension("refactoring")

  vim.keymap.set({ "n", "x" }, "<leader>rr", function()
    require("telescope").extensions.refactoring.refactors()
  end)

  -- normal mode mappings
  wk.register({
    ["<leader>r"] = {
      name = "+refactor",
      ["p"] = { "<cmd>lua require('refactoring').debug.printf({ below = false })<cr>", "Print" },
      ["l"] = { "<cmd>lua require('refactoring').debug.print_var({ below = false })<cr>", "Log Var" },
      ["c"] = { "<cmd>lua require('refactoring').debug.cleanup({})<cr>", "Clean Up" },
      ["i"] = { "<cmd>Refactor inline_var<cr>", "Inline Replace Var" },
      ["v"] = { "Extract Var" },
      ["e"] = { "Extract Function" },
    },
  })

  vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
  require("refactoring").setup()
  vim.keymap.set("x", "<leader>re", function()
    require("refactoring").refactor("Extract Function")
  end)
  -- vim.keymap.set("x", "<leader>rf", function()
  --   require("refactoring").refactor("Extract Function To File")
  -- end)
  -- Extract function supports only visual mode
  -- vim.keymap.set("x", "<leader>rV", function()
  --   require("refactoring").refactor("Extract Variable")
  -- end)
  -- vim.keymap.set("n", "<leader>rI", function()
  --   require("refactoring").refactor("Inline Function")
  -- end)
  -- -- Inline func supports only normal
  -- vim.keymap.set({ "n", "x" }, "<leader>ri", function()
  --   require("refactoring").refactor("Inline Variable")
  -- end)
  -- -- Inline var supports both normal and visual mode
  --
  -- vim.keymap.set("n", "<leader>rb", function()
  --   require("refactoring").refactor("Extract Block")
  -- end)
  -- vim.keymap.set("n", "<leader>rbf", function()
  --   require("refactoring").refactor("Extract Block To File")
  -- end)

  -- Print var

  -- vim.keymap.set({ "x", "n" }, "<leader>rv", function()
  --   require("refactoring").debug.print_var()
  -- end)
  -- Supports both visual and normal mode

  vim.keymap.set("n", "<leader>rc", function()
    require("refactoring").debug.cleanup({})
  end)
end
return M

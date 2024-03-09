return {
  "sindrets/diffview.nvim",
  Event = "VeryLazy",
  keys = {
    { "<leader>gd", "<cmd>DiffviewFileHistory % <cr>", desc = "Diffview Current File" },
    { "<leader>gD", "<cmd>DiffviewFileHistory <cr> ", desc = "Diffview Current Branch" },
  },
}

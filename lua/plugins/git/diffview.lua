return {
  "sindrets/diffview.nvim",
  lazy = false,
  keys = {
    { "<leader>gd", "<cmd>DiffviewFileHistory % <cr>", desc = "Diffview Current File" },
    { "<leader>gD", "<cmd>DiffviewFileHistory <cr> ", desc = "Diffview Current Branch" },
    { "<leader>qd", "<cmd>DiffviewClose <cr>", desc = "Close DiffView" },
  },
  opts = {
    view = {
      file_history = {
        winbar_info = true,
      },
    },
    default_args = {
      DiffviewOpen = { "--untracked-files=no", "--imply-local" },
      DiffviewFileHistory = { "--base=LOCAL" },
    },
  },
}

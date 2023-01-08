local M = {
  "folke/which-key.nvim",
  lazy = true,
}

function M.config()
  local wk = require("which-key")
  wk.setup({
    leader = " ",
    plugins = {
      marks = false,
      registers = false,
      presets = {
        operators = false,
        -- motions = true,
        text_objects = true,
        windows = true,
        -- nav = true,
        -- z = true,
        g = true,
      },
    },
    operators = {
      -- d = "Delete",
      -- c = "Change",
      -- y = "Yank (copy)",
      ["g~"] = "Toggle case",
      ["gu"] = "Lowercase",
      ["gU"] = "Uppercase",
      [">"] = "Indent right",
      ["<lt>"] = "Indent left",
      ["zf"] = "Create fold",
      ["!"] = "Filter though external program",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    window = {
      padding = { 0, 0, 0, 0 },
      border = "single",
    },
    layout = {
      height = { min = 1, max = 10 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = true,
    hidden = {
      "<silent>",
      "<Cmd>",
      "<cmd>",
      "<Plug>",
      "call",
      "lua",
      "^:",
      "^ ",
    },
    show_help = true,
    triggers = "auto",

    show_help = false,
    triggers = "auto",
    plugins = { spelling = true },
    key_labels = { ["<leader>"] = "SPC" },
  })
  wk.register({
    ["<leader>g"] = { name = "+git", h = { name = "+hunk" } },
  })
end
return M

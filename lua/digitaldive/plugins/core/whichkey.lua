local M = {
  "folke/which-key.nvim",
  lazy = true,
}

function M.config()
  local wk = require("which-key")
  wk.setup({
    leader = " ",
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = false,
        -- motions = true,
        text_objects = true,
        windows = true,
        -- nav = true,
        z = true,
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
      -- ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    window = {},
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

    triggers_blacklist = {
      i = { "j", "k" },
    },
    disable = {
      -- filetypes = { "fugitive" },
    },
    show_help = false,
    triggers = "auto",
    -- key_labels = { ["<leader>"] = "SPC" },
  })
  wk.register({
    ["`"] = {
      name = "+marks",
      ["<"] = { "jump to beginning/end of last visual selection" },
      [">"] = { "end of last visual selection" },
    },
    ["<leader>g"] = {
      name = "+git",
      -- hb
      b = { "Git Blame" },
      l = { ":Gitsigns toggle_current_line_blame<CR>", "Cur Line Blame" },
      R = { "Reset Buffer" },
      S = { "Stage Buffer" },
      h = {
        name = "+hunk",
        p = { "Preview Hunk" },
        U = { "Undo Stage Hunk" },
        s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
        R = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
      },
    },
  })
end
return M

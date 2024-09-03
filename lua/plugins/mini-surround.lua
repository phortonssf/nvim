return {
  "kylechui/nvim-surround",
  -- vim.keymap.set("n", "s", "<nop>")
  opts = {
    keymaps = {
      insert = "<c-g>s",
      insert_line = "<c-g>sl",
      normal = "sa",
      normal_cur = "sl",
      normal_line = "yss",
      normal_cur_line = "sal",
      visual = "sa",
      visual_line = "sal",
      delete = "ds",
      change = "cs",
    },
    aliases = {
      ["a"] = ">",
      ["p"] = ")",
      ["c"] = "}",
      ["b"] = "]",
      ["q"] = { '"', "'", "`" },
      ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    move_cursor = false,
  },
}

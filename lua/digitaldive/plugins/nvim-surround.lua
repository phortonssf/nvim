local M = { "kylechui/nvim-surround" }

function M.config()
  vim.keymap.set("n", "s", "<Nop>")
  require("nvim-surround").setup({
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "s",
      normal_cur = "sl",
      normal_line = "ySS",
      normal_cur_line = "sal",
      visual = "s",
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
  })
end

return M

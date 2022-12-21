require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
   keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "S",
        normal_cur = "Sll",
        normal_line = "So",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "SL",
        delete = "ds",
        change = "cs",
    },
  aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
})

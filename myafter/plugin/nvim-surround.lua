    require("nvim-surround").setup({
    keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "s",
        normal_cur = "sl",
        normal_line = "sal",
        normal_cur_line = "ySS",
        visual = "s",
        visual_line = "sal",
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
        move_cursor = false
    })

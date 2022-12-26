require("nvim-mapper").setup({
    -- do not assign the default keymap (<leader>MM)
    no_map = false,
    -- where should ripgrep look for your keybinds definitions.
    -- Default config search path is ~/.config/nvim/lua
    search_path = os.getenv("HOME") .. "/.config/nvim/lua",
    -- what should be done with the selected keybind when pressing enter.
    -- Available actions:
    --   * "definition" - Go to keybind definition (default)
    --   * "execute" - Execute the keybind command
    action_on_enter = "definition",
})

-- The same using nvim-mapper
Mapper = require("nvim-mapper")
Mapper.map('n', '<leader>P', ":MarkdownPreview<CR>", {silent = true, noremap = true}, "Markdown", "md_preview", "Search Key Maps")
Mapper.map_virtual("o", "af", "", {}, "Navigation", "treesitter_function_outer", "Function outer motion")
Mapper.map_virtual("o", "if", "", {}, "Navigation", "treesitter_function_inner", "Function inner motion")
Mapper.map_virtual("o", "ac", "", {}, "Navigation", "treesitter_class_outer", "Class outer motion")
Mapper.map_virtual("o", "ic", "", {}, "Navigation", "treesitter_class_inner", "Class inner motion")

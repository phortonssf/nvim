if not pcall(require, "telescope") then
  return
end

local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
        },
    path_display = {
       "smart"
    },
    hidden_files = true,
        initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    prompt_prefix = "   ",
    layout_config = {
      width = 0.75,
      preview_cutoff = 20,
      prompt_position = "top",
      vertical = { mirror = false },
      horizontal = {
        preview_cutoff = 10,
        mirror = false,
        preview_width = 0.33
      },
    },
    file_ignore_patterns = { "^%.git/", "^node_modules/", "^__pycache__/" },
    winblend = 0,
    scroll_strategy = "cycle",
    border = {},
    borderchars = {
      "─",
      "│",
      "─",
      "│",
      "╭",
      "╮",
      "╯",
      "╰",
    },
     history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<CR>"] = actions.select_default + actions.center, -- Currently breaks telescope-file-browser
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    }
  },
  pickers = {

    find_files = {
    -- I don't like having the cwd prefix in my files

    layout_strategy = "vertical",
    mappings = {
        i = {
          ["<c-c>"] = require('telescope.actions').close,
        },
      n = {
        ["<c-c>"] = require('telescope.actions').close,
        ["jk"] = "close",
      },
    },
  },},
  extensions = {
    frecency = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.75,
          prompt_position = "top",
          vertical = { mirror = false },
          horizontal = {
            mirror = false,
            preview_width = 0
          },
        }}
    }
  }
}
local extensions = {
  'fzf',
  'live_grep_args',
  'dir-telescope',
  'frecency'
}

for _, ext in ipairs(extensions) do
  pcall(require('telescope').load_extension,  ext)
end

-- -- if vim.fn.executable "gh" == 1 then
--   pcall(require("telescope").load_extension, "gh")
--   pcall(require("telescope").load_extension, "octo")
-- end

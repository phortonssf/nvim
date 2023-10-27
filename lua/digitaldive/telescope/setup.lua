if not pcall(require, "telescope") then
  return
end

local actions = require("telescope.actions")
local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end
require("telescope").setup({
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
      "--hidden",
    },
    path_display = {
      "smart",
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
        preview_width = 0.33,
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
        ["<CR>"] = select_one_or_multi,
        -- ["<CR>"] = actions.select_default + actions.center, -- Currently breaks telescope-file-browser
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

        ["<CR>"] = select_one_or_multi,
      },
    },
  },
  pickers = {

    find_files = {
      -- I don't like having the cwd prefix in my files

      layout_strategy = "vertical",
      mappings = {
        i = {
          ["<c-c>"] = require("telescope.actions").close,
        },
        n = {

          -- ["<CR>"] = select_one_or_multi,
          ["<c-c>"] = require("telescope.actions").close,
          ["jk"] = "close",
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end,
        },
      },
    },
  },
  extensions = {
    live_grep_args = {},
    frecency = {
      mappings = {
        i = {
          ["<CR>"] = select_one_or_multi,
          ["<c-c>"] = require("telescope.actions").close,
        },
        n = {
          ["<CR>"] = select_one_or_multi,
          ["<c-c>"] = require("telescope.actions").close,
          ["jk"] = "close",
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end,
        },
      },
      -- path_display = { "smart" },
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.80,
        preview_width = 0,
      },

      ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules" },
      show_filter_column = { "LSP", "CWD", "FOO" },
      workspaces = {
        ["nvim"] = "/home/digitaldive/.dotfiles/nvim/.config/nvim",
        ["dot"] = "/home/digitaldive/.dotfiles",
        ["tmux"] = "home/digitaldive/.dotfiles/tmux",
        ["projects"] = "/home/digitaldive/projects/",
      },
    },
  },
})
local extensions = {
  "fzf",
  "live_grep_args",
  -- "dir-telescope",
  "frecency",
}

for _, ext in ipairs(extensions) do
  pcall(require("telescope").load_extension, ext)
end

-- -- if vim.fn.executable "gh" == 1 then
--   pcall(require("telescope").load_extension, "gh")
--   pcall(require("telescope").load_extension, "octo")
-- end

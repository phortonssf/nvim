local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<C-r>"] = function(prompt_bufnr)
          local git_root_path =
            require("plenary.job"):new({ command = "git", args = { "rev-parse", "--show-toplevel" } }):sync()[1]
          local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          local finder = current_picker.finder
          if finder.files then
            finder.path = git_root_path
          else
            finder.cwd = git_root_path
          end
          require("telescope._extensions.file_browser.utils").redraw_border_title(current_picker)
          current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
        end
},
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      respect_gitignore = true,
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        ["<c-t>"] = trouble.open_with_trouble
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["<c-t>"] = trouble.open_with_trouble
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

return M


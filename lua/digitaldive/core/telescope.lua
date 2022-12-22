local actions = require("telescope.actions")
local fb_actions = require "telescope".extensions.file_browser.actions
local trouble = require("trouble.providers.telescope")
local lga_actions = require("telescope-live-grep-args.actions")
-- Telescope
require('telescope').setup {
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<c-t>"] = trouble.open_with_trouble
       },
      n = {
        ["<c-t>"] = trouble.open_with_trouble,
        ["<c-c>"] = require('telescope.actions').close
      }
    },
  },
  pickers = {},
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    project = {
      base_dirs = {
        {path = '~/.dotfiles', max_depth = 5},
        {path = '~/projects', max_depth = 5},
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      sync_with_nvim_tree = true, -- default false
    },
     command_palette = {
-- description(mandatory)
-- command(mandatory)
-- insert_mode/normal_mode flag(optional) (indicates that whether you want to be in insert_mode after run the command or not. 1 means: insert mode. everything else is normal mode)
      {"File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ':w' },
        { "save all files (C-A-s)", ':wa' },
        { "quit (C-q)", ':qa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      },
      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting (F12)", ':set hlsearch!' },
      }
    },
    file_browser = {
      path_display = { truncate = 3},
      hijack_netrw = true,
      hidden = true,
      respect_gitignore = true,
      theme = "ivy",
      mappings = {
        ["i"] = {
          ["<C-u>"] = fb_actions.change_cwd,
          ["<C-x>"] = function(prompt_bufnr)
          end
        },
        ["n"] = {
        },
      },
    },
   ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
        width = 0.8,
        previewer = false,
        prompt_title = false,
        borderchars = {
          { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      }
    },
  },
}

require'telescope'.load_extension'repo'
require'telescope'.load_extension('project')
require('telescope').load_extension('command_palette')
require("telescope").load_extension "file_browser"
require("telescope").load_extension("ui-select")
require("telescope").load_extension("yank_history")
require("telescope").load_extension("persisted") -- To load the telescope extension
require("telescope").load_extension("dir")
-- something with getting my commits
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


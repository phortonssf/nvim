SHOULD_RELOAD_TELESCOPE = true
local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD "plenary"
    RELOAD "telescope"
    RELOAD "digitaldive.telescope.setup"
  end
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local M = {}
local map = vim.keymap.set
-- grep_open_files = true,
require("dressing").setup()
local ui = function(message, cb)
  vim.ui.input(
    {prompt = message },
    function(input)
      return cb({search = input,  additional_args = {"--hidden"}})
    end
  )
end
-- FILE SEARCHfS
-- vim.keymap.set(
--   "n",  "<leader>rf",
--   function ()
--    builtin.oldfiles({})
--   end
--   )
-- vim.api.nvim_set_keymap("n", "<leader>rf", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
-- -- map('n', '<leader>tff', function () builtin.find_files({}) end, {desc = ""})
-- -- map("n",  "<leader>rf ", function () builtin.oldfiles() end, {desc = "Search Git Files"}),
-- -- map('n', '<leader>tff', function () builtin.find_files({ hidden=true, search_dirs = { "~/projects", "~/work", "~/.dotfiles/"}}) end, {desc = ""})
-- map('n', '<leader>pf', builtin.find_files, {desc = "Find files"})
-- map('n', '<C-p>', builtin.git_files, {})
-- -- SEARCH STRINGS
-- -- map("n", "<leader>ps", function () builtin.grep_string({ prompt_title = string.format("Search For (%s)", vim.loop.cwd()), hidden = true, search = vim.fn.input("Grep For > ")})end)
--
-- map('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
-- map('n', "<leader>fv", function()
--   ui("Grep Project", builtin.grep_string)
-- end)

function M.grep_string()
  ui("Grep Current CWD", require("telescope.builtin").grep_string)
end

function M.search_all_files()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--no-ignore", "--files" },
  }
end

function M.find_project()
  require("telescope.builtin").find_files {
    prompt_title = "~ project search ~",
    shorten_path = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.80,
      preview_width = 0,
    },
  }
end

function M.git_repo()
   require("telescope.builtin").git_repo {
prompt_title = "~ project search ~",
    shorten_path = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.80,
      preview_width = 0,
    },
  }
end


function M.builtin()
  require("telescope.builtin").builtin()
end
function M.old_files()
  require("telescope").extensions.frecency.frecency(themes.get_ivy {})
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    local has_custom, custom = pcall(require, string.format("digitaldive.telescope.custom.%s", k))

    if M[k] then
      return M[k]
    elseif has_custom then
      return custom
    else
      return require("telescope.builtin")[k]
    end
  end,
})


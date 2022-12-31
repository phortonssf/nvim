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
    {prompt = message, completion = "custom, hello" },
    function(input)
      return cb({
        search = input,
        path_display = "absolute",
        additional_args = function(opts)
         return {"--hidden", "-L"}
       end})
    end
  )
end
-- FILE SEARCHfS
-- vim.api.nvim_set_keymap("n", "<leader>rf", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
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
function M.grep_the_grep()
  ui(" Grep Current CWD", require("telescope.builtin").grep_string)
end

function M.search_all_files()
  require("telescope.builtin").find_files {
    -- //Rg options here for  ff search
   find_command = { "rg", "--no-ignore", "--files" , "--hidden", "-L"},
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

-- function M.find_project()
--   require("telescope.builtin").find_files {
--     prompt_title = "~ project search ~",
--     shorten_path = false,
--     path_display = { "absolute" },
--     layout_strategy = "horizontal",
--     layout_config = {
--       width = 0.80,
--       preview_width = 0,
--     },
--   }
-- end

function M.files()
   require("telescope.builtin").files {
prompt_title = "~ project search ~",
    cwd = vim.loop.CWD(),
    shorten_path = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.80,
      preview_width = 0,
    },
  }
end

function _G.Cword()
    return vim.fn.expand("<cword>")
end
function M.my_grep()
  local cword = vim.fn.expand("<cword>")
  require("telescope.builtin").live_grep({
    default_text = cword,
    additional_args = function ()
      return {"--hidden"}
    end
  --   on_complete = cword ~= "" and {
  --     function(picker)
  --       local mode = vim.fn.mode()
  --       local keys = mode ~= "n" and "<ESC>" or ""
  --       vim.api.nvim_feedkeys(
  --         vim.api.nvim_replace_termcodes(keys .. [[^v$<C-g>]], true, false, true),
  --         "n",
  --         true
  --       )
  --       -- should you have more callbacks, just pop the first one
  --       table.remove(picker._completion_callbacks, 1)
  --       -- copy mappings s.t. eg <C-n>, <C-p> works etc
  --       vim.tbl_map(function(mapping)
  --         vim.api.nvim_buf_set_keymap(0, "s", mapping.lhs, mapping.rhs, {})
  --       end, vim.api.nvim_buf_get_keymap(0, "i"))
  --     end,
  --   } or nil,
  })
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


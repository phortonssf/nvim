SHOULD_RELOAD_TELESCOPE = true
local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
  end
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"
local M = {}
function M.search_all_files()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--no-ignore", "--files" },
  }
end

function M.find_project()
  require("telescope.builtin").find_files {
    prompt_title = "~ Project Search ~",
    shorten_path = false,
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.80,
      preview_width = 0,
    },
  }
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    local has_custom, custom = pcall(require, string.format("tj.telescope.custom.%s", k))

    if M[k] then
      return M[k]
    elseif has_custom then
      return custom
    else
      return require("telescope.builtin")[k]
    end
  end,
})


local wk = require("which-key")
if not pcall(require, "telescope") then
  return
end

local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua R('digitaldive.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    local last_key =  string.sub(key, -1)
    local firstkeys = key:sub(1, -2)
    print(last_key)
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    wk.register({

      ['<leader>f'] = {
        name = "+find",
       [last_key] = { rhs, options}
      }
    })
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end


map_tele("<space>fa", "find_project")
map_tele("<space>fi", "search_all_files")

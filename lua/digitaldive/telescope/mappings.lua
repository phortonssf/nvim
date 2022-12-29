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
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    wk.register({

      ['<leader>f'] = {
        name = "+find",
       [last_key] = { rhs, f}
      }
    })
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end
local l = "<leader>f"
map_tele( l .. "s", "grep_the_grep")
map_tele( l .. "T", "builtin")
map_tele( l .. "r", "old_files")
map_tele( l .. "g", "git_files")
-- map_tele("<space>ff", "find_project")
map_tele("<space>ff", "search_all_files")
map_tele( l .. "w", "my_grep")
-- vim.keymap.set("n", l .. "h", my_grep)
--
-- vim.cmd [[
--     function! Cword(A, L, P)
--         return v:lua.Cword()
--     endfunction
-- ]]
--
-- i_input = function()
--   vim.fn.input({
--     prompt = 'Search term: ',
--     completion = 'custom,Cword'
--   })
-- end
-- vim.keymap.set(l .. "w", function()require('telescope.builtin.files').grep_string({search = i_input()}) end)

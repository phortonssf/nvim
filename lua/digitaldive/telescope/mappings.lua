local wk = require("which-key")
if not pcall(require, "telescope") then
  return
end

local sorters = require("telescope.sorters")

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
    local last_key = string.sub(key, -1)
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    wk.register({

      ["<leader>f"] = {
        name = "+find",
        [last_key] = { rhs, f },
      },
    })
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end
local l = "<leader>f"
map_tele(l .. ":", "cmd_history")
map_tele(l .. "s", "grep_the_grep")
map_tele(l .. "T", "builtin")
map_tele(l .. "o", "old_files")
map_tele(l .. "g", "git_files")
-- map_tele("<space>ff", "find_project")
map_tele("<space>ff", "search_all_files")
map_tele(l .. "w", "my_grep")
map_tele(l .. "m", "man_pages")
vim.keymap.set("n", "<leader>flg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>?", "<Cmd>Telescope frecency workspace=CWD<CR>")
-- See `:help telescope.builtin`
-- vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- vim.keymap.set("n", l .. "h", my_grep)
--
-- vim.cmd [[
--     function! Cwordsdfasdf(A, L, P)
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

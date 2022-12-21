local builtin = require('telescope.builtin')
local live_grep_args = require('telescope').extensions.live_grep_args.live_grep_args
local map = vim.keymap.set
-- grep_open_files = true,
local ui = function(message, cb)
  vim.ui.input(
    {prompt = message },
    function(input)
      return cb({search = input,  additional_args = {"--hidden"}})
    end
  )
end
map("n", "<leader>fg", function ()
  live_grep_args({
  -- WIP remember last rg search
    -- default_text = 'test',
    -- on_complete = {
    --   function(picker)
    --     local mode = vim.fn.mode()
    --     local keys = mode ~= "n" and "<ESC>" or ""
    --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys .. [[^v$<C-g>]], true, false, true), "n", true)
    --     -- should you have more callbacks, just pop the first one
    --     table.remove(picker._completion_callbacks, 1)
    --   end,
    -- }
  })
end, {desc = "Rg search with opts"})
map('n', '<leader>tr', function () builtin.resume() end, {desc = "Resume Last Search"})
map('n', '<leader>tch', function () builtin.command_history({}) end, {desc = "Search Command History"})
map('n', '<leader>pf', builtin.find_files, {desc = "Find files"})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


local log = function ()
  print("hello")
end

-- map('n', "<leader>pp", function()
--   ui("grep", builtin.grep_string)
-- end)

map('n', "<leader>pp",
  function ()
    ui('Grep for...', builtin.live_grep)
  end
)



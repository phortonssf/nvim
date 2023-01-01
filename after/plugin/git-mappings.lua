local wk = require("which-key")
wk.register({
        ['<leader>g'] = {
        name = "+Git",
   d = { "<CMD>DiffviewOpen <CR>", "Diff View"}, -- just a label. don't create any mapping
   r = { function () local count = vim.v.count  vim.cmd("DiffviewOpen HEAD~" .. vim.v.count) end, "help"},
                        -- "DiffviewOpen HEAD~" .. vim.v.count .. "<CR>" end , "Diff View"}, -- just a label. don't create any mapping
   t = { function () print ("hello ".. vim.v.count)  end, "HI"}
  }})


local wk = require("which-key")
wk.register({
        ['<leader>g'] = {
        name = "+Git",
   d = { "<CMD>DiffviewOpen <CR>", "Diff View"}, -- just a label. don't create any mapping
   r = { "<CMD>DiffviewOpen HEAD~" .. vim.v.count .. "<CR>", "Diff View"}, -- just a label. don't create any mapping
   t = { function () print ("hello ".. vim.v.count)  end, "HI"}
  }})

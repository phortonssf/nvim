local M = {
  "sindrets/diffview.nvim",
  event = "BufReadPre",
}

function M.config()
  local wk = require("which-key")

  wk.register({
    g = {
      name = "+git",
      d = {
        name = "+diffview",
        r = {
          function()
            local count = vim.v.count
            vim.cmd("DiffviewOpen HEAD~" .. vim.v.count)
          end,
          "DiffVied HEAD",
        },
        o = { ":DiffviewOpen<CR> ", "Open" },
        f = { ":DiffviewFileHistory %<CR>", "Current File" },
        { prefix = "<leader>" },
      },
    },
  }, { prefix = "<leader>" })
end
return M

-- examples:
--
-- :DiffviewFileHistory
-- :DiffviewFileHistory %
-- :DiffviewFileHistory path/to/some/file.txt
-- :DiffviewFileHistory path/to/some/directory
-- :DiffviewFileHistory include/this and/this :!but/not/this
-- :DiffviewFileHistory --range=origin..HEAD
-- :DiffviewFileHistory --range=feat/example-branch
-- :'<,'>DiffviewFileHistory

local M = {}
function M.setup() end
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<localleader>", function()
  require("which-key").show("\\")
end, { buffer = true })

local wk = require("which-key")
M.wkopts = {
  mode = "n", -- NORMAL mode
  silent = true,
  noremap = false,
  nowait = false,
}

function M.whichkey(maps, opts)
  if opts == nil then
    opts = {}
  end
  wk.register(maps, vim.tbl_extend("keep", opts, M.wkopts))
end

function M.localleader(maps, opts)
  if opts == nil then
    opts = {}
  end

  M.whichkey(
    maps,
    vim.tbl_extend("keep", opts, {
      prefix = "<localleader>",
      buffer = 0,
    })
  )
end
function M.Ftplugin()
  M.localleader({
    q = { "<cmd> DiffviewClose <cr>", "Close" },
    f = { "<cmd> DiffviewToggleFiles <cr>", "Toggle the file pane" },
  })
end
return M.Ftplugin()

local M = {}

vim.g.localleader = " "
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
      -- prefix = "<localleader>",
      buffer = 0,
    })
  )
end
function M.Ftplugin()
  local wk = require("which-key")
  wk.register({
    ["<leader>y"] = {
      name = "+Spectre",
      o = { '<cmd>lua require("spectre").toggle()<CR>', "Open" },
      -- w = { name = "word", w = { ":%sm/<C-r><C-w>//gc<Left><Left><Left>", "search and replace" } },
    },
  })
  -- M.localleader({
  --   ["leader"] = {
  --     R = { name = "replace" },
  --   },
  --   ["g?"] = { "?", "help" },
  -- })
end
return M.Ftplugin()

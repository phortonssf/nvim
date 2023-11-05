local M = {
  "windwp/nvim-spectre",
}
M.config = function()
  require("spectre").setup({
    highlight = {
      ui = "String",
      search = "Error",
      replace = "Operator",
    },
  })
end
return M

local M = {
  "mbbill/undotree",
  lazy = false,
}

function M.config()
  vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle)
end

return M

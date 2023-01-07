local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
}

function M.config()
  require("persistence").setup(
    {
      dir = "/home/digitaldive/.config/nvim/sessions",
      options = {
        "buffers",
        "curdir",
        "tabpages",
        "winsize",
        "help",
      },
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  )
end

return M

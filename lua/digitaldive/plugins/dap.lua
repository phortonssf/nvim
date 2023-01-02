-- -- DEBUGGER

return {
  { "mfussenegger/nvim-dap" },
  --   -- use 'Pocco81/dap-buddy.nvim'
  --   -- use 'theHamsta/nvim-dap-virtual-text'
  --   -- https://github.com/NHKK/devsetup/blob/main/lua/user/DAP/languages/typescript.lua
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-treesitter/nvim-treesitter",
      "theHamsta/nvim-dap-virtual-text",
      "mxsdev/nvim-dap-vscode-js",
      "nvim-telescope/telescope-dap.nvim",
      {
        "microsoft/vscode-js-debug",
        tag = "v1.72.0",
        lazy = true,
        build = "npm install --legacy-peer-deps && npm run compile",
      },
    },
    config = function()
      require("digitaldive.dap")
    end,
  },
}

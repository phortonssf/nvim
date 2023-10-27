local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  event = "BufReadPre",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
}

function M.config()
  -- Setup language servers.
  local lsp_zero = require("lsp-zero")

  lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
    require("digitaldive.plugins.lsp.keys").setup(client, bufnr)
    require("digitaldive.plugins.lsp.diagnostics").setup()
  end)

  ---
  -- Replace these language servers
  -- with the ones you have installed in your system
  require("lspconfig").tsserver.setup({})
  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  require("lspconfig").rust_analyzer.setup({})
end

return M

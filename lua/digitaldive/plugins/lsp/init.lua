local M = {
  "VonHeikemen/lsp-zero.nvim",
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
  require("mason")
  require("digitaldive.plugins.lsp.diagnostics").setup()

  local lsp = require("lsp-zero")
  lsp.preset("recommended")
  lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
  })
  -- lsp.use("tsserver", {})
  lsp.nvim_workspace()
  -- lsp.on_attach()
  local function on_attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("digitaldive.plugins.lsp.formatting").setup(client, bufnr)
    require("digitaldive.plugins.lsp.keys").setup(client, bufnr)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  --
  -- ---@type _.lspconfig.options
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  lsp.setup_servers({
    "html",
    "cssls",
    "tsserver",
    "eslint",
    "sumneko_lua",
    opts = options,
  })

  lsp.setup()
  -- ---@type lspconfig.options
  -- local servers = {
  --   ansiblels = {},
  --   bashls = {},
  --   clangd = {},
  --   cssls = {},
  --   dockerls = {},
  --   tsserver = {},
  --   svelte = {},
  --   eslint = {},
  --   html = {},
  --   jsonls = {
  --     on_new_config = function(new_config)
  --       new_config.settings.json.schemas = new_config.settings.json.schemas or {}
  --       vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
  --     end,
  --     settings = {
  --       json = {
  --         format = {
  --           enable = true,
  --         },
  --         validate = { enable = true },
  --       },
  --     },
  --   },
  --   gopls = {},
  --   marksman = {},
  --   pyright = {},
  --   rust_analyzer = {
  --     settings = {
  --       ["rust-analyzer"] = {
  --         cargo = { allFeatures = true },
  --         checkOnSave = {
  --           command = "clippy",
  --           extraArgs = { "--no-deps" },
  --         },
  --       },
  --     },
  --   },
  --   yamlls = {},
  --   sumneko_lua = {
  --     settings = {
  --       root_dir = ".git",
  --       Lua = {
  --         -- root_dir = vim.nvim_lsp.util.root_pattern(".git"),
  --         workspace = { checkThirdParty = false },
  --         telemetry = { enable = false },
  --       },
  --     },
  --
  --     -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
  --     -- single_file_support = true,
  --     -- Lua = {
  --     --   workspace = { checkThirdParty = false },
  --     --   telemetry = { enable = false },
  --     -- },
  --     --  },
  --   },
  --   teal_ls = {},
  --   vimls = {},
  --   -- tailwindcss = {},
  -- }
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true,
  -- }
  --
  -- ---@type _.lspconfig.options
  -- local options = {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   flags = {
  --     debounce_text_changes = 150,
  --   },
  -- }
  --
  -- for server, opts in pairs(servers) do
  --   opts = vim.tbl_deep_extend("force", {}, options, opts or {})
  --   if server == "tsserver" then
  --     require("typescript").setup({ server = opts })
  --   else
  --     require("lspconfig")[server].setup(opts)
  --   end
  -- end
  --
  require("digitaldive.plugins.null-ls").setup(options)
end

return M

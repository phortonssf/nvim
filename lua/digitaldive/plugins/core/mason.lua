return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "Γ£ô",
          package_pending = "Γ₧£",
          package_uninstalled = "Γ£ù",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "gopls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })
  end,
}

-- local M = {
--   "williamboman/mason.nvim",
-- }
--
-- M.tools = {
--   "prettierd",
--   "stylua",
--   "selene",
--   "luacheck",
--   "eslint_d",
--   "shellcheck",
--   -- "deno",
--   "shfmt",
--   "black",
--   "isort",
--   "flake8",
-- }
--
-- function M.check()
--   local mr = require("mason-registry")
--   for _, tool in ipairs(M.tools) do
--     local p = mr.get_package(tool)
--     if not p:is_installed() then
--       p:install()
--     end
--   end
-- end
--
-- function M.config()
--   require("mason").setup()
--   M.check()
--   require("mason-lspconfig").setup({
--     automatic_installation = true,
--   })
-- end
--
-- return M

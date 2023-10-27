local M = {
  "stevearc/conform.nvim",
}

M.config = function()
  local conform = require("conform")

  conform.setup({
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  })

  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end, { desc = "Format file or range (in visual mode)" })
end

return M

-- local util = require("util")
--
-- local M = {}
--
-- -- vim.lsp.handlers["textDocument/hover"] = function(_, method, result)
-- --   print(vim.inspect(result))
-- -- end
--
-- M.autoformat = true
--
-- function M.toggle()
--   M.autoformat = not M.autoformat
--   if M.autoformat then
--     util.info("enabled format on save", "Formatting")
--   else
--     util.warn("disabled format on save", "Formatting")
--   end
-- end
--
-- function M.format()
--   if M.autoformat then
--     if vim.lsp.buf.format then
--       vim.lsp.buf.format()
--     else
--       vim.lsp.buf.formatting_sync()
--     end
--   end
-- end
--
-- function M.setup(client, buf)
--   local ft = vim.api.nvim_buf_get_option(buf, "filetype")
--   local nls = require("digitaldive.plugins.null-ls")
--
--   local enable = false
--   if nls.has_formatter(ft) then
--     enable = client.name == "null-ls"
--   else
--     enable = not (client.name == "null-ls")
--   end
--
--   if client.name == "tsserver" then
--     enable = false
--   end
--
--   -- util.info(client.name .. " " .. (enable and "yes" or "no"), "format")
--
--   client.server_capabilities.documentFormattingProvider = enable
--   -- format on save
--   if client.server_capabilities.documentFormattingProvider then
--     vim.cmd([[
--       augroup LspFormat
--         autocmd! * <buffer>
--         autocmd BufWritePre <buffer> lua require("digitaldive.plugins.lsp.formatting").format()
--       augroup END
--     ]])
--   end
-- end
--
-- return M

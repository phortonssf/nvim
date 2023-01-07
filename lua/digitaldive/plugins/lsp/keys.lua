local wk = require("which-key")

local M = {}

function M.setup(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        {
          cond = client.name == "tsserver",
          o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" },
          R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" },
        },
        r = {
          function()
            require("inc_rename")
            return ":IncRename " .. vim.fn.expand("<cword>")
          end,
          "Rename",
          cond = cap.renameProvider,
          expr = true,
        },
        a = {
          { vim.lsp.buf.code_action, "Code Action" },
          { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
        },
        f = {
          {
            require("digitaldive.plugins.lsp.formatting").format,
            "Format Document",
            cond = cap.documentFormatting,
          },
          {
            require("digitaldive.plugins.lsp.formatting").format,
            "Format Range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
        -- h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        D = { "<cmd> lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
        l = {
          name = "+lsp",
          i = { "<cmd>LspInfo<cr>", "Lsp Info" },
          a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
          r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
          l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
        },
        d = {
          name = "+diagnostic",
          d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
          r = { "<cmd>Telescope lsp_references<cr>", "References" },
          R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
          D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
          I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
          t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
          f = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
        },
      },
    },
    -- ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
    -- ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
    ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
    ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev Error" },
    ["[w"] = {
      "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
      "Next Warning",
    },
    ["]w"] = {
      "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
      "Prev Warning",
    },
  }

  wk.register(keymap)
end

return M

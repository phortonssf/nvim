-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- delete no name buffers
autocmd("BufHidden", {
  desc = "Delete [No Name] buffers",
  callback = function(event)
    if event.file == "" and vim.bo[event.buf].buftype == "" and not vim.bo[event.buf].modified then
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, event.buf, {})
      end)
    end
  end,
})
local highlight_group = augroup("yankhighlight", { clear = true })
autocmd("textyankpost", {
  callback = function()
    vim.highlight.on_yank()
    vim.api.nvim_command("norm my") -- create mark after yank
  end,
  group = highlight_group,
  pattern = "*",
})
-- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   command = "source <afile> | PackerCompile | vim.lsp.client.stop()",
--   group = packer_group,
--   pattern = vim.fn.expand("$MYVIMRC"),
-- })

-- create new netrw keybinds
-- https://www.reddit.com/r/neovim/comments/ud2w4k/how_to_remap_netrw_to_n_in_keybindingsinitlua/
autocmd("filetype", {
  pattern = "netrw",
  desc = "Better mappings for netrw",
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
    end

    -- edit new file
    bind("n", "%")

    -- rename file
    bind("r", "R")
  end,
})
autocmd("VimEnter", {
  callback = function()
    -- require('persistence').load({ last = true})
  end,
})

-- WIP Toggle LSP
-- https://www.reddit.com/r/neovim/comments/lqj21o/how_to_temporarily_disable_lsp/
-- function M.LspSwap()
--     if vim.b.lsp_enabled == false then
--        local check_function = function(bufnr, _)
--     local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'lsp_enabled')
--     -- No buffer local variable set, so just enable by default
--     if not ok then
--         return true
--     end
--
--     return result
-- end
--
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--         underline = check_function,
--         signs = false,
--         update_in_insert = false,
--         virtual_text = check_function
--     }) M.LspShow()
--     else
--         M.LspHide()
--     end
-- end
--
-- vim.api.nvim_buf_set_keymap(0, 'n', '<leader>Cdd', '<cmd>lua LspSwap()<CR>', {noremap = true})
--

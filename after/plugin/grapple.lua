
require("grapple").setup({
    ---@type "debug" | "info" | "warn" | "error"
    log_level = "warn",

    ---Can be either the name of a builtin scope resolver,
    ---or a custom scope resolver
    ---@type string | Grapple.ScopeResolver
    scope = "git",

    ---Window options used for the popup menu
    popup_options = {
        relative = "editor",
        width = 60,
        height = 12,
        style = "minimal",
        focusable = false,
        border = "single",
    },

    integrations = {
        ---Support for saving tag state using resession.nvim
        resession = false,
    },
})


vim.keymap.set("n", "<C-e>", "<Nop>")
vim.keymap.set("n", "<C-e>", require("grapple").popup_tags)
vim.keymap.set("n", "<leader>m", require("grapple").toggle, {})
vim.keymap.set("n", "<leader>j", function()
    require("grapple").select({ key = "{main}" })
end, {})

   -- if empty(filter(getwininfo(), 'v:val.quickfix'))
-- vim.api.nvim_set_keymap("n", "]b", function ()     end, {expr = true, noremap = true})
-- vim.keymap.set("n", "<C-j>", function () require("grapple").select({ key = 1 }) end)
-- vim.keymap.set("n", "<C-k>", function () require("grapple").select({ key = 2 }) end)
-- vim.keymap.set("n", "<C-l>", function () require("grapple").select({ key = 3 }) end)
-- vim.keymap.set("n", "<F13>", function () require("grapple").select({ key = 4 }) end)

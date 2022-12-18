vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", {desc = "search and replace word under cursor"})
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",{desc = 'tmux new session'})
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz",{desc = "quickfix next in list"})
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz",{desc = "quickfix next in list"})

vim.g.mapleader = ""

vim.keymap.set({"n","v","x"}, "noremap <C-_> :Commentary <CR>", {desc = "comment line with ctrl-/"})
-- vim.api.nvim_get_keymap('n')

--sdfkkkj Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
wk.register({
  ["<leader>p"] = "which_key_ignore",
  ["<leader>P"] = "which_key_ignore",
  ["<leader>d"] = "which_key_ignore",
})
local keymap = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true,
}
--backspace as another leader
keymap("n", "<bs>", "<space>", { noremap = false })
-- vim.keymap.set("n", "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>')
--remove binds
vim.keymap.del("n", "<c-_>")
keymap("n", "<c-w>r", "<cmd>vs#<cr>", {})

--esc
keymap("i", "jk", "<esc>", {})

keymap("i", "jj", "<esc>", {})
-- vim.keymap.del("n", "<c-/")
keymap("i", "<f8>", "<cmd> echo 'insert help '<cr>", {})
keymap("n", "<f8>", "<cmd> echo 'normal help'<cr>", {})
-- delete to black hole
keymap("v", "<c-_>", "gcc", {})
keymap("n", "<c-_>", "gcc", {})
keymap("n", "d", '"_d', opt)
keymap("v", "d", '"_d', opt)
keymap("n", "d", '"_d', opt)
keymap("n", "c", '"_c', opt)
keymap("v", "c", '"_c', opt)
keymap("n", "c", '"_c', opt)
keymap("n", "x", '"_x', opt)

keymap("n", "H", "^", opt)
keymap("n", "L", "$", opt) --yank end of line
keymap("n", "Y", "y$", opt)
keymap("n", "<leader>p", "o<esc>p", { desc = "paste below line" })
keymap("n", "<leader>P", "ko<esc>p", { desc = "paste above line" })
--cut
keymap("v", "<leader>d", '"+d', opt)
keymap("n", "<leader>dd", "yydd", opt)
keymap("n", "<leader>d", '"+d', opt)
keymap("n", "vp", "`[v`]", { desc = "highlight last paste", noremap = true, silent = true })
-- visual end of line
keymap("n", "V", "v$", opt)
keymap("n", "vv", "V", opt)
-- Prime binds center on scroll"
keymap("n", "n", "nzzzv", opt)
keymap("n", "N", "Nzzzv", opt)
keymap("n", "gg", "ggzz", opt)
keymap("n", "G", "Gzz", opt)
--newline
keymap("n", "<leader>O", "O<esc>", opt)
-- keymap("n", "<C-x>", ":bp<Bar>bd #<Cr>", opt)
-- keymap("J", "mzJ`z", opt)
--delete matching paren, curly
keymap("n", "<leader>d%", ":norm %x`'x<cr>", opt)
--harpoon
keymap("n", "<c-j>", ":lua require('harpoon.ui').nav_file(1)<cr>", opt)
keymap("n", "<c-k>", ":lua require('harpoon.ui').nav_file(2)<cr>", opt)
keymap("n", "<c-l>", ":lua require('harpoon.ui').nav_file(3)<cr>", opt)
-- keymap("n", "F13", ":lua require('harpoon.ui').nav_file(4)<CR>", opt)
-- ctrl-; is f13 kinesis bind
keymap("n", "<F13>", ":lua require('harpoon.ui').nav_file(4)<CR>", opt)
keymap("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opt)
keymap("n", "<leader>m", ":lua require('harpoon.mark').toggle_file()<CR>", opt)
---GIT
-- keymap("n", "<leader>gd", "<cmd> DiffviewFileHistory % <cr>", { desc = "Diff File" })
-- keymap("n", "<leader>gD", "<cmd> DiffviewFileHistory <cr>", { desc = "Diff Branch" })
keymap("n", "<leader>gs", "<cmd>to vert G<cr>", { silent = true, desc = "Fugitive", noremap = true })
keymap("n", "<leader>gc", "<cmd>G commit<cr>", opt)
--Undo to Last Write
keymap(
  "n",
  "<leader>U",
  ":ea 1f<CR>  | :echo 'Undo until last write'<CR>",
  { desc = "undo to write", noremap = true, silent = true }
)
keymap("n", "Q", "@q", { desc = "Macro" })
--keymap"n", "<A-g>", "<cmd> !$EDITOR | "
-- move visual selectio 4444444n left/right
keymap("n", "<", "<gv", opt)
keymap("v", "<", "<gv", opt)
keymap("n", ">", ">gv", opt)
keymap("v", ">", ">gv", opt)

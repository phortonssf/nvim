
require("yanky").setup({
  ring = {
    history_length = 100,
    storage = "memory",
    sync_with_numbered_registers = true,
  },
  system_clipboard = {
    sync_with_ring = true,
  },
})


vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")


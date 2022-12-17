-- Gitsigns
local map = require("digitaldive.utils").map
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
map('n', '<leader>hu', ':Gitsigns undo_stage_hunk')
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n <leader>nh'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    ['n <leader>hn'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

    ['n ]c'] = "<cmd>Gitsigns next_hunk<CR>",
    ['n ]C'] = "<cmd>Gitsigns prev_hunk<CR>",
    ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<cr>',
    }
}

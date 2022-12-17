-- Gitsigns
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

    ['n [c'] = "<cmd>Gitsigns prev_hunk<CR>",
    ['n ]c'] = "<cmd>Gitsigns prev_hunk<CR>",
    ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>; <cmd>echo "staged hunk"'
    }
}

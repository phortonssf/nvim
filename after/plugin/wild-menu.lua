
-- vim.o.wildcharm = '<C-n>'
local wilder = require('wilder')
wilder.setup({
   modes = {':', '/', '?'},
 enable_cmdline_enter = 1,
  next_key = '<C-n>',
  previous_key = '<C-p>',
  accept_key  = '<Enter>',
  reject_key = '<C-space>'
})
wilder.set_option('pipeline', {
  wilder.branch(
     wilder.python_file_finder_pipeline({
      -- to use ripgrep : {'rg', '--files'}
      -- to use fd      : {'fd', '-tf'}
      file_command = {'find', '.', '-type', 'f', '-printf', '%P\n'},
      -- to use fd      : {'fd', '-td'}
      dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      -- found at https://github.com/nixprime/cpsm
      filters = {'fuzzy_filter', 'difflib_sorter'},
    }),
    wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'python',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 2,
    }),
    wilder.substitute_pipeline({
      pipeline = wilder.python_search_pipeline({
        skip_cmdtype_check = 1,
        pattern = wilder.python_fuzzy_pattern({
          start_at_boundary = 0,
        }),
      }),
    }),
    wilder.python_search_pipeline({
      -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      pattern = wilder.python_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      sorter = wilder.python_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#python_search() for more details
      engine = 're',
    }),
    wilder.python_search_pipeline({
      pattern = wilder.python_fuzzy_pattern({
        start_at_boundary = 0,
      }),
    })
  ),
})
local highlighters = {
  wilder.pcre2_highlighter(),
  wilder.basic_highlighter(),
}
local ogpink ='#f4468f'
local pink ='#c6a0f6'
local blue = "#7dc4e4"
local accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = pink }})
local highlights = { accent = accent}


-- POPUP menu setup
local popmenenu = wilder.popupmenu_border_theme({
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
  highlighter = highlighters,
  highlights = {
    accent = accent,
    border = 'normal', -- highlight to use for the border
  },
  -- 'single', 'double', 'rounded' or 'solid'
  -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
  border = 'rounded',
  pumblend = 20
})


-- renders foh each modes
wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer(popmenenu),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = highlighters,
    highlights = highlights,
    pumblend = 20
  }),
}))

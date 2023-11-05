local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- "kdheepak/tabline.nvim",
  },
}

function M.config()
  --
  -- Set lualine as statusline
  -- See `:help lualine.txt`
  -- require('lualine').setup {
  --   options = {
  --     icons_enabled = false,
  --     theme = 'cattpuccino',
  --     component_separators = '|',
  --     section_separators = '',
  --   },
  -- }

  -- Bubbles config for lualine
  -- Author: lokesh-krishna
  -- MIT license, see LICENSE for more details.
  function parent_dir()
    local path = vim.fn.expand("%:h:t") .. "/" .. vim.fn.expand("%:t")
    return path
  end
  parent_dir()
-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

  local bubbles_theme = {
    normal = {
      a = { fg = colors.black, bg = colors.violet },
      b = { fg = colors.white, bg = colors.grey },
      c = { fg = colors.black, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
      a = { fg = colors.white, bg = colors.black },
      b = { fg = colors.white, bg = colors.black },
      c = { fg = colors.black, bg = colors.black },
    },
  }
  local config = {
    options = {
      theme = "catppuccin",
      component_separators = "|",
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = {
        { parent_dir },
        {
          file_status = true,
          "branch",
          symbols = {
            modified = " ●", -- Text to show when the buffer is modified
            alternate_file = "#", -- Text to show to identify the alternate file
            directory = "", -- Text to show when the buffer is a directory
          },
        },
      },
      lualine_c = {},
      -- lualine_c = { vim.loop.cwd() },
      lualine_x = {},
      lualine_y = { "filetype", "progress" },
      -- lualine_z = {
      --   -- { '' ,
      --   { "CWD" },
      --   { vim.loop.cwd, separator = { right = "" }, left_padding = 2 },
      -- },
    },
    winbar = {
      -- lualine_a = {},
      lualine_a = {
        {
          "diff",
          colored = true, -- Displays a colored diff status if set to true
          diff_color = {
            -- Same color values as the general color option can be used here.
            added = "LuaLineDiffAdd", -- Changes the diff's added color
            modified = "LuaLineDiffChange", -- Changes the diff's modified color
            removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
          },
          symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
          source = nil, -- A function that works as a data source for diff.
          -- It must return a table as such:
          --   { added = add_count, modified = modified_count, removed = removed_count }
          -- or nil on failure. count <= 0 won't be displayed.
        },
      },
      lualine_b = {},
      lualine_c = { parent_dir },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    -- tabline = {
    -- lualine_a = {{path = 3,  'filename'}},
    -- lualine_a = {{ parent_dir, "filename", file_status = true,  symbols = {
    --       modified = '[+]',      -- Text to show when the file is modified.
    --       readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    --       unnamed = '[No Name]', -- Text to show for unnamed buffers.
    --       newfile = '[New]',     -- Text to show for new created file before first writting
    --     }}},
    -- lualine_c = { require("tabline").tabline_buffers },
    -- lualine_x = { require("tabline").tabline_tabs },
    -- lualine_b = {
    --   {
    --     "buffers",
    --     use_mode_colors = true,
    --     show_filename_only = true, -- Shows shortened relative path when set to false.
    --     hide_filename_extension = false, -- Hide filename extension when set to true.
    --     show_modified_status = true, -- Shows indicator when the buffer is modified.
    --     mode = 2, -- 0: Shows buffer name
    --     -- 1: Shows buffer index
    --     -- 2: Shows buffer name + buffer index
    --     -- 3: Shows buffer number
    --     -- 4: Shows buffer name + buffer number
    --
    --     max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
    --     -- it can also be a function that returns
    --     filetype_names = {
    --       TelescopePrompt = "Telescope",
    --       dashboard = "Dashboard",
    --       packer = "Packer",
    --       fzf = "FZF",
    --       alpha = "Alpha",
    --     }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
    --     -- buffers_color = {
    --     --   -- Same values as the general color option can be used here.
    --     --   active = 'lualine_{section}_normal',     -- Color for active buffer.
    --     --   inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
    --     -- },
    --     symbols = {
    --       modified = " ●", -- Text to show when the buffer is modified
    --       alternate_file = "#", -- Text to show to identify the alternate file
    --       directory = "", -- Text to show when the buffer is a directory
    --     },
    --   },
    -- },
    -- lualine_c = {},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {},
    -- },
    extensions = { "nvim-dap-ui", "fugitive", "quickfix" },
  }
  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }
  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end
  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end
  ins_right({
    "diff",
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = "柳 ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  })
  ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  })

  require("lualine").setup(config)
end

return M

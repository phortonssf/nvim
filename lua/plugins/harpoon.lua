-- return {
--   "ThePrimeagen/harpoon",
--   priority = 100,
--   -- opts = {
--   --   global_settings = {
--   --     tabline = true,
--   --     tabline_prefix = "   ",
--   --     tabline_suffix = "   ",
--   --   },
--   -- },
--
--   config = function()
--     require("harpoon").setup({
--       tabline = true,
--       menu = {
--         width = vim.api.nvim_win_get_width(0) - 20,
--       },
--       global_settings = {
--         -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
--         save_on_toggle = false,
--
--         -- saves the harpoon file upon every change. disabling is unrecommended.
--         save_on_change = true,
--
--         -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
--         enter_on_sendcmd = false,
--
--         -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
--         tmux_autoclose_windows = false,
--
--         -- filetypes that you want to prevent from adding to the harpoon list menu.
--         excluded_filetypes = { "harpoon" },
--
--         -- set marks specific to each git branch inside git repository
--         mark_branch = false,
--
--         -- enable tabline with harpoon marks
--         tabline = true,
--         tabline_prefix = "   ",
--         tabline_suffix = "   ",
--       },
--     })
--     vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
--     vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
--     vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
--     vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
--     vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
--     vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
--   end,
-- }

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      key = function()
        return vim.loop.cwd()
      end,
    },
  },
  keys = {
    {
      "<leader>H",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon file",
    },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon quick menu",
    },
    {
      "<C-j>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon to file 1",
    },
    {
      "<C-k>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon to file 2",
    },
    {
      "<C-l>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon to file 3",
    },
    {
      "<F13>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon to file 4",
    },
    {
      '<C-"',
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon to file 5",
    },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })
    vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
    vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
    vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
  end,
}

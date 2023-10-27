return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {

      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    priority = 100,
    config = function()
      require("digitaldive.telescope.setup")
      require("digitaldive.telescope.mappings")
    end,
  },
  -- "nvim-telescope/telescope-file-browser.nvim",
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   config = function()
  --     require("telescope").load_extension("frecency")
  --   end,
  --   dependencies = { "kkharji/sqlite.lua" },
  -- },
  -- {
  --   "princejoogie/dir-telescope.nvim",
  --   -- telescope.nvim is a required dependency
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require("dir-telescope").setup({
  --       -- these are the default options set
  --       display_path = { "absolute" },
  --       hidden = true,
  --       no_ignore = false,
  --       show_preview = true,
  --     })
  --   end,
  -- },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
}

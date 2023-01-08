return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {

      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    priority = 100,
    config = function()
      require("digitaldive.telescope.setup")
      require("digitaldive.telescope.mappings")
    end,
  },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
}

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type flash.config
  opts = {
    search = {
      incremental = false,
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "toggle flash search" },
  },
}
